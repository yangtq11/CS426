/*
 *  cool.y
 *              Parser definition for the COOL language.
 *
 */
%{
#include <iostream>
#include "cool-tree.h"
#include "stringtab.h"
#include "utilities.h"

/* Add your own C declarations here */


/************************************************************************/
/*                DONT CHANGE ANYTHING IN THIS SECTION                  */

extern int yylex();           /* the entry point to the lexer  */
extern int curr_lineno;
extern char *curr_filename;
Program ast_root;            /* the result of the parse  */
Classes parse_results;       /* for use in semantic analysis */
int omerrs = 0;              /* number of errors in lexing and parsing */

/*
   The parser will always call the yyerror function when it encounters a parse
   error. The given yyerror implementation (see below) justs prints out the
   location in the file where the error was found. You should not change the
   error message of yyerror, since it will be used for grading puproses.
*/
void yyerror(const char *s);

/*
   The VERBOSE_ERRORS flag can be used in order to provide more detailed error
   messages. You can use the flag like this:

     if (VERBOSE_ERRORS)
       fprintf(stderr, "semicolon missing from end of declaration of class\n");

   By default the flag is set to 0. If you want to set it to 1 and see your
   verbose error messages, invoke your parser with the -v flag.

   You should try to provide accurate and detailed error messages. A small part
   of your grade will be for good quality error messages.
*/
extern int VERBOSE_ERRORS;

%}

/* A union of all the types that can be the result of parsing actions. */
%union {
  Boolean boolean;
  Symbol symbol;
  Program program;
  Class_ class_;
  Classes classes;
  Feature feature;
  Features features;
  Formal formal;
  Formals formals;
  Case case_;
  Cases cases;
  Expression expression;
  Expressions expressions;
  char *error_msg;
}

/* 
   Declare the terminals; a few have types for associated lexemes.
   The token ERROR is never used in the parser; thus, it is a parse
   error when the lexer returns it.

   The integer following token declaration is the numeric constant used
   to represent that token internally.  Typically, Bison generates these
   on its own, but we give explicit numbers to prevent version parity
   problems (bison 1.25 and earlier start at 258, later versions -- at
   257)
*/
%token CLASS 258 ELSE 259 FI 260 IF 261 IN 262 
%token INHERITS 263 LET 264 LOOP 265 POOL 266 THEN 267 WHILE 268
%token CASE 269 ESAC 270 OF 271 DARROW 272 NEW 273 ISVOID 274
%token <symbol>  STR_CONST 275 INT_CONST 276 
%token <boolean> BOOL_CONST 277
%token <symbol>  TYPEID 278 OBJECTID 279 
%token ASSIGN 280 NOT 281 LE 282 ERROR 283

/*  DON'T CHANGE ANYTHING ABOVE THIS LINE, OR YOUR PARSER WONT WORK       */
/**************************************************************************/
 
   /* Complete the nonterminal list below, giving a type for the semantic
      value of each non terminal. (See section 3.6 in the bison 
      documentation for details). */

/* Declare types for the grammar's non-terminals. */
%type <program> program
%type <classes> class_list
%type <class_> class

/* You will want to change the following line. */
%type <feature> feature
%type <features> feature_list
%type <features> real_feature_list
%type <formal> formal
%type <formals> formal_list
%type <expressions> para_list
%type <expressions> exprs_with_semicolon
%type <expression> let_exprs
%type <case_> case_single_expr
%type <cases> case_exprs
%type <expression> assign_expr
%type <expression> expr

/* Precedence declarations go here. */
%left LET
%right ASSIGN
%left NOT
%nonassoc LE '<' '='
%left '+' '-'  
%left '*' '/'
%left ISVOID
%left '~' 
%left '@' 
%left '.' 

%%
/* 
   Save the root of the abstract syntax tree in a global variable.
*/
program : class_list { ast_root = program($1); }
        ;

class_list
        : class            /* single class */
                { $$ = single_Classes($1); }
        | class_list class /* several classes */
                { $$ = append_Classes($1,single_Classes($2)); }
        | error ';'
                { $$ = nil_Classes(); yyerrok;}
        | class_list error ';'
                { $$ = $1; yyerrok;}
        ;

/* If no parent is specified, the class inherits from the Object class. */
class  : CLASS TYPEID '{' feature_list '}' ';'
                { $$ = class_($2,idtable.add_string("Object"),$4,
                              stringtable.add_string(curr_filename)); }
        | CLASS TYPEID INHERITS TYPEID '{' feature_list '}' ';'
                { $$ = class_($2,$4,$6,stringtable.add_string(curr_filename)); }
        | CLASS error '{' feature_list '}' ';'          /* since no nil_Class here, I can only use NULL */
                { $$ = NULL;}
        | CLASS error '{' error '}' ';'
                { $$ = NULL;}
        | CLASS TYPEID '{' error '}' ';'
                { $$ = NULL;}
        | CLASS TYPEID INHERITS TYPEID '{' error '}' ';'
                { $$ = NULL;}
        ;

/* Feature list may be empty, but no empty features in list. */
feature_list:                   /* empty */
                { $$ = nil_Features(); }
        | real_feature_list
                { $$ = $1;}
        ;

real_feature_list: real_feature_list feature ';'
                { $$ = append_Features($1, single_Features($2));}
        | feature ';'
                { $$ = single_Features($1);}
        | real_feature_list error ';'
                { $$ = $1;}
        | error ';' 
                { $$ = nil_Features();}
        ;

feature : OBJECTID '(' formal_list ')' ':' TYPEID '{' expr '}'  /* ID( [ formal [[, formal]]* ] ) : TYPE { expr } */
                { $$ = method($1, $3, $6, $8);} 
        | OBJECTID ':' TYPEID                   /* ID : TYPE */
                { $$ = attr($1, $3, no_expr()); }
        | OBJECTID ':' TYPEID ASSIGN expr       /* ID : TYPE [ <- expr ] */
                { $$ = attr($1, $3, $5); }
        ;

formal_list :   /* empty */
                { $$ = nil_Formals();}
        | formal
                { $$ = single_Formals($1); }
        | formal_list ',' formal
                { $$ = append_Formals($1, single_Formals($3)); }
        | formal_list ',' error 
                { $$ = $1;}
        ;

formal  : OBJECTID ':' TYPEID                   /* ID : TYPE */
                { $$ = formal($1, $3); }
        ;

para_list :     /* empty */
                { $$ = nil_Expressions();}
        | expr
                { $$ = single_Expressions($1); }
        | para_list ',' expr
                { $$ = append_Expressions($1, single_Expressions($3)); }
        ;

exprs_with_semicolon : expr ';'
                { $$ = single_Expressions($1); }
        | exprs_with_semicolon expr ';'
                { $$ = append_Expressions($1, single_Expressions($2)); }
        | error ';'
                { $$ = nil_Expressions();}
        | exprs_with_semicolon error ';'
                { $$ = $1;}
        ;

assign_expr :  /* empty */
                { $$ = no_expr(); }
        | ASSIGN expr
                { $$ = $2; }
        ;

let_exprs : OBJECTID ':' TYPEID assign_expr IN expr
                { $$ = let($1, $3, $4, $6); }
        | OBJECTID ':' TYPEID assign_expr ',' let_exprs
                { $$ = let($1, $3, $4, $6); }
        | error IN expr
                { $$ = $3; }
        | error ',' let_exprs
                { $$ = $3; }
        ;
/* case expression */
case_exprs : case_single_expr 
                { $$ = single_Cases($1); }
        | case_exprs case_single_expr 
                { $$ = append_Cases($1, single_Cases($2)); }
        | case_exprs error ';'
                { $$ = $1; }
        | error ';'
                { $$ = nil_Cases();}
        ;
case_single_expr : OBJECTID ':' TYPEID DARROW expr ';'
                { $$ = branch($1, $3, $5); }
        ;

/* expression part */
expr    : OBJECTID ASSIGN expr                  /* ID <- expr */
                { $$ = assign($1, $3);}
        | expr '.' OBJECTID '(' para_list ')'   /* dispatch */
                { $$ = dispatch($1, $3, $5);}  
        | expr '@' TYPEID '.' OBJECTID '(' para_list ')'        /* static dispatch */
                { $$ = static_dispatch($1, $3, $5, $7);}  
        | OBJECTID '(' para_list ')'            /* implicit self dispath */
                { $$ = dispatch(object(idtable.add_string("self")), $1, $3);}
        | IF expr THEN expr ELSE expr FI        /* if expr then expr else expr fi */
                { $$ = cond($2, $4, $6); }
        | IF error FI        
                { $$ = no_expr(); }               
        | WHILE expr LOOP expr POOL             /* while expr loop expr pool */
                { $$ = loop($2, $4);}
        | WHILE error POOL             
                { $$ = no_expr();}        
        | '{' exprs_with_semicolon '}'          /* { [[expr; ]]+} */
                { $$ = block($2); }
        | LET let_exprs                         /* let ID : TYPE [ <- expr ] [[, ID : TYPE [ <- expr ]]]* in expr */
                {  $$ = $2; }                   
        | CASE expr OF case_exprs ESAC          /* case expr of [[ID : TYPE => expr; ]]+ esac */
                { $$ = typcase($2, $4); }
        | NEW TYPEID                            /* new TYPE */
                { $$ = new_($2); }              
        | ISVOID expr                           /* isvoid expr */
                { $$ = isvoid($2); }
        | expr '+' expr                         /* expr + expr */
                { $$ = plus($1, $3); }
        | expr '-' expr                         /* expr - expr */
                { $$ = sub($1, $3); }
        | expr '*' expr                         /* expr * expr */
                { $$ = mul($1, $3); }
        | expr '/' expr                         /* expr / expr */
                { $$ = divide($1, $3); }
        | '~' expr                              /* ~expr */
                { $$ = neg($2); } 
        | expr '<' expr                         /* expr < expr */
                { $$ = lt($1, $3); }      
        | expr LE expr                          /* expr <= expr */
                { $$ = leq($1, $3); }   
        | expr '=' expr                         /* expr = expr */
                { $$ = eq($1, $3); }
        | NOT expr                              /* not expr */
                { $$ = comp($2); }        
        | '(' expr ')'                          /* (expr) */
                { $$ = $2; }
        | '(' error ')'
                { $$ = no_expr();}
        | OBJECTID                              /* ID */
                { $$ = object($1); }            
        | INT_CONST                             /* integer */
                { $$ = int_const($1); }         
        | STR_CONST                             /* string */
                { $$ = string_const($1); }      
        | BOOL_CONST                            /* bool */
                { $$ = bool_const($1); }
        ;
/* end of grammar */
%%

/* This function is called automatically when Bison detects a parse error. */
void yyerror(const char *s)
{
  cerr << "\"" << curr_filename << "\", line " << curr_lineno << ": " \
    << s << " at or near ";
  print_cool_token(yychar);
  cerr << endl;
  omerrs++;

  if(omerrs>20) {
      if (VERBOSE_ERRORS)
         fprintf(stderr, "More than 20 errors\n");
      exit(1);
  }
}

