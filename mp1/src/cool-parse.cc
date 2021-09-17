/* A Bison parser, made by GNU Bison 3.0.4.  */

/* Bison implementation for Yacc-like parsers in C

   Copyright (C) 1984, 1989-1990, 2000-2015 Free Software Foundation, Inc.

   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <http://www.gnu.org/licenses/>.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.

   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */

/* C LALR(1) parser skeleton written by Richard Stallman, by
   simplifying the original so-called "semantic" parser.  */

/* All symbols defined below should begin with yy or YY, to avoid
   infringing on user name space.  This should be done even for local
   variables, as they might otherwise be expanded by user macros.
   There are some unavoidable exceptions within include files to
   define necessary library symbols; they are noted "INFRINGES ON
   USER NAME SPACE" below.  */

/* Identify Bison output.  */
#define YYBISON 1

/* Bison version.  */
#define YYBISON_VERSION "3.0.4"

/* Skeleton name.  */
#define YYSKELETON_NAME "yacc.c"

/* Pure parsers.  */
#define YYPURE 0

/* Push parsers.  */
#define YYPUSH 0

/* Pull parsers.  */
#define YYPULL 1


/* Substitute the variable and function names.  */
#define yyparse         cool_yyparse
#define yylex           cool_yylex
#define yyerror         cool_yyerror
#define yydebug         cool_yydebug
#define yynerrs         cool_yynerrs

#define yylval          cool_yylval
#define yychar          cool_yychar

/* Copy the first part of user declarations.  */
#line 6 "cool.y" /* yacc.c:339  */

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


#line 118 "cool.tab.c" /* yacc.c:339  */

# ifndef YY_NULLPTR
#  if defined __cplusplus && 201103L <= __cplusplus
#   define YY_NULLPTR nullptr
#  else
#   define YY_NULLPTR 0
#  endif
# endif

/* Enabling verbose error messages.  */
#ifdef YYERROR_VERBOSE
# undef YYERROR_VERBOSE
# define YYERROR_VERBOSE 1
#else
# define YYERROR_VERBOSE 0
#endif

/* In a future release of Bison, this section will be replaced
   by #include "cool.tab.h".  */
#ifndef YY_COOL_YY_COOL_TAB_H_INCLUDED
# define YY_COOL_YY_COOL_TAB_H_INCLUDED
/* Debug traces.  */
#ifndef YYDEBUG
# define YYDEBUG 1
#endif
#if YYDEBUG
extern int cool_yydebug;
#endif

/* Token type.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
  enum yytokentype
  {
    CLASS = 258,
    ELSE = 259,
    FI = 260,
    IF = 261,
    IN = 262,
    INHERITS = 263,
    LET = 264,
    LOOP = 265,
    POOL = 266,
    THEN = 267,
    WHILE = 268,
    CASE = 269,
    ESAC = 270,
    OF = 271,
    DARROW = 272,
    NEW = 273,
    ISVOID = 274,
    STR_CONST = 275,
    INT_CONST = 276,
    BOOL_CONST = 277,
    TYPEID = 278,
    OBJECTID = 279,
    ASSIGN = 280,
    NOT = 281,
    LE = 282,
    ERROR = 283
  };
#endif
/* Tokens.  */
#define CLASS 258
#define ELSE 259
#define FI 260
#define IF 261
#define IN 262
#define INHERITS 263
#define LET 264
#define LOOP 265
#define POOL 266
#define THEN 267
#define WHILE 268
#define CASE 269
#define ESAC 270
#define OF 271
#define DARROW 272
#define NEW 273
#define ISVOID 274
#define STR_CONST 275
#define INT_CONST 276
#define BOOL_CONST 277
#define TYPEID 278
#define OBJECTID 279
#define ASSIGN 280
#define NOT 281
#define LE 282
#define ERROR 283

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED

union YYSTYPE
{
#line 51 "cool.y" /* yacc.c:355  */

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

#line 231 "cool.tab.c" /* yacc.c:355  */
};

typedef union YYSTYPE YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE cool_yylval;

int cool_yyparse (void);

#endif /* !YY_COOL_YY_COOL_TAB_H_INCLUDED  */

/* Copy the second part of user declarations.  */

#line 248 "cool.tab.c" /* yacc.c:358  */

#ifdef short
# undef short
#endif

#ifdef YYTYPE_UINT8
typedef YYTYPE_UINT8 yytype_uint8;
#else
typedef unsigned char yytype_uint8;
#endif

#ifdef YYTYPE_INT8
typedef YYTYPE_INT8 yytype_int8;
#else
typedef signed char yytype_int8;
#endif

#ifdef YYTYPE_UINT16
typedef YYTYPE_UINT16 yytype_uint16;
#else
typedef unsigned short int yytype_uint16;
#endif

#ifdef YYTYPE_INT16
typedef YYTYPE_INT16 yytype_int16;
#else
typedef short int yytype_int16;
#endif

#ifndef YYSIZE_T
# ifdef __SIZE_TYPE__
#  define YYSIZE_T __SIZE_TYPE__
# elif defined size_t
#  define YYSIZE_T size_t
# elif ! defined YYSIZE_T
#  include <stddef.h> /* INFRINGES ON USER NAME SPACE */
#  define YYSIZE_T size_t
# else
#  define YYSIZE_T unsigned int
# endif
#endif

#define YYSIZE_MAXIMUM ((YYSIZE_T) -1)

#ifndef YY_
# if defined YYENABLE_NLS && YYENABLE_NLS
#  if ENABLE_NLS
#   include <libintl.h> /* INFRINGES ON USER NAME SPACE */
#   define YY_(Msgid) dgettext ("bison-runtime", Msgid)
#  endif
# endif
# ifndef YY_
#  define YY_(Msgid) Msgid
# endif
#endif

#ifndef YY_ATTRIBUTE
# if (defined __GNUC__                                               \
      && (2 < __GNUC__ || (__GNUC__ == 2 && 96 <= __GNUC_MINOR__)))  \
     || defined __SUNPRO_C && 0x5110 <= __SUNPRO_C
#  define YY_ATTRIBUTE(Spec) __attribute__(Spec)
# else
#  define YY_ATTRIBUTE(Spec) /* empty */
# endif
#endif

#ifndef YY_ATTRIBUTE_PURE
# define YY_ATTRIBUTE_PURE   YY_ATTRIBUTE ((__pure__))
#endif

#ifndef YY_ATTRIBUTE_UNUSED
# define YY_ATTRIBUTE_UNUSED YY_ATTRIBUTE ((__unused__))
#endif

#if !defined _Noreturn \
     && (!defined __STDC_VERSION__ || __STDC_VERSION__ < 201112)
# if defined _MSC_VER && 1200 <= _MSC_VER
#  define _Noreturn __declspec (noreturn)
# else
#  define _Noreturn YY_ATTRIBUTE ((__noreturn__))
# endif
#endif

/* Suppress unused-variable warnings by "using" E.  */
#if ! defined lint || defined __GNUC__
# define YYUSE(E) ((void) (E))
#else
# define YYUSE(E) /* empty */
#endif

#if defined __GNUC__ && 407 <= __GNUC__ * 100 + __GNUC_MINOR__
/* Suppress an incorrect diagnostic about yylval being uninitialized.  */
# define YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN \
    _Pragma ("GCC diagnostic push") \
    _Pragma ("GCC diagnostic ignored \"-Wuninitialized\"")\
    _Pragma ("GCC diagnostic ignored \"-Wmaybe-uninitialized\"")
# define YY_IGNORE_MAYBE_UNINITIALIZED_END \
    _Pragma ("GCC diagnostic pop")
#else
# define YY_INITIAL_VALUE(Value) Value
#endif
#ifndef YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
# define YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
# define YY_IGNORE_MAYBE_UNINITIALIZED_END
#endif
#ifndef YY_INITIAL_VALUE
# define YY_INITIAL_VALUE(Value) /* Nothing. */
#endif


#if ! defined yyoverflow || YYERROR_VERBOSE

/* The parser invokes alloca or malloc; define the necessary symbols.  */

# ifdef YYSTACK_USE_ALLOCA
#  if YYSTACK_USE_ALLOCA
#   ifdef __GNUC__
#    define YYSTACK_ALLOC __builtin_alloca
#   elif defined __BUILTIN_VA_ARG_INCR
#    include <alloca.h> /* INFRINGES ON USER NAME SPACE */
#   elif defined _AIX
#    define YYSTACK_ALLOC __alloca
#   elif defined _MSC_VER
#    include <malloc.h> /* INFRINGES ON USER NAME SPACE */
#    define alloca _alloca
#   else
#    define YYSTACK_ALLOC alloca
#    if ! defined _ALLOCA_H && ! defined EXIT_SUCCESS
#     include <stdlib.h> /* INFRINGES ON USER NAME SPACE */
      /* Use EXIT_SUCCESS as a witness for stdlib.h.  */
#     ifndef EXIT_SUCCESS
#      define EXIT_SUCCESS 0
#     endif
#    endif
#   endif
#  endif
# endif

# ifdef YYSTACK_ALLOC
   /* Pacify GCC's 'empty if-body' warning.  */
#  define YYSTACK_FREE(Ptr) do { /* empty */; } while (0)
#  ifndef YYSTACK_ALLOC_MAXIMUM
    /* The OS might guarantee only one guard page at the bottom of the stack,
       and a page size can be as small as 4096 bytes.  So we cannot safely
       invoke alloca (N) if N exceeds 4096.  Use a slightly smaller number
       to allow for a few compiler-allocated temporary stack slots.  */
#   define YYSTACK_ALLOC_MAXIMUM 4032 /* reasonable circa 2006 */
#  endif
# else
#  define YYSTACK_ALLOC YYMALLOC
#  define YYSTACK_FREE YYFREE
#  ifndef YYSTACK_ALLOC_MAXIMUM
#   define YYSTACK_ALLOC_MAXIMUM YYSIZE_MAXIMUM
#  endif
#  if (defined __cplusplus && ! defined EXIT_SUCCESS \
       && ! ((defined YYMALLOC || defined malloc) \
             && (defined YYFREE || defined free)))
#   include <stdlib.h> /* INFRINGES ON USER NAME SPACE */
#   ifndef EXIT_SUCCESS
#    define EXIT_SUCCESS 0
#   endif
#  endif
#  ifndef YYMALLOC
#   define YYMALLOC malloc
#   if ! defined malloc && ! defined EXIT_SUCCESS
void *malloc (YYSIZE_T); /* INFRINGES ON USER NAME SPACE */
#   endif
#  endif
#  ifndef YYFREE
#   define YYFREE free
#   if ! defined free && ! defined EXIT_SUCCESS
void free (void *); /* INFRINGES ON USER NAME SPACE */
#   endif
#  endif
# endif
#endif /* ! defined yyoverflow || YYERROR_VERBOSE */


#if (! defined yyoverflow \
     && (! defined __cplusplus \
         || (defined YYSTYPE_IS_TRIVIAL && YYSTYPE_IS_TRIVIAL)))

/* A type that is properly aligned for any stack member.  */
union yyalloc
{
  yytype_int16 yyss_alloc;
  YYSTYPE yyvs_alloc;
};

/* The size of the maximum gap between one aligned stack and the next.  */
# define YYSTACK_GAP_MAXIMUM (sizeof (union yyalloc) - 1)

/* The size of an array large to enough to hold all stacks, each with
   N elements.  */
# define YYSTACK_BYTES(N) \
     ((N) * (sizeof (yytype_int16) + sizeof (YYSTYPE)) \
      + YYSTACK_GAP_MAXIMUM)

# define YYCOPY_NEEDED 1

/* Relocate STACK from its old location to the new one.  The
   local variables YYSIZE and YYSTACKSIZE give the old and new number of
   elements in the stack, and YYPTR gives the new location of the
   stack.  Advance YYPTR to a properly aligned location for the next
   stack.  */
# define YYSTACK_RELOCATE(Stack_alloc, Stack)                           \
    do                                                                  \
      {                                                                 \
        YYSIZE_T yynewbytes;                                            \
        YYCOPY (&yyptr->Stack_alloc, Stack, yysize);                    \
        Stack = &yyptr->Stack_alloc;                                    \
        yynewbytes = yystacksize * sizeof (*Stack) + YYSTACK_GAP_MAXIMUM; \
        yyptr += yynewbytes / sizeof (*yyptr);                          \
      }                                                                 \
    while (0)

#endif

#if defined YYCOPY_NEEDED && YYCOPY_NEEDED
/* Copy COUNT objects from SRC to DST.  The source and destination do
   not overlap.  */
# ifndef YYCOPY
#  if defined __GNUC__ && 1 < __GNUC__
#   define YYCOPY(Dst, Src, Count) \
      __builtin_memcpy (Dst, Src, (Count) * sizeof (*(Src)))
#  else
#   define YYCOPY(Dst, Src, Count)              \
      do                                        \
        {                                       \
          YYSIZE_T yyi;                         \
          for (yyi = 0; yyi < (Count); yyi++)   \
            (Dst)[yyi] = (Src)[yyi];            \
        }                                       \
      while (0)
#  endif
# endif
#endif /* !YYCOPY_NEEDED */

/* YYFINAL -- State number of the termination state.  */
#define YYFINAL  9
/* YYLAST -- Last index in YYTABLE.  */
#define YYLAST   400

/* YYNTOKENS -- Number of terminals.  */
#define YYNTOKENS  45
/* YYNNTS -- Number of nonterminals.  */
#define YYNNTS  16
/* YYNRULES -- Number of rules.  */
#define YYNRULES  72
/* YYNSTATES -- Number of states.  */
#define YYNSTATES  176

/* YYTRANSLATE[YYX] -- Symbol number corresponding to YYX as returned
   by yylex, with out-of-bounds checking.  */
#define YYUNDEFTOK  2
#define YYMAXUTOK   284

#define YYTRANSLATE(YYX)                                                \
  ((unsigned int) (YYX) <= YYMAXUTOK ? yytranslate[YYX] : YYUNDEFTOK)

/* YYTRANSLATE[TOKEN-NUM] -- Symbol number corresponding to TOKEN-NUM
   as returned by yylex, without out-of-bounds checking.  */
static const yytype_uint8 yytranslate[] =
{
       0,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
      41,    42,    33,    31,    44,    32,    37,    34,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,    43,    38,
      29,    30,     2,     2,    36,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,    39,     2,    40,    35,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     1,     2,     3,     4,
       5,     6,     7,     8,     9,    10,    11,    12,    13,    14,
      15,    16,    17,    18,    19,    20,    21,    22,    23,    24,
      25,    26,    27,    28,     2
};

#if YYDEBUG
  /* YYRLINE[YYN] -- Source line where rule number YYN was defined.  */
static const yytype_uint16 yyrline[] =
{
       0,   129,   129,   133,   135,   137,   139,   144,   147,   149,
     151,   153,   155,   161,   162,   166,   168,   170,   172,   176,
     178,   180,   185,   186,   188,   190,   194,   199,   200,   202,
     206,   208,   210,   212,   217,   218,   222,   224,   226,   228,
     232,   234,   236,   238,   241,   246,   248,   250,   252,   254,
     256,   258,   260,   262,   264,   266,   268,   270,   272,   274,
     276,   278,   280,   282,   284,   286,   288,   290,   292,   294,
     296,   298,   300
};
#endif

#if YYDEBUG || YYERROR_VERBOSE || 0
/* YYTNAME[SYMBOL-NUM] -- String name of the symbol SYMBOL-NUM.
   First, the terminals, then, starting at YYNTOKENS, nonterminals.  */
static const char *const yytname[] =
{
  "$end", "error", "$undefined", "CLASS", "ELSE", "FI", "IF", "IN",
  "INHERITS", "LET", "LOOP", "POOL", "THEN", "WHILE", "CASE", "ESAC", "OF",
  "DARROW", "NEW", "ISVOID", "STR_CONST", "INT_CONST", "BOOL_CONST",
  "TYPEID", "OBJECTID", "ASSIGN", "NOT", "LE", "ERROR", "'<'", "'='",
  "'+'", "'-'", "'*'", "'/'", "'~'", "'@'", "'.'", "';'", "'{'", "'}'",
  "'('", "')'", "':'", "','", "$accept", "program", "class_list", "class",
  "feature_list", "real_feature_list", "feature", "formal_list", "formal",
  "para_list", "exprs_with_semicolon", "assign_expr", "let_exprs",
  "case_exprs", "case_single_expr", "expr", YY_NULLPTR
};
#endif

# ifdef YYPRINT
/* YYTOKNUM[NUM] -- (External) token number corresponding to the
   (internal) symbol number NUM (which must be that of a token).  */
static const yytype_uint16 yytoknum[] =
{
       0,   256,   284,   258,   259,   260,   261,   262,   263,   264,
     265,   266,   267,   268,   269,   270,   271,   272,   273,   274,
     275,   276,   277,   278,   279,   280,   281,   282,   283,    60,
      61,    43,    45,    42,    47,   126,    64,    46,    59,   123,
     125,    40,    41,    58,    44
};
# endif

#define YYPACT_NINF -107

#define yypact_value_is_default(Yystate) \
  (!!((Yystate) == (-107)))

#define YYTABLE_NINF -15

#define yytable_value_is_error(Yytable_value) \
  (!!((Yytable_value) == (-15)))

  /* YYPACT[STATE-NUM] -- Index in YYTABLE of the portion describing
     STATE-NUM.  */
static const yytype_int16 yypact[] =
{
      60,   -23,    63,    29,   103,  -107,  -107,    -7,    -2,  -107,
      -5,  -107,     1,    42,     2,  -107,    31,    35,    26,     3,
       0,    33,    69,    44,  -107,    51,    49,    85,    73,    77,
      81,  -107,    12,    82,    97,  -107,    84,    53,  -107,   107,
    -107,  -107,  -107,    76,   100,  -107,  -107,   121,   108,     4,
     200,   118,   122,  -107,   136,  -107,  -107,   104,    10,   128,
     200,   139,   200,  -107,  -107,  -107,   -17,   200,   200,   152,
     176,   352,  -107,  -107,   125,   163,   267,     7,   132,  -107,
     168,   244,   279,  -107,   -14,   200,   200,   352,   -14,   142,
      61,   316,   141,   290,   200,   200,   200,   200,   200,   200,
     200,   158,   160,   200,  -107,   200,   200,    10,   165,  -107,
     200,    30,   352,    89,   352,  -107,   148,  -107,   328,  -107,
    -107,  -107,   363,   363,   363,    57,    57,   -14,   -14,   155,
     162,   304,   219,   352,  -107,   174,   255,   166,   164,    15,
    -107,  -107,   200,  -107,  -107,   177,   200,  -107,   200,   200,
      14,  -107,  -107,   182,   170,  -107,  -107,   352,   169,    94,
     231,   352,   200,    10,   195,  -107,   200,  -107,  -107,   352,
    -107,   200,   113,   340,  -107,  -107
};

  /* YYDEFACT[STATE-NUM] -- Default reduction number in state STATE-NUM.
     Performed when YYTABLE does not specify something else to do.  Zero
     means the default is an error.  */
static const yytype_uint8 yydefact[] =
{
       0,     0,     0,     0,     0,     3,     5,     0,     0,     1,
       0,     4,     0,     0,     0,     6,     0,     0,     0,     0,
       0,     0,     0,     0,    18,     0,    22,     0,     0,     0,
       0,    16,     0,     0,     0,    10,     0,     0,    23,    20,
       9,    17,    15,     0,     0,    11,     7,     0,     0,     0,
       0,     0,     0,    26,     0,    25,    24,     0,     0,     0,
       0,     0,     0,    71,    70,    72,    69,     0,     0,     0,
       0,    21,    12,     8,     0,     0,     0,     0,     0,    54,
       0,     0,     0,    56,    57,     0,    27,    66,    62,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,    50,     0,     0,     0,     0,    52,
       0,     0,    45,     0,    28,    32,     0,    53,     0,    30,
      68,    67,    64,    63,    65,    58,    59,    60,    61,     0,
       0,     0,     0,    38,    39,    34,     0,     0,     0,     0,
      40,    48,     0,    33,    31,     0,    27,    19,     0,     0,
       0,    51,    43,     0,     0,    55,    41,    29,     0,     0,
       0,    35,     0,     0,     0,    42,    27,    46,    49,    36,
      37,     0,     0,     0,    47,    44
};

  /* YYPGOTO[NTERM-NUM].  */
static const yytype_int16 yypgoto[] =
{
    -107,  -107,  -107,   212,    45,  -107,   206,  -107,   178,   -78,
    -107,  -107,  -106,  -107,    90,   -50
};

  /* YYDEFGOTO[NTERM-NUM].  */
static const yytype_int16 yydefgoto[] =
{
      -1,     3,     4,     5,    18,    19,    20,    37,    38,   113,
      90,   150,    79,   139,   140,   114
};

  /* YYTABLE[YYPACT[STATE-NUM]] -- What to do in state STATE-NUM.  If
     positive, shift that token.  If negative, reduce the rule whose
     number is the opposite.  If YYTABLE_NINF, syntax error.  */
static const yytype_int16 yytable[] =
{
      71,   134,    16,    22,    29,    55,    13,    76,    85,    81,
      82,    77,    84,    43,   106,     6,   154,    87,    88,    91,
      93,   162,   101,   102,    86,    17,    17,    17,    36,     9,
     155,   137,    12,    15,    78,   112,    17,    14,    31,   138,
     118,   -13,   -13,   -14,   122,   123,   124,   125,   126,   127,
     128,   107,   -13,   131,   138,   132,   133,   170,   163,    23,
     136,     1,   116,     2,     7,    21,    28,    57,   159,    24,
      58,    25,    32,    36,    59,    60,    26,    44,    27,    61,
      62,    63,    64,    65,    34,    66,     8,    67,   172,    35,
      99,   100,   157,   101,   102,    48,    68,    49,   160,   161,
      69,   117,    70,    -2,    10,    75,     2,    24,    39,    33,
      57,    40,   169,    58,    24,    41,    51,    59,    60,    42,
      45,   173,    61,    62,    63,    64,    65,    47,    66,    80,
      67,   141,    50,   142,    57,    46,   167,    58,   142,    68,
      52,    59,    60,    69,    53,    70,    61,    62,    63,    64,
      65,    54,    66,    89,    67,   174,    72,   142,    57,    74,
      73,    58,    83,    68,   103,    59,    60,    69,   104,    70,
      61,    62,    63,    64,    65,   108,    66,    92,    67,   109,
     115,   129,    57,   120,   130,    58,   143,    68,   135,    59,
      60,    69,   145,    70,    61,    62,    63,    64,    65,   149,
      66,   158,    67,   146,   152,   164,    57,   153,   165,    58,
     166,    68,   171,    59,    60,    69,    11,    70,    61,    62,
      63,    64,    65,   148,    66,    30,    67,    56,     0,   156,
       0,     0,     0,     0,     0,    68,   168,     0,     0,    69,
       0,    70,     0,     0,     0,     0,    94,     0,    95,    96,
      97,    98,    99,   100,   110,   101,   102,     0,    94,     0,
      95,    96,    97,    98,    99,   100,   151,   101,   102,     0,
       0,    94,     0,    95,    96,    97,    98,    99,   100,   105,
     101,   102,    94,     0,    95,    96,    97,    98,    99,   100,
       0,   101,   102,     0,    94,   111,    95,    96,    97,    98,
      99,   100,     0,   101,   102,     0,    94,     0,    95,    96,
      97,    98,    99,   100,     0,   101,   102,    94,     0,    95,
      96,    97,    98,    99,   100,     0,   101,   102,     0,     0,
       0,    94,   121,    95,    96,    97,    98,    99,   100,     0,
     101,   102,     0,    94,   147,    95,    96,    97,    98,    99,
     100,     0,   101,   102,   119,    94,     0,    95,    96,    97,
      98,    99,   100,     0,   101,   102,   144,    94,     0,    95,
      96,    97,    98,    99,   100,     0,   101,   102,   175,    94,
       0,    95,    96,    97,    98,    99,   100,     0,   101,   102,
     -15,     0,   -15,   -15,    97,    98,    99,   100,     0,   101,
     102
};

static const yytype_int16 yycheck[] =
{
      50,   107,     1,     1,     1,     1,     8,    57,    25,    59,
      60,     1,    62,     1,     7,    38,     1,    67,    68,    69,
      70,     7,    36,    37,    41,    24,    24,    24,    24,     0,
      15,     1,    39,    38,    24,    85,    24,    39,    38,    24,
      90,    40,    40,    40,    94,    95,    96,    97,    98,    99,
     100,    44,    40,   103,    24,   105,   106,   163,    44,    14,
     110,     1,     1,     3,     1,    23,    40,     6,   146,    38,
       9,    40,    39,    24,    13,    14,    41,    32,    43,    18,
      19,    20,    21,    22,    40,    24,    23,    26,   166,    38,
      33,    34,   142,    36,    37,    42,    35,    44,   148,   149,
      39,    40,    41,     0,     1,     1,     3,    38,    23,    40,
       6,    38,   162,     9,    38,    38,    40,    13,    14,    38,
      38,   171,    18,    19,    20,    21,    22,    43,    24,     1,
      26,    42,    25,    44,     6,    38,    42,     9,    44,    35,
      40,    13,    14,    39,    23,    41,    18,    19,    20,    21,
      22,    43,    24,     1,    26,    42,    38,    44,     6,    23,
      38,     9,    23,    35,    39,    13,    14,    39,     5,    41,
      18,    19,    20,    21,    22,    43,    24,     1,    26,    11,
      38,    23,     6,    42,    24,     9,    38,    35,    23,    13,
      14,    39,    37,    41,    18,    19,    20,    21,    22,    25,
      24,    24,    26,    41,    38,    23,     6,    43,    38,     9,
      41,    35,    17,    13,    14,    39,     4,    41,    18,    19,
      20,    21,    22,     4,    24,    19,    26,    49,    -1,   139,
      -1,    -1,    -1,    -1,    -1,    35,     5,    -1,    -1,    39,
      -1,    41,    -1,    -1,    -1,    -1,    27,    -1,    29,    30,
      31,    32,    33,    34,    10,    36,    37,    -1,    27,    -1,
      29,    30,    31,    32,    33,    34,    11,    36,    37,    -1,
      -1,    27,    -1,    29,    30,    31,    32,    33,    34,    12,
      36,    37,    27,    -1,    29,    30,    31,    32,    33,    34,
      -1,    36,    37,    -1,    27,    16,    29,    30,    31,    32,
      33,    34,    -1,    36,    37,    -1,    27,    -1,    29,    30,
      31,    32,    33,    34,    -1,    36,    37,    27,    -1,    29,
      30,    31,    32,    33,    34,    -1,    36,    37,    -1,    -1,
      -1,    27,    42,    29,    30,    31,    32,    33,    34,    -1,
      36,    37,    -1,    27,    40,    29,    30,    31,    32,    33,
      34,    -1,    36,    37,    38,    27,    -1,    29,    30,    31,
      32,    33,    34,    -1,    36,    37,    38,    27,    -1,    29,
      30,    31,    32,    33,    34,    -1,    36,    37,    38,    27,
      -1,    29,    30,    31,    32,    33,    34,    -1,    36,    37,
      27,    -1,    29,    30,    31,    32,    33,    34,    -1,    36,
      37
};

  /* YYSTOS[STATE-NUM] -- The (internal number of the) accessing
     symbol of state STATE-NUM.  */
static const yytype_uint8 yystos[] =
{
       0,     1,     3,    46,    47,    48,    38,     1,    23,     0,
       1,    48,    39,     8,    39,    38,     1,    24,    49,    50,
      51,    23,     1,    49,    38,    40,    41,    43,    40,     1,
      51,    38,    39,    40,    40,    38,    24,    52,    53,    23,
      38,    38,    38,     1,    49,    38,    38,    43,    42,    44,
      25,    40,    40,    23,    43,     1,    53,     6,     9,    13,
      14,    18,    19,    20,    21,    22,    24,    26,    35,    39,
      41,    60,    38,    38,    23,     1,    60,     1,    24,    57,
       1,    60,    60,    23,    60,    25,    41,    60,    60,     1,
      55,    60,     1,    60,    27,    29,    30,    31,    32,    33,
      34,    36,    37,    39,     5,    12,     7,    44,    43,    11,
      10,    16,    60,    54,    60,    38,     1,    40,    60,    38,
      42,    42,    60,    60,    60,    60,    60,    60,    60,    23,
      24,    60,    60,    60,    57,    23,    60,     1,    24,    58,
      59,    42,    44,    38,    38,    37,    41,    40,     4,    25,
      56,    11,    38,    43,     1,    15,    59,    60,    24,    54,
      60,    60,     7,    44,    23,    38,    41,    42,     5,    60,
      57,    17,    54,    60,    42,    38
};

  /* YYR1[YYN] -- Symbol number of symbol that rule YYN derives.  */
static const yytype_uint8 yyr1[] =
{
       0,    45,    46,    47,    47,    47,    47,    48,    48,    48,
      48,    48,    48,    49,    49,    50,    50,    50,    50,    51,
      51,    51,    52,    52,    52,    52,    53,    54,    54,    54,
      55,    55,    55,    55,    56,    56,    57,    57,    57,    57,
      58,    58,    58,    58,    59,    60,    60,    60,    60,    60,
      60,    60,    60,    60,    60,    60,    60,    60,    60,    60,
      60,    60,    60,    60,    60,    60,    60,    60,    60,    60,
      60,    60,    60
};

  /* YYR2[YYN] -- Number of symbols on the right hand side of rule YYN.  */
static const yytype_uint8 yyr2[] =
{
       0,     2,     1,     1,     2,     2,     3,     6,     8,     6,
       6,     6,     8,     0,     1,     3,     2,     3,     2,     9,
       3,     5,     0,     1,     3,     3,     3,     0,     1,     3,
       2,     3,     2,     3,     0,     2,     6,     6,     3,     3,
       1,     2,     3,     2,     6,     3,     6,     8,     4,     7,
       3,     5,     3,     3,     2,     5,     2,     2,     3,     3,
       3,     3,     2,     3,     3,     3,     2,     3,     3,     1,
       1,     1,     1
};


#define yyerrok         (yyerrstatus = 0)
#define yyclearin       (yychar = YYEMPTY)
#define YYEMPTY         (-2)
#define YYEOF           0

#define YYACCEPT        goto yyacceptlab
#define YYABORT         goto yyabortlab
#define YYERROR         goto yyerrorlab


#define YYRECOVERING()  (!!yyerrstatus)

#define YYBACKUP(Token, Value)                                  \
do                                                              \
  if (yychar == YYEMPTY)                                        \
    {                                                           \
      yychar = (Token);                                         \
      yylval = (Value);                                         \
      YYPOPSTACK (yylen);                                       \
      yystate = *yyssp;                                         \
      goto yybackup;                                            \
    }                                                           \
  else                                                          \
    {                                                           \
      yyerror (YY_("syntax error: cannot back up")); \
      YYERROR;                                                  \
    }                                                           \
while (0)

/* Error token number */
#define YYTERROR        1
#define YYERRCODE       256



/* Enable debugging if requested.  */
#if YYDEBUG

# ifndef YYFPRINTF
#  include <stdio.h> /* INFRINGES ON USER NAME SPACE */
#  define YYFPRINTF fprintf
# endif

# define YYDPRINTF(Args)                        \
do {                                            \
  if (yydebug)                                  \
    YYFPRINTF Args;                             \
} while (0)

/* This macro is provided for backward compatibility. */
#ifndef YY_LOCATION_PRINT
# define YY_LOCATION_PRINT(File, Loc) ((void) 0)
#endif


# define YY_SYMBOL_PRINT(Title, Type, Value, Location)                    \
do {                                                                      \
  if (yydebug)                                                            \
    {                                                                     \
      YYFPRINTF (stderr, "%s ", Title);                                   \
      yy_symbol_print (stderr,                                            \
                  Type, Value); \
      YYFPRINTF (stderr, "\n");                                           \
    }                                                                     \
} while (0)


/*----------------------------------------.
| Print this symbol's value on YYOUTPUT.  |
`----------------------------------------*/

static void
yy_symbol_value_print (FILE *yyoutput, int yytype, YYSTYPE const * const yyvaluep)
{
  FILE *yyo = yyoutput;
  YYUSE (yyo);
  if (!yyvaluep)
    return;
# ifdef YYPRINT
  if (yytype < YYNTOKENS)
    YYPRINT (yyoutput, yytoknum[yytype], *yyvaluep);
# endif
  YYUSE (yytype);
}


/*--------------------------------.
| Print this symbol on YYOUTPUT.  |
`--------------------------------*/

static void
yy_symbol_print (FILE *yyoutput, int yytype, YYSTYPE const * const yyvaluep)
{
  YYFPRINTF (yyoutput, "%s %s (",
             yytype < YYNTOKENS ? "token" : "nterm", yytname[yytype]);

  yy_symbol_value_print (yyoutput, yytype, yyvaluep);
  YYFPRINTF (yyoutput, ")");
}

/*------------------------------------------------------------------.
| yy_stack_print -- Print the state stack from its BOTTOM up to its |
| TOP (included).                                                   |
`------------------------------------------------------------------*/

static void
yy_stack_print (yytype_int16 *yybottom, yytype_int16 *yytop)
{
  YYFPRINTF (stderr, "Stack now");
  for (; yybottom <= yytop; yybottom++)
    {
      int yybot = *yybottom;
      YYFPRINTF (stderr, " %d", yybot);
    }
  YYFPRINTF (stderr, "\n");
}

# define YY_STACK_PRINT(Bottom, Top)                            \
do {                                                            \
  if (yydebug)                                                  \
    yy_stack_print ((Bottom), (Top));                           \
} while (0)


/*------------------------------------------------.
| Report that the YYRULE is going to be reduced.  |
`------------------------------------------------*/

static void
yy_reduce_print (yytype_int16 *yyssp, YYSTYPE *yyvsp, int yyrule)
{
  unsigned long int yylno = yyrline[yyrule];
  int yynrhs = yyr2[yyrule];
  int yyi;
  YYFPRINTF (stderr, "Reducing stack by rule %d (line %lu):\n",
             yyrule - 1, yylno);
  /* The symbols being reduced.  */
  for (yyi = 0; yyi < yynrhs; yyi++)
    {
      YYFPRINTF (stderr, "   $%d = ", yyi + 1);
      yy_symbol_print (stderr,
                       yystos[yyssp[yyi + 1 - yynrhs]],
                       &(yyvsp[(yyi + 1) - (yynrhs)])
                                              );
      YYFPRINTF (stderr, "\n");
    }
}

# define YY_REDUCE_PRINT(Rule)          \
do {                                    \
  if (yydebug)                          \
    yy_reduce_print (yyssp, yyvsp, Rule); \
} while (0)

/* Nonzero means print parse trace.  It is left uninitialized so that
   multiple parsers can coexist.  */
int yydebug;
#else /* !YYDEBUG */
# define YYDPRINTF(Args)
# define YY_SYMBOL_PRINT(Title, Type, Value, Location)
# define YY_STACK_PRINT(Bottom, Top)
# define YY_REDUCE_PRINT(Rule)
#endif /* !YYDEBUG */


/* YYINITDEPTH -- initial size of the parser's stacks.  */
#ifndef YYINITDEPTH
# define YYINITDEPTH 200
#endif

/* YYMAXDEPTH -- maximum size the stacks can grow to (effective only
   if the built-in stack extension method is used).

   Do not make this value too large; the results are undefined if
   YYSTACK_ALLOC_MAXIMUM < YYSTACK_BYTES (YYMAXDEPTH)
   evaluated with infinite-precision integer arithmetic.  */

#ifndef YYMAXDEPTH
# define YYMAXDEPTH 10000
#endif


#if YYERROR_VERBOSE

# ifndef yystrlen
#  if defined __GLIBC__ && defined _STRING_H
#   define yystrlen strlen
#  else
/* Return the length of YYSTR.  */
static YYSIZE_T
yystrlen (const char *yystr)
{
  YYSIZE_T yylen;
  for (yylen = 0; yystr[yylen]; yylen++)
    continue;
  return yylen;
}
#  endif
# endif

# ifndef yystpcpy
#  if defined __GLIBC__ && defined _STRING_H && defined _GNU_SOURCE
#   define yystpcpy stpcpy
#  else
/* Copy YYSRC to YYDEST, returning the address of the terminating '\0' in
   YYDEST.  */
static char *
yystpcpy (char *yydest, const char *yysrc)
{
  char *yyd = yydest;
  const char *yys = yysrc;

  while ((*yyd++ = *yys++) != '\0')
    continue;

  return yyd - 1;
}
#  endif
# endif

# ifndef yytnamerr
/* Copy to YYRES the contents of YYSTR after stripping away unnecessary
   quotes and backslashes, so that it's suitable for yyerror.  The
   heuristic is that double-quoting is unnecessary unless the string
   contains an apostrophe, a comma, or backslash (other than
   backslash-backslash).  YYSTR is taken from yytname.  If YYRES is
   null, do not copy; instead, return the length of what the result
   would have been.  */
static YYSIZE_T
yytnamerr (char *yyres, const char *yystr)
{
  if (*yystr == '"')
    {
      YYSIZE_T yyn = 0;
      char const *yyp = yystr;

      for (;;)
        switch (*++yyp)
          {
          case '\'':
          case ',':
            goto do_not_strip_quotes;

          case '\\':
            if (*++yyp != '\\')
              goto do_not_strip_quotes;
            /* Fall through.  */
          default:
            if (yyres)
              yyres[yyn] = *yyp;
            yyn++;
            break;

          case '"':
            if (yyres)
              yyres[yyn] = '\0';
            return yyn;
          }
    do_not_strip_quotes: ;
    }

  if (! yyres)
    return yystrlen (yystr);

  return yystpcpy (yyres, yystr) - yyres;
}
# endif

/* Copy into *YYMSG, which is of size *YYMSG_ALLOC, an error message
   about the unexpected token YYTOKEN for the state stack whose top is
   YYSSP.

   Return 0 if *YYMSG was successfully written.  Return 1 if *YYMSG is
   not large enough to hold the message.  In that case, also set
   *YYMSG_ALLOC to the required number of bytes.  Return 2 if the
   required number of bytes is too large to store.  */
static int
yysyntax_error (YYSIZE_T *yymsg_alloc, char **yymsg,
                yytype_int16 *yyssp, int yytoken)
{
  YYSIZE_T yysize0 = yytnamerr (YY_NULLPTR, yytname[yytoken]);
  YYSIZE_T yysize = yysize0;
  enum { YYERROR_VERBOSE_ARGS_MAXIMUM = 5 };
  /* Internationalized format string. */
  const char *yyformat = YY_NULLPTR;
  /* Arguments of yyformat. */
  char const *yyarg[YYERROR_VERBOSE_ARGS_MAXIMUM];
  /* Number of reported tokens (one for the "unexpected", one per
     "expected"). */
  int yycount = 0;

  /* There are many possibilities here to consider:
     - If this state is a consistent state with a default action, then
       the only way this function was invoked is if the default action
       is an error action.  In that case, don't check for expected
       tokens because there are none.
     - The only way there can be no lookahead present (in yychar) is if
       this state is a consistent state with a default action.  Thus,
       detecting the absence of a lookahead is sufficient to determine
       that there is no unexpected or expected token to report.  In that
       case, just report a simple "syntax error".
     - Don't assume there isn't a lookahead just because this state is a
       consistent state with a default action.  There might have been a
       previous inconsistent state, consistent state with a non-default
       action, or user semantic action that manipulated yychar.
     - Of course, the expected token list depends on states to have
       correct lookahead information, and it depends on the parser not
       to perform extra reductions after fetching a lookahead from the
       scanner and before detecting a syntax error.  Thus, state merging
       (from LALR or IELR) and default reductions corrupt the expected
       token list.  However, the list is correct for canonical LR with
       one exception: it will still contain any token that will not be
       accepted due to an error action in a later state.
  */
  if (yytoken != YYEMPTY)
    {
      int yyn = yypact[*yyssp];
      yyarg[yycount++] = yytname[yytoken];
      if (!yypact_value_is_default (yyn))
        {
          /* Start YYX at -YYN if negative to avoid negative indexes in
             YYCHECK.  In other words, skip the first -YYN actions for
             this state because they are default actions.  */
          int yyxbegin = yyn < 0 ? -yyn : 0;
          /* Stay within bounds of both yycheck and yytname.  */
          int yychecklim = YYLAST - yyn + 1;
          int yyxend = yychecklim < YYNTOKENS ? yychecklim : YYNTOKENS;
          int yyx;

          for (yyx = yyxbegin; yyx < yyxend; ++yyx)
            if (yycheck[yyx + yyn] == yyx && yyx != YYTERROR
                && !yytable_value_is_error (yytable[yyx + yyn]))
              {
                if (yycount == YYERROR_VERBOSE_ARGS_MAXIMUM)
                  {
                    yycount = 1;
                    yysize = yysize0;
                    break;
                  }
                yyarg[yycount++] = yytname[yyx];
                {
                  YYSIZE_T yysize1 = yysize + yytnamerr (YY_NULLPTR, yytname[yyx]);
                  if (! (yysize <= yysize1
                         && yysize1 <= YYSTACK_ALLOC_MAXIMUM))
                    return 2;
                  yysize = yysize1;
                }
              }
        }
    }

  switch (yycount)
    {
# define YYCASE_(N, S)                      \
      case N:                               \
        yyformat = S;                       \
      break
      YYCASE_(0, YY_("syntax error"));
      YYCASE_(1, YY_("syntax error, unexpected %s"));
      YYCASE_(2, YY_("syntax error, unexpected %s, expecting %s"));
      YYCASE_(3, YY_("syntax error, unexpected %s, expecting %s or %s"));
      YYCASE_(4, YY_("syntax error, unexpected %s, expecting %s or %s or %s"));
      YYCASE_(5, YY_("syntax error, unexpected %s, expecting %s or %s or %s or %s"));
# undef YYCASE_
    }

  {
    YYSIZE_T yysize1 = yysize + yystrlen (yyformat);
    if (! (yysize <= yysize1 && yysize1 <= YYSTACK_ALLOC_MAXIMUM))
      return 2;
    yysize = yysize1;
  }

  if (*yymsg_alloc < yysize)
    {
      *yymsg_alloc = 2 * yysize;
      if (! (yysize <= *yymsg_alloc
             && *yymsg_alloc <= YYSTACK_ALLOC_MAXIMUM))
        *yymsg_alloc = YYSTACK_ALLOC_MAXIMUM;
      return 1;
    }

  /* Avoid sprintf, as that infringes on the user's name space.
     Don't have undefined behavior even if the translation
     produced a string with the wrong number of "%s"s.  */
  {
    char *yyp = *yymsg;
    int yyi = 0;
    while ((*yyp = *yyformat) != '\0')
      if (*yyp == '%' && yyformat[1] == 's' && yyi < yycount)
        {
          yyp += yytnamerr (yyp, yyarg[yyi++]);
          yyformat += 2;
        }
      else
        {
          yyp++;
          yyformat++;
        }
  }
  return 0;
}
#endif /* YYERROR_VERBOSE */

/*-----------------------------------------------.
| Release the memory associated to this symbol.  |
`-----------------------------------------------*/

static void
yydestruct (const char *yymsg, int yytype, YYSTYPE *yyvaluep)
{
  YYUSE (yyvaluep);
  if (!yymsg)
    yymsg = "Deleting";
  YY_SYMBOL_PRINT (yymsg, yytype, yyvaluep, yylocationp);

  YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
  YYUSE (yytype);
  YY_IGNORE_MAYBE_UNINITIALIZED_END
}




/* The lookahead symbol.  */
int yychar;

/* The semantic value of the lookahead symbol.  */
YYSTYPE yylval;
/* Number of syntax errors so far.  */
int yynerrs;


/*----------.
| yyparse.  |
`----------*/

int
yyparse (void)
{
    int yystate;
    /* Number of tokens to shift before error messages enabled.  */
    int yyerrstatus;

    /* The stacks and their tools:
       'yyss': related to states.
       'yyvs': related to semantic values.

       Refer to the stacks through separate pointers, to allow yyoverflow
       to reallocate them elsewhere.  */

    /* The state stack.  */
    yytype_int16 yyssa[YYINITDEPTH];
    yytype_int16 *yyss;
    yytype_int16 *yyssp;

    /* The semantic value stack.  */
    YYSTYPE yyvsa[YYINITDEPTH];
    YYSTYPE *yyvs;
    YYSTYPE *yyvsp;

    YYSIZE_T yystacksize;

  int yyn;
  int yyresult;
  /* Lookahead token as an internal (translated) token number.  */
  int yytoken = 0;
  /* The variables used to return semantic value and location from the
     action routines.  */
  YYSTYPE yyval;

#if YYERROR_VERBOSE
  /* Buffer for error messages, and its allocated size.  */
  char yymsgbuf[128];
  char *yymsg = yymsgbuf;
  YYSIZE_T yymsg_alloc = sizeof yymsgbuf;
#endif

#define YYPOPSTACK(N)   (yyvsp -= (N), yyssp -= (N))

  /* The number of symbols on the RHS of the reduced rule.
     Keep to zero when no symbol should be popped.  */
  int yylen = 0;

  yyssp = yyss = yyssa;
  yyvsp = yyvs = yyvsa;
  yystacksize = YYINITDEPTH;

  YYDPRINTF ((stderr, "Starting parse\n"));

  yystate = 0;
  yyerrstatus = 0;
  yynerrs = 0;
  yychar = YYEMPTY; /* Cause a token to be read.  */
  goto yysetstate;

/*------------------------------------------------------------.
| yynewstate -- Push a new state, which is found in yystate.  |
`------------------------------------------------------------*/
 yynewstate:
  /* In all cases, when you get here, the value and location stacks
     have just been pushed.  So pushing a state here evens the stacks.  */
  yyssp++;

 yysetstate:
  *yyssp = yystate;

  if (yyss + yystacksize - 1 <= yyssp)
    {
      /* Get the current used size of the three stacks, in elements.  */
      YYSIZE_T yysize = yyssp - yyss + 1;

#ifdef yyoverflow
      {
        /* Give user a chance to reallocate the stack.  Use copies of
           these so that the &'s don't force the real ones into
           memory.  */
        YYSTYPE *yyvs1 = yyvs;
        yytype_int16 *yyss1 = yyss;

        /* Each stack pointer address is followed by the size of the
           data in use in that stack, in bytes.  This used to be a
           conditional around just the two extra args, but that might
           be undefined if yyoverflow is a macro.  */
        yyoverflow (YY_("memory exhausted"),
                    &yyss1, yysize * sizeof (*yyssp),
                    &yyvs1, yysize * sizeof (*yyvsp),
                    &yystacksize);

        yyss = yyss1;
        yyvs = yyvs1;
      }
#else /* no yyoverflow */
# ifndef YYSTACK_RELOCATE
      goto yyexhaustedlab;
# else
      /* Extend the stack our own way.  */
      if (YYMAXDEPTH <= yystacksize)
        goto yyexhaustedlab;
      yystacksize *= 2;
      if (YYMAXDEPTH < yystacksize)
        yystacksize = YYMAXDEPTH;

      {
        yytype_int16 *yyss1 = yyss;
        union yyalloc *yyptr =
          (union yyalloc *) YYSTACK_ALLOC (YYSTACK_BYTES (yystacksize));
        if (! yyptr)
          goto yyexhaustedlab;
        YYSTACK_RELOCATE (yyss_alloc, yyss);
        YYSTACK_RELOCATE (yyvs_alloc, yyvs);
#  undef YYSTACK_RELOCATE
        if (yyss1 != yyssa)
          YYSTACK_FREE (yyss1);
      }
# endif
#endif /* no yyoverflow */

      yyssp = yyss + yysize - 1;
      yyvsp = yyvs + yysize - 1;

      YYDPRINTF ((stderr, "Stack size increased to %lu\n",
                  (unsigned long int) yystacksize));

      if (yyss + yystacksize - 1 <= yyssp)
        YYABORT;
    }

  YYDPRINTF ((stderr, "Entering state %d\n", yystate));

  if (yystate == YYFINAL)
    YYACCEPT;

  goto yybackup;

/*-----------.
| yybackup.  |
`-----------*/
yybackup:

  /* Do appropriate processing given the current state.  Read a
     lookahead token if we need one and don't already have one.  */

  /* First try to decide what to do without reference to lookahead token.  */
  yyn = yypact[yystate];
  if (yypact_value_is_default (yyn))
    goto yydefault;

  /* Not known => get a lookahead token if don't already have one.  */

  /* YYCHAR is either YYEMPTY or YYEOF or a valid lookahead symbol.  */
  if (yychar == YYEMPTY)
    {
      YYDPRINTF ((stderr, "Reading a token: "));
      yychar = yylex ();
    }

  if (yychar <= YYEOF)
    {
      yychar = yytoken = YYEOF;
      YYDPRINTF ((stderr, "Now at end of input.\n"));
    }
  else
    {
      yytoken = YYTRANSLATE (yychar);
      YY_SYMBOL_PRINT ("Next token is", yytoken, &yylval, &yylloc);
    }

  /* If the proper action on seeing token YYTOKEN is to reduce or to
     detect an error, take that action.  */
  yyn += yytoken;
  if (yyn < 0 || YYLAST < yyn || yycheck[yyn] != yytoken)
    goto yydefault;
  yyn = yytable[yyn];
  if (yyn <= 0)
    {
      if (yytable_value_is_error (yyn))
        goto yyerrlab;
      yyn = -yyn;
      goto yyreduce;
    }

  /* Count tokens shifted since error; after three, turn off error
     status.  */
  if (yyerrstatus)
    yyerrstatus--;

  /* Shift the lookahead token.  */
  YY_SYMBOL_PRINT ("Shifting", yytoken, &yylval, &yylloc);

  /* Discard the shifted token.  */
  yychar = YYEMPTY;

  yystate = yyn;
  YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
  *++yyvsp = yylval;
  YY_IGNORE_MAYBE_UNINITIALIZED_END

  goto yynewstate;


/*-----------------------------------------------------------.
| yydefault -- do the default action for the current state.  |
`-----------------------------------------------------------*/
yydefault:
  yyn = yydefact[yystate];
  if (yyn == 0)
    goto yyerrlab;
  goto yyreduce;


/*-----------------------------.
| yyreduce -- Do a reduction.  |
`-----------------------------*/
yyreduce:
  /* yyn is the number of a rule to reduce with.  */
  yylen = yyr2[yyn];

  /* If YYLEN is nonzero, implement the default value of the action:
     '$$ = $1'.

     Otherwise, the following line sets YYVAL to garbage.
     This behavior is undocumented and Bison
     users should not rely upon it.  Assigning to YYVAL
     unconditionally makes the parser a bit smaller, and it avoids a
     GCC warning that YYVAL may be used uninitialized.  */
  yyval = yyvsp[1-yylen];


  YY_REDUCE_PRINT (yyn);
  switch (yyn)
    {
        case 2:
#line 129 "cool.y" /* yacc.c:1646  */
    { ast_root = program((yyvsp[0].classes)); }
#line 1481 "cool.tab.c" /* yacc.c:1646  */
    break;

  case 3:
#line 134 "cool.y" /* yacc.c:1646  */
    { (yyval.classes) = single_Classes((yyvsp[0].class_)); }
#line 1487 "cool.tab.c" /* yacc.c:1646  */
    break;

  case 4:
#line 136 "cool.y" /* yacc.c:1646  */
    { (yyval.classes) = append_Classes((yyvsp[-1].classes),single_Classes((yyvsp[0].class_))); }
#line 1493 "cool.tab.c" /* yacc.c:1646  */
    break;

  case 5:
#line 138 "cool.y" /* yacc.c:1646  */
    { (yyval.classes) = nil_Classes(); yyerrok;}
#line 1499 "cool.tab.c" /* yacc.c:1646  */
    break;

  case 6:
#line 140 "cool.y" /* yacc.c:1646  */
    { (yyval.classes) = (yyvsp[-2].classes); yyerrok;}
#line 1505 "cool.tab.c" /* yacc.c:1646  */
    break;

  case 7:
#line 145 "cool.y" /* yacc.c:1646  */
    { (yyval.class_) = class_((yyvsp[-4].symbol),idtable.add_string("Object"),(yyvsp[-2].features),
                              stringtable.add_string(curr_filename)); }
#line 1512 "cool.tab.c" /* yacc.c:1646  */
    break;

  case 8:
#line 148 "cool.y" /* yacc.c:1646  */
    { (yyval.class_) = class_((yyvsp[-6].symbol),(yyvsp[-4].symbol),(yyvsp[-2].features),stringtable.add_string(curr_filename)); }
#line 1518 "cool.tab.c" /* yacc.c:1646  */
    break;

  case 9:
#line 150 "cool.y" /* yacc.c:1646  */
    { (yyval.class_) = NULL;}
#line 1524 "cool.tab.c" /* yacc.c:1646  */
    break;

  case 10:
#line 152 "cool.y" /* yacc.c:1646  */
    { (yyval.class_) = NULL;}
#line 1530 "cool.tab.c" /* yacc.c:1646  */
    break;

  case 11:
#line 154 "cool.y" /* yacc.c:1646  */
    { (yyval.class_) = NULL;}
#line 1536 "cool.tab.c" /* yacc.c:1646  */
    break;

  case 12:
#line 156 "cool.y" /* yacc.c:1646  */
    { (yyval.class_) = NULL;}
#line 1542 "cool.tab.c" /* yacc.c:1646  */
    break;

  case 13:
#line 161 "cool.y" /* yacc.c:1646  */
    { (yyval.features) = nil_Features(); }
#line 1548 "cool.tab.c" /* yacc.c:1646  */
    break;

  case 14:
#line 163 "cool.y" /* yacc.c:1646  */
    { (yyval.features) = (yyvsp[0].features);}
#line 1554 "cool.tab.c" /* yacc.c:1646  */
    break;

  case 15:
#line 167 "cool.y" /* yacc.c:1646  */
    { (yyval.features) = append_Features((yyvsp[-2].features), single_Features((yyvsp[-1].feature)));}
#line 1560 "cool.tab.c" /* yacc.c:1646  */
    break;

  case 16:
#line 169 "cool.y" /* yacc.c:1646  */
    { (yyval.features) = single_Features((yyvsp[-1].feature));}
#line 1566 "cool.tab.c" /* yacc.c:1646  */
    break;

  case 17:
#line 171 "cool.y" /* yacc.c:1646  */
    { (yyval.features) = (yyvsp[-2].features);}
#line 1572 "cool.tab.c" /* yacc.c:1646  */
    break;

  case 18:
#line 173 "cool.y" /* yacc.c:1646  */
    { (yyval.features) = nil_Features();}
#line 1578 "cool.tab.c" /* yacc.c:1646  */
    break;

  case 19:
#line 177 "cool.y" /* yacc.c:1646  */
    { (yyval.feature) = method((yyvsp[-8].symbol), (yyvsp[-6].formals), (yyvsp[-3].symbol), (yyvsp[-1].expression));}
#line 1584 "cool.tab.c" /* yacc.c:1646  */
    break;

  case 20:
#line 179 "cool.y" /* yacc.c:1646  */
    { (yyval.feature) = attr((yyvsp[-2].symbol), (yyvsp[0].symbol), no_expr()); }
#line 1590 "cool.tab.c" /* yacc.c:1646  */
    break;

  case 21:
#line 181 "cool.y" /* yacc.c:1646  */
    { (yyval.feature) = attr((yyvsp[-4].symbol), (yyvsp[-2].symbol), (yyvsp[0].expression)); }
#line 1596 "cool.tab.c" /* yacc.c:1646  */
    break;

  case 22:
#line 185 "cool.y" /* yacc.c:1646  */
    { (yyval.formals) = nil_Formals();}
#line 1602 "cool.tab.c" /* yacc.c:1646  */
    break;

  case 23:
#line 187 "cool.y" /* yacc.c:1646  */
    { (yyval.formals) = single_Formals((yyvsp[0].formal)); }
#line 1608 "cool.tab.c" /* yacc.c:1646  */
    break;

  case 24:
#line 189 "cool.y" /* yacc.c:1646  */
    { (yyval.formals) = append_Formals((yyvsp[-2].formals), single_Formals((yyvsp[0].formal))); }
#line 1614 "cool.tab.c" /* yacc.c:1646  */
    break;

  case 25:
#line 191 "cool.y" /* yacc.c:1646  */
    { (yyval.formals) = (yyvsp[-2].formals);}
#line 1620 "cool.tab.c" /* yacc.c:1646  */
    break;

  case 26:
#line 195 "cool.y" /* yacc.c:1646  */
    { (yyval.formal) = formal((yyvsp[-2].symbol), (yyvsp[0].symbol)); }
#line 1626 "cool.tab.c" /* yacc.c:1646  */
    break;

  case 27:
#line 199 "cool.y" /* yacc.c:1646  */
    { (yyval.expressions) = nil_Expressions();}
#line 1632 "cool.tab.c" /* yacc.c:1646  */
    break;

  case 28:
#line 201 "cool.y" /* yacc.c:1646  */
    { (yyval.expressions) = single_Expressions((yyvsp[0].expression)); }
#line 1638 "cool.tab.c" /* yacc.c:1646  */
    break;

  case 29:
#line 203 "cool.y" /* yacc.c:1646  */
    { (yyval.expressions) = append_Expressions((yyvsp[-2].expressions), single_Expressions((yyvsp[0].expression))); }
#line 1644 "cool.tab.c" /* yacc.c:1646  */
    break;

  case 30:
#line 207 "cool.y" /* yacc.c:1646  */
    { (yyval.expressions) = single_Expressions((yyvsp[-1].expression)); }
#line 1650 "cool.tab.c" /* yacc.c:1646  */
    break;

  case 31:
#line 209 "cool.y" /* yacc.c:1646  */
    { (yyval.expressions) = append_Expressions((yyvsp[-2].expressions), single_Expressions((yyvsp[-1].expression))); }
#line 1656 "cool.tab.c" /* yacc.c:1646  */
    break;

  case 32:
#line 211 "cool.y" /* yacc.c:1646  */
    { (yyval.expressions) = nil_Expressions();}
#line 1662 "cool.tab.c" /* yacc.c:1646  */
    break;

  case 33:
#line 213 "cool.y" /* yacc.c:1646  */
    { (yyval.expressions) = (yyvsp[-2].expressions);}
#line 1668 "cool.tab.c" /* yacc.c:1646  */
    break;

  case 34:
#line 217 "cool.y" /* yacc.c:1646  */
    { (yyval.expression) = no_expr(); }
#line 1674 "cool.tab.c" /* yacc.c:1646  */
    break;

  case 35:
#line 219 "cool.y" /* yacc.c:1646  */
    { (yyval.expression) = (yyvsp[0].expression); }
#line 1680 "cool.tab.c" /* yacc.c:1646  */
    break;

  case 36:
#line 223 "cool.y" /* yacc.c:1646  */
    { (yyval.expression) = let((yyvsp[-5].symbol), (yyvsp[-3].symbol), (yyvsp[-2].expression), (yyvsp[0].expression)); }
#line 1686 "cool.tab.c" /* yacc.c:1646  */
    break;

  case 37:
#line 225 "cool.y" /* yacc.c:1646  */
    { (yyval.expression) = let((yyvsp[-5].symbol), (yyvsp[-3].symbol), (yyvsp[-2].expression), (yyvsp[0].expression)); }
#line 1692 "cool.tab.c" /* yacc.c:1646  */
    break;

  case 38:
#line 227 "cool.y" /* yacc.c:1646  */
    { (yyval.expression) = (yyvsp[0].expression); }
#line 1698 "cool.tab.c" /* yacc.c:1646  */
    break;

  case 39:
#line 229 "cool.y" /* yacc.c:1646  */
    { (yyval.expression) = (yyvsp[0].expression); }
#line 1704 "cool.tab.c" /* yacc.c:1646  */
    break;

  case 40:
#line 233 "cool.y" /* yacc.c:1646  */
    { (yyval.cases) = single_Cases((yyvsp[0].case_)); }
#line 1710 "cool.tab.c" /* yacc.c:1646  */
    break;

  case 41:
#line 235 "cool.y" /* yacc.c:1646  */
    { (yyval.cases) = append_Cases((yyvsp[-1].cases), single_Cases((yyvsp[0].case_))); }
#line 1716 "cool.tab.c" /* yacc.c:1646  */
    break;

  case 42:
#line 237 "cool.y" /* yacc.c:1646  */
    { (yyval.cases) = (yyvsp[-2].cases); }
#line 1722 "cool.tab.c" /* yacc.c:1646  */
    break;

  case 43:
#line 239 "cool.y" /* yacc.c:1646  */
    { (yyval.cases) = nil_Cases();}
#line 1728 "cool.tab.c" /* yacc.c:1646  */
    break;

  case 44:
#line 242 "cool.y" /* yacc.c:1646  */
    { (yyval.case_) = branch((yyvsp[-5].symbol), (yyvsp[-3].symbol), (yyvsp[-1].expression)); }
#line 1734 "cool.tab.c" /* yacc.c:1646  */
    break;

  case 45:
#line 247 "cool.y" /* yacc.c:1646  */
    { (yyval.expression) = assign((yyvsp[-2].symbol), (yyvsp[0].expression));}
#line 1740 "cool.tab.c" /* yacc.c:1646  */
    break;

  case 46:
#line 249 "cool.y" /* yacc.c:1646  */
    { (yyval.expression) = dispatch((yyvsp[-5].expression), (yyvsp[-3].symbol), (yyvsp[-1].expressions));}
#line 1746 "cool.tab.c" /* yacc.c:1646  */
    break;

  case 47:
#line 251 "cool.y" /* yacc.c:1646  */
    { (yyval.expression) = static_dispatch((yyvsp[-7].expression), (yyvsp[-5].symbol), (yyvsp[-3].symbol), (yyvsp[-1].expressions));}
#line 1752 "cool.tab.c" /* yacc.c:1646  */
    break;

  case 48:
#line 253 "cool.y" /* yacc.c:1646  */
    { (yyval.expression) = dispatch(object(idtable.add_string("self")), (yyvsp[-3].symbol), (yyvsp[-1].expressions));}
#line 1758 "cool.tab.c" /* yacc.c:1646  */
    break;

  case 49:
#line 255 "cool.y" /* yacc.c:1646  */
    { (yyval.expression) = cond((yyvsp[-5].expression), (yyvsp[-3].expression), (yyvsp[-1].expression)); }
#line 1764 "cool.tab.c" /* yacc.c:1646  */
    break;

  case 50:
#line 257 "cool.y" /* yacc.c:1646  */
    { (yyval.expression) = no_expr(); }
#line 1770 "cool.tab.c" /* yacc.c:1646  */
    break;

  case 51:
#line 259 "cool.y" /* yacc.c:1646  */
    { (yyval.expression) = loop((yyvsp[-3].expression), (yyvsp[-1].expression));}
#line 1776 "cool.tab.c" /* yacc.c:1646  */
    break;

  case 52:
#line 261 "cool.y" /* yacc.c:1646  */
    { (yyval.expression) = no_expr();}
#line 1782 "cool.tab.c" /* yacc.c:1646  */
    break;

  case 53:
#line 263 "cool.y" /* yacc.c:1646  */
    { (yyval.expression) = block((yyvsp[-1].expressions)); }
#line 1788 "cool.tab.c" /* yacc.c:1646  */
    break;

  case 54:
#line 265 "cool.y" /* yacc.c:1646  */
    {  (yyval.expression) = (yyvsp[0].expression); }
#line 1794 "cool.tab.c" /* yacc.c:1646  */
    break;

  case 55:
#line 267 "cool.y" /* yacc.c:1646  */
    { (yyval.expression) = typcase((yyvsp[-3].expression), (yyvsp[-1].cases)); }
#line 1800 "cool.tab.c" /* yacc.c:1646  */
    break;

  case 56:
#line 269 "cool.y" /* yacc.c:1646  */
    { (yyval.expression) = new_((yyvsp[0].symbol)); }
#line 1806 "cool.tab.c" /* yacc.c:1646  */
    break;

  case 57:
#line 271 "cool.y" /* yacc.c:1646  */
    { (yyval.expression) = isvoid((yyvsp[0].expression)); }
#line 1812 "cool.tab.c" /* yacc.c:1646  */
    break;

  case 58:
#line 273 "cool.y" /* yacc.c:1646  */
    { (yyval.expression) = plus((yyvsp[-2].expression), (yyvsp[0].expression)); }
#line 1818 "cool.tab.c" /* yacc.c:1646  */
    break;

  case 59:
#line 275 "cool.y" /* yacc.c:1646  */
    { (yyval.expression) = sub((yyvsp[-2].expression), (yyvsp[0].expression)); }
#line 1824 "cool.tab.c" /* yacc.c:1646  */
    break;

  case 60:
#line 277 "cool.y" /* yacc.c:1646  */
    { (yyval.expression) = mul((yyvsp[-2].expression), (yyvsp[0].expression)); }
#line 1830 "cool.tab.c" /* yacc.c:1646  */
    break;

  case 61:
#line 279 "cool.y" /* yacc.c:1646  */
    { (yyval.expression) = divide((yyvsp[-2].expression), (yyvsp[0].expression)); }
#line 1836 "cool.tab.c" /* yacc.c:1646  */
    break;

  case 62:
#line 281 "cool.y" /* yacc.c:1646  */
    { (yyval.expression) = neg((yyvsp[0].expression)); }
#line 1842 "cool.tab.c" /* yacc.c:1646  */
    break;

  case 63:
#line 283 "cool.y" /* yacc.c:1646  */
    { (yyval.expression) = lt((yyvsp[-2].expression), (yyvsp[0].expression)); }
#line 1848 "cool.tab.c" /* yacc.c:1646  */
    break;

  case 64:
#line 285 "cool.y" /* yacc.c:1646  */
    { (yyval.expression) = leq((yyvsp[-2].expression), (yyvsp[0].expression)); }
#line 1854 "cool.tab.c" /* yacc.c:1646  */
    break;

  case 65:
#line 287 "cool.y" /* yacc.c:1646  */
    { (yyval.expression) = eq((yyvsp[-2].expression), (yyvsp[0].expression)); }
#line 1860 "cool.tab.c" /* yacc.c:1646  */
    break;

  case 66:
#line 289 "cool.y" /* yacc.c:1646  */
    { (yyval.expression) = comp((yyvsp[0].expression)); }
#line 1866 "cool.tab.c" /* yacc.c:1646  */
    break;

  case 67:
#line 291 "cool.y" /* yacc.c:1646  */
    { (yyval.expression) = (yyvsp[-1].expression); }
#line 1872 "cool.tab.c" /* yacc.c:1646  */
    break;

  case 68:
#line 293 "cool.y" /* yacc.c:1646  */
    { (yyval.expression) = no_expr();}
#line 1878 "cool.tab.c" /* yacc.c:1646  */
    break;

  case 69:
#line 295 "cool.y" /* yacc.c:1646  */
    { (yyval.expression) = object((yyvsp[0].symbol)); }
#line 1884 "cool.tab.c" /* yacc.c:1646  */
    break;

  case 70:
#line 297 "cool.y" /* yacc.c:1646  */
    { (yyval.expression) = int_const((yyvsp[0].symbol)); }
#line 1890 "cool.tab.c" /* yacc.c:1646  */
    break;

  case 71:
#line 299 "cool.y" /* yacc.c:1646  */
    { (yyval.expression) = string_const((yyvsp[0].symbol)); }
#line 1896 "cool.tab.c" /* yacc.c:1646  */
    break;

  case 72:
#line 301 "cool.y" /* yacc.c:1646  */
    { (yyval.expression) = bool_const((yyvsp[0].boolean)); }
#line 1902 "cool.tab.c" /* yacc.c:1646  */
    break;


#line 1906 "cool.tab.c" /* yacc.c:1646  */
      default: break;
    }
  /* User semantic actions sometimes alter yychar, and that requires
     that yytoken be updated with the new translation.  We take the
     approach of translating immediately before every use of yytoken.
     One alternative is translating here after every semantic action,
     but that translation would be missed if the semantic action invokes
     YYABORT, YYACCEPT, or YYERROR immediately after altering yychar or
     if it invokes YYBACKUP.  In the case of YYABORT or YYACCEPT, an
     incorrect destructor might then be invoked immediately.  In the
     case of YYERROR or YYBACKUP, subsequent parser actions might lead
     to an incorrect destructor call or verbose syntax error message
     before the lookahead is translated.  */
  YY_SYMBOL_PRINT ("-> $$ =", yyr1[yyn], &yyval, &yyloc);

  YYPOPSTACK (yylen);
  yylen = 0;
  YY_STACK_PRINT (yyss, yyssp);

  *++yyvsp = yyval;

  /* Now 'shift' the result of the reduction.  Determine what state
     that goes to, based on the state we popped back to and the rule
     number reduced by.  */

  yyn = yyr1[yyn];

  yystate = yypgoto[yyn - YYNTOKENS] + *yyssp;
  if (0 <= yystate && yystate <= YYLAST && yycheck[yystate] == *yyssp)
    yystate = yytable[yystate];
  else
    yystate = yydefgoto[yyn - YYNTOKENS];

  goto yynewstate;


/*--------------------------------------.
| yyerrlab -- here on detecting error.  |
`--------------------------------------*/
yyerrlab:
  /* Make sure we have latest lookahead translation.  See comments at
     user semantic actions for why this is necessary.  */
  yytoken = yychar == YYEMPTY ? YYEMPTY : YYTRANSLATE (yychar);

  /* If not already recovering from an error, report this error.  */
  if (!yyerrstatus)
    {
      ++yynerrs;
#if ! YYERROR_VERBOSE
      yyerror (YY_("syntax error"));
#else
# define YYSYNTAX_ERROR yysyntax_error (&yymsg_alloc, &yymsg, \
                                        yyssp, yytoken)
      {
        char const *yymsgp = YY_("syntax error");
        int yysyntax_error_status;
        yysyntax_error_status = YYSYNTAX_ERROR;
        if (yysyntax_error_status == 0)
          yymsgp = yymsg;
        else if (yysyntax_error_status == 1)
          {
            if (yymsg != yymsgbuf)
              YYSTACK_FREE (yymsg);
            yymsg = (char *) YYSTACK_ALLOC (yymsg_alloc);
            if (!yymsg)
              {
                yymsg = yymsgbuf;
                yymsg_alloc = sizeof yymsgbuf;
                yysyntax_error_status = 2;
              }
            else
              {
                yysyntax_error_status = YYSYNTAX_ERROR;
                yymsgp = yymsg;
              }
          }
        yyerror (yymsgp);
        if (yysyntax_error_status == 2)
          goto yyexhaustedlab;
      }
# undef YYSYNTAX_ERROR
#endif
    }



  if (yyerrstatus == 3)
    {
      /* If just tried and failed to reuse lookahead token after an
         error, discard it.  */

      if (yychar <= YYEOF)
        {
          /* Return failure if at end of input.  */
          if (yychar == YYEOF)
            YYABORT;
        }
      else
        {
          yydestruct ("Error: discarding",
                      yytoken, &yylval);
          yychar = YYEMPTY;
        }
    }

  /* Else will try to reuse lookahead token after shifting the error
     token.  */
  goto yyerrlab1;


/*---------------------------------------------------.
| yyerrorlab -- error raised explicitly by YYERROR.  |
`---------------------------------------------------*/
yyerrorlab:

  /* Pacify compilers like GCC when the user code never invokes
     YYERROR and the label yyerrorlab therefore never appears in user
     code.  */
  if (/*CONSTCOND*/ 0)
     goto yyerrorlab;

  /* Do not reclaim the symbols of the rule whose action triggered
     this YYERROR.  */
  YYPOPSTACK (yylen);
  yylen = 0;
  YY_STACK_PRINT (yyss, yyssp);
  yystate = *yyssp;
  goto yyerrlab1;


/*-------------------------------------------------------------.
| yyerrlab1 -- common code for both syntax error and YYERROR.  |
`-------------------------------------------------------------*/
yyerrlab1:
  yyerrstatus = 3;      /* Each real token shifted decrements this.  */

  for (;;)
    {
      yyn = yypact[yystate];
      if (!yypact_value_is_default (yyn))
        {
          yyn += YYTERROR;
          if (0 <= yyn && yyn <= YYLAST && yycheck[yyn] == YYTERROR)
            {
              yyn = yytable[yyn];
              if (0 < yyn)
                break;
            }
        }

      /* Pop the current state because it cannot handle the error token.  */
      if (yyssp == yyss)
        YYABORT;


      yydestruct ("Error: popping",
                  yystos[yystate], yyvsp);
      YYPOPSTACK (1);
      yystate = *yyssp;
      YY_STACK_PRINT (yyss, yyssp);
    }

  YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
  *++yyvsp = yylval;
  YY_IGNORE_MAYBE_UNINITIALIZED_END


  /* Shift the error token.  */
  YY_SYMBOL_PRINT ("Shifting", yystos[yyn], yyvsp, yylsp);

  yystate = yyn;
  goto yynewstate;


/*-------------------------------------.
| yyacceptlab -- YYACCEPT comes here.  |
`-------------------------------------*/
yyacceptlab:
  yyresult = 0;
  goto yyreturn;

/*-----------------------------------.
| yyabortlab -- YYABORT comes here.  |
`-----------------------------------*/
yyabortlab:
  yyresult = 1;
  goto yyreturn;

#if !defined yyoverflow || YYERROR_VERBOSE
/*-------------------------------------------------.
| yyexhaustedlab -- memory exhaustion comes here.  |
`-------------------------------------------------*/
yyexhaustedlab:
  yyerror (YY_("memory exhausted"));
  yyresult = 2;
  /* Fall through.  */
#endif

yyreturn:
  if (yychar != YYEMPTY)
    {
      /* Make sure we have latest lookahead translation.  See comments at
         user semantic actions for why this is necessary.  */
      yytoken = YYTRANSLATE (yychar);
      yydestruct ("Cleanup: discarding lookahead",
                  yytoken, &yylval);
    }
  /* Do not reclaim the symbols of the rule whose action triggered
     this YYABORT or YYACCEPT.  */
  YYPOPSTACK (yylen);
  YY_STACK_PRINT (yyss, yyssp);
  while (yyssp != yyss)
    {
      yydestruct ("Cleanup: popping",
                  yystos[*yyssp], yyvsp);
      YYPOPSTACK (1);
    }
#ifndef yyoverflow
  if (yyss != yyssa)
    YYSTACK_FREE (yyss);
#endif
#if YYERROR_VERBOSE
  if (yymsg != yymsgbuf)
    YYSTACK_FREE (yymsg);
#endif
  return yyresult;
}
#line 304 "cool.y" /* yacc.c:1906  */


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

