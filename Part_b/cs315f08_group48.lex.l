%{
  int numberOfLines = 1;
  void yyerror(char *);
%}

space			[ \t\r]+
comment			[@]+.*

digit			[0-9]
lc			[a-z]
uc			[A-Z]

int 			[+-]?{digit}+

integertype 		integertype
booleantype 		booleantype
stringtype 		stringtype

lrb 			\(
rrb 			\)

lcb 			\{
rcb 			\}

endstmt 		;
comma 			\,

beq 			==
lt 			<
gt 			>
lte 			<=
gte 			>=

add 			\+
sub 			\-
div 			\/
mult 			\*

or 			\|
and 			\&
imply 			->
iff 			<->
ebnb 			_v_
negation 		'

ifstmt			"in case"
elsethen		otherwise

progInit 		start\(\)\{
progEnd			\}end
alphanumeric 		({lc}|{uc}|{digit})
boolean			TRUE|FALSE|AMBIGUOUS
variable 		#{lc}{alphanumeric}*
constants 		const{space}{variable}
predicatefunct 		predict{uc}{alphanumeric}*
predicateinst 		declare{space}predict{uc}{alphanumeric}*
parameter 		:{variable}:
argument 		:{variable}
assign 			=
loop			until
input 			scanin
output 			display
array 			{variable}\[\]
arrayelement		{variable}\[({digit}|{variable})\]

return 			return

string 			\"([^\\\"]|\\\"|\\\n|\\\\)*\"
%option yylineno
%%
{comment} {
	return COMMENT;
}
{space} ;

{progInit} {
	return PROGINIT;
}

{progEnd} {
	return PROGEND;
}
{ifstmt} {
	return IFSTMT;
}
{elsethen} {
	return ELSETHEN;
}
{loop} {
	return LOOP;
}
{boolean} {
	return BOOLEAN;
}
{input}{lrb}{variable}{rrb} {
	return INPUT;
}
{output}{lrb}{string}{rrb} {
	return OUTPUT;
}
{variable} {
	return VARIABLE;
}
{constants} {
	return CONSTANTS;
}

{array} { 
	return ARRAY;
}

{arrayelement} {
	return ARRAYELEMENT;
}

{lrb} {
	return LRB;
}
{rrb} {
	return RRB;
}
{lcb} {
	return LCB;
}
{rcb} {
	return RCB;
}
{endstmt} {
	return ENDSTMT;
}
{and} {
	return AND;
}
{or} {
	return OR;
}
{iff} {
	return IFF;
}
{ebnb} {
	return EBNB;
}
{negation} {
	return NEGATION;
}
{imply} {
	return IMPLY;
}
{predicatefunct} {
	return PREDICATEFUNCT;
}
{predicateinst} {
	return PREDICATEINST;
}
{add} {
	return ADD;
}
{sub} {
	return SUB;
}
{div} {
	return DIV;
}
{mult} {
	return MULT;
}
{comma} {
	return COMMA;
}
{integertype} {
	return INTEGERTYPE;
}
{int} {
	return INT;
}
{assign} {
	return ASSIGN;
}
{booleantype} {
	return BOOLEANTYPE;
}
{stringtype} {
	return STRINGTYPE;
}
{string} {
	return STRING;
}
{return}{lrb}{boolean}{rrb} {
	return RETURN;
}
{parameter} {
	return PARAMETER;
}
{beq} {
	return BEQ;
}
{lt} {
	return LT;
}
{lte} {
	return LTE;
}
{gt} {
	return GT;
}
{gte} {
	return GTE;
}
{argument} {
	return ARGUMENT;
}

. {
	return ERROR;
}

%%

int yywrap(void) {
	return 1;
}
