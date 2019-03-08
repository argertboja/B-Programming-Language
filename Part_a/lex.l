space			[ \t]+
newline			[\n]
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

endstmt 		\;
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
elseifstmt		"but in case"
elsethen		otherwise

progInit 		start

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

return 			return

string 			\"([^\\\"]|\\\"|\\\n|\\\\)*\"

%%
{progInit}		printf("<PROGINIT>\n");
{ifstmt}		printf("<IFSTMT>\n");
{elseifstmt}		printf("<ELSEIFSTMT>\n");
{elsethen}		printf("<ELSESTHEN>\n");
{loop}			printf("<LOOP>\n");
{boolean}		printf("<BOOLEAN>\n");
{input}			printf("<INPUT>\n");
{output} 		printf("<OUTPUT>\n");
{variable}		printf("<VARIABLE>\n");
{constants}		printf("<CONSTANTS>\n");
{lrb}			printf("<LRB>\n");
{rrb}			printf("<RRB>\n");
{lcb}			printf("<LCB>\n");
{rcb}			printf("<RCB>\n");
{endstmt} 		printf("<ENDSTMT>\n");
{and} 			printf("<AND>\n");
{or} 			printf("<OR>\n");
{iff} 			printf("<IFF>\n");
{ebnb} 			printf("<EBNB>\n");
{negation} 		printf("<NEGATION>\n");
{imply} 		printf("<IMPLY>\n");
{predicatefunct} 	printf("<PREDICATEFUNCT>\n");
{predicateinst} 	printf("<PREDICATEINST>\n");
{comma} 		printf("<COMMA>\n");
{add} 			printf("<ADD>\n");
{sub} 			printf("<SUB>\n");
{div} 			printf("<DIV>\n");
{mult} 			printf("<MULT>\n");
{integertype} 		printf("<INTEGERTYPE>\n");
{int} 			printf("<INT>\n");
{assign} 		printf("<ASSIGN>\n");
{booleantype} 		printf("<BOOLEANTYPE>\n");
{stringtype} 		printf("<STRINGTYPE>\n");
{string} 		printf("<STRING>\n");
{return} 		printf("<RETURN>\n");
{parameter} 		printf("<PARAMETER>\n");
{beq} 			printf("<BEQ>\n");
{lt} 			printf("<LT>\n");
{lte} 			printf("<LTE>\n");
{gt} 			printf("<GT>\n");
{gte} 			printf("<GTE>\n");
{argument} 		printf("<ARGUMENT>\n");

{comment}		;
{space}			;
{newline}		;

%%

int yywrap(void) {
	return 1;
}

int main(void) {
	yylex();
	return 0;
}