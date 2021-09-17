/*
 *  The scanner definition for COOL.
 */

/*
 *  Stuff enclosed in %{ %} in the first section is copied verbatim to the
 *  output, so headers and global definitions are placed here to be visible
 * to the code in the file.  Don't remove anything that was here initially
 */
%{
#include <cool-parse.h>
#include <stringtab.h>
#include <utilities.h>

/* The compiler assumes these identifiers. */
#define yylval cool_yylval
#define yylex  cool_yylex

/* Max size of string constants */
#define MAX_STR_CONST 1025
#define YY_NO_UNPUT   /* keep g++ happy */

extern FILE *fin; /* we read from this file */

/* define YY_INPUT so we read from the FILE fin:
 * This change makes it possible to use this scanner in
 * the Cool compiler.
 */
#undef YY_INPUT
#define YY_INPUT(buf,result,max_size) \
  if ( (result = fread( (char*)buf, sizeof(char), max_size, fin)) < 0) \
    YY_FATAL_ERROR( "read() in flex scanner failed");

char string_buf[MAX_STR_CONST]; /* to assemble string constants */
char *string_buf_ptr;

extern int curr_lineno;

extern YYSTYPE cool_yylval;

/*
 *  Add Your own definitions here
 */
void clear_str_buff();
void add_char(char c);
int comment_depth = 0;
int str_len = 0;
%}

%option noyywrap

/*
 * Define names for regular expressions here.
 */

INTEGER       [0-9]
LOWER         [a-z]
UPPER         [A-Z]
AlNum         [_a-zA-Z0-9]
   
 /* exclusive state */
%x LINE_COMMENT 
%x COMMENT
%x STRING

%%
 /*
  * Define regular expressions for the tokens of COOL here. Make sure, you
  * handle correctly special cases, like:
  *   - Nested comments
  *   - String constants: They use C like systax and can contain escape
  *     sequences. Escape sequence \c is accepted for all characters c. Except
  *     for \n \t \b \f, the result is c.
  *   - Keywords: They are case-insensitive except for the values true and
  *     false, which must begin with a lower-case letter.
  *   - Multiple-character operators (like <-): The scanner should produce a
  *     single token for every such operator.
  *   - Line counting: You should keep the global variable curr_lineno updated
  *     with the correct line number
  */


 /* line comments ---------------------------------*/

"--" {BEGIN(LINE_COMMENT);} /* start to process line comment */
<LINE_COMMENT><<EOF>> {BEGIN(INITIAL);} /* end of file, no need to increment line number */
<LINE_COMMENT>\n {
  /* exit line comment state */
  curr_lineno++;
  BEGIN(INITIAL);
}
<LINE_COMMENT>. {}
 /* comments  ---------------------------------------*/
"*)"  {
  cool_yylval.error_msg = "Unmatched *)";
  return ERROR;
}
"(*"  {
  comment_depth++;
  BEGIN(COMMENT);
}
<COMMENT>"(*" {
  comment_depth++;
} 
<COMMENT>"*)" {
  if(--comment_depth==0){
    BEGIN(INITIAL);
  }
}
<COMMENT>\n {
  curr_lineno++;
}
<COMMENT><<EOF>>  {
  BEGIN(INITIAL);
  comment_depth = 0;
  cool_yylval.error_msg = "EOF in comment";
  return ERROR;
} 
<COMMENT>.

 /* string-------------------------------------------*/

\"  {
  string_buf_ptr = string_buf;
  clear_str_buff();
  BEGIN(STRING);
}

<STRING>\"  {
  BEGIN(INITIAL);
  str_len++;
  add_char('\0');
  if(str_len>MAX_STR_CONST){
    cool_yylval.error_msg = "String constant too long";
    clear_str_buff();
    return ERROR;
  }
  cool_yylval.symbol = stringtable.add_string(string_buf_ptr);
  clear_str_buff();
  return STR_CONST;
}
<STRING>\\\n {
  curr_lineno++;
  str_len++;
  add_char('\n');
}
<STRING>\\n {
  str_len++;
  add_char('\n');
}
<STRING>\\t {
  str_len++;
  add_char('\t');
}
<STRING>\\b {
  str_len++;
  add_char('\b');
}
<STRING>\\f {
  str_len++;
  add_char('\f');
}
<STRING>\n  {
  curr_lineno++;
  BEGIN(INITIAL);
  cool_yylval.error_msg = "Unterminated string constant";
  clear_str_buff();
  return ERROR;
}
<STRING>\0  {
  BEGIN(INITIAL);
  cool_yylval.error_msg = "illegal null in string";
  clear_str_buff();
  return ERROR;
}
<STRING>\\\0  {
  BEGIN(INITIAL);
  cool_yylval.error_msg = "illegal excaped null in string";
  clear_str_buff();
  return ERROR;
}
<STRING><<EOF>>  {
  cool_yylval.error_msg = "EOF in string constant";
  clear_str_buff();
  BEGIN(INITIAL);
  return ERROR;
}
<STRING>\\(.|\n) {
  str_len++;
  add_char(yytext[1]);
}

<STRING>[^\\\n\"]   {
  str_len++;
  add_char(yytext[0]);
}
 /* keywords -----------------------------------------------*/

[Cc][Ll][Aa][Ss][Ss] {return CLASS;}
[Ee][Ll][Ss][Ee]  {return ELSE;}
[Ff][Ii]  {return FI;}
[Ii][Ff]  {return IF;}
[Ii][Nn]	{return IN;}
[Ii][Nn][Hh][Ee][Rr][Ii][Tt][Ss] {return INHERITS;}
[Ll][Ee][Tt]  {return LET;}
[Ll][Oo][Oo][Pp]  {return LOOP;}
[Pp][Oo][Oo][Ll]  {return POOL;}
[Tt][Hh][Ee][Nn]  {return THEN;}
[Ww][Hh][Ii][Ll][Ee]  {return WHILE;}
[Cc][Aa][Ss][Ee]  {return CASE;}
[Ee][Ss][Aa][Cc]  {return ESAC;}
[Oo][Ff]  {return OF;}
[Nn][Ee][Ww]  {return NEW;}
[Ii][Ss][Vv][Oo][Ii][Dd]  {return ISVOID;}
[Nn][Oo][Tt]  {return NOT;}
"=>"  {return DARROW;}
"<-"  {return ASSIGN;}
"<="  {return LE;}
t[Rr][Uu][Ee] {
  cool_yylval.boolean = true;
  return BOOL_CONST;
}
f[Aa][Ll][Ss][Ee] {
  cool_yylval.boolean = false;
  return BOOL_CONST;
}

 /* arithmetic things----------------------------*/

{INTEGER}+  {
  cool_yylval.symbol = inttable.add_string(yytext,yyleng);
  return INT_CONST;
}

[\+\-\*\/\~\<\=\(\)\:\;\@\{\}\.\,]  {
  return (int) yytext[0];
}

 /* typeId & objId--------------------------------*/

{UPPER}{AlNum}* {
  cool_yylval.symbol = idtable.add_string(yytext,yyleng);
  return TYPEID;
}

{LOWER}{AlNum}* {
  cool_yylval.symbol = idtable.add_string(yytext,yyleng);
  return OBJECTID;
}


 /* other things-----------------------------------*/
\n  {
  curr_lineno++;
}

[ \f\r\v\t]+  {}

 /* illegal character not included above */
. {
  cool_yylval.error_msg = yytext;
  return ERROR;
}

%%

  void clear_str_buff(){
    str_len = 0;
    *string_buf_ptr = '\0';
  }
  void add_char(char c){
    if(str_len<=MAX_STR_CONST)
      string_buf[str_len-1] = c;
  }