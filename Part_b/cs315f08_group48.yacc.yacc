%{
   int boolean = 0;
   void yyerror(char *);
   int yylex(void);
 %}

// program initialization token
%token PROGINIT
%token PROGEND

//conditionals 
%token IFSTMT
%token ELSETHEN

// comment
%token COMMENT

//loop
%token LOOP

// input & output
%token INPUT
%token OUTPUT

// variable & constants
%token VARIABLE
%token CONSTANTS

//brackets, comma and semicolon
%token LRB
%token RRB
%token LCB
%token RCB
%token ENDSTMT
%token COMMA

%token ERROR
%token ARRAYELEMENT
%token ARRAY

// logical expressions
%token AND
%token OR
%token IFF 
%token EBNB
%token NEGATION
%token IMPLY

// predicate functions
%token PREDICATEFUNCT
%token PREDICATEINST

//token args & params
%token ARGUMENT
%token PARAMETER

//arithmetic operations
%token ADD
%token SUB
%token DIV
%token MULT

// variable types
%token INTEGERTYPE
%token STRINGTYPE
%token BOOLEANTYPE

//alphabetic and numeric values
%token INT
%token STRING
%token BOOLEAN

//operator '='
%token ASSIGN

%token RETURN

//comparison
%token BEQ
%token LT
%token LTE
%token GT
%token GTE

%union {
   char  *string;
   int integer;
}


%type <integer> INT
%type <string> PREDICATEFUNCT
%type <string> PREDICATEINST
%left ADD SUB 
%left MULT DIV

%start init

%%

init:		PROGINIT start;

start:		  stmt ENDSTMT
		| funct_declare ENDSTMT start
		| call_predicate ENDSTMT start
		| stmt ENDSTMT start
		| stmt ENDSTMT COMMENT start
		| COMMENT
		| PROGEND		
		;

stmt: 		  bool_var ASSIGN bool_expr 
		| bool_var ASSIGN BOOLEAN
		| bool_const ASSIGN BOOLEAN
		| int_var ASSIGN LRB ath_expr RRB
		| int_var ASSIGN INT
		| string_var ASSIGN string_expr
		| string_var ASSIGN STRING
		| cond 
		| loop_stmt
		| OUTPUT
		| INPUT
		| RETURN
		; 

bool_expr:        call_predicate
		| bool_var connectives bool_expr
		| bool_var connectives bool_var
		| bool_const
		| connectives VARIABLE
		| LRB int_var comparison int_var RRB
		;

ath_expr:	 int_var operation int_var;

operation: ADD | SUB | MULT | DIV;

string_expr:     string_var ADD string_var;


cond: IFSTMT LRB  bool_expr RRB LCB  start RCB cond_tail
      | IFSTMT LRB  bool_expr RRB  cond_tail
      ;

cond_tail: ELSETHEN LCB start RCB 
          | ELSETHEN 
          ;

loop_stmt:	  LOOP bool_expr LCB start RCB;

funct_declare:   PREDICATEINST LRB param_list RRB LCB start RCB;

bool_var:	BOOLEANTYPE VARIABLE
		| BOOLEAN
		| VARIABLE
		;

int_var:        INTEGERTYPE VARIABLE
		| INT
		| VARIABLE
		;

string_var:      STRINGTYPE VARIABLE 
		| VARIABLE
		|  STRING
		;

bool_const:	  BOOLEANTYPE CONSTANTS
		| CONSTANTS
		;

call_predicate:  PREDICATEFUNCT LRB arg_list RRB;

param_list:	  PARAMETER 
		| PARAMETER COMMA param_list
		|
		;

arg_list:	  ARGUMENT
		| ARGUMENT COMMA arg_list
		|
		;

connectives:	  AND | OR | IMPLY | IFF | EBNB | NEGATION;

comparison:	  BEQ | LT | LTE | GT | GTE;

%%
#include "lex.yy.c"
// report errors
void yyerror (char *s) {
	boolean = 1;
	printf("Error:%s on line:%d\n",s,yylineno);
}

main() {
	return yyparse();
	if (boolean != 0) {
		printf("Code successfully loaded");
}
}


		
	
