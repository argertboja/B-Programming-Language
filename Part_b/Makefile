CC     = g++
CXX    = g++
LEX    = flex
PROG   = example

all: $(PROG)

lex.yy.c: $(PROG).l
	$(LEX) $(PROG).l  

$(PROG): lex.yy.c
	$(CXX) -o $(PROG) lex.yy.c -ll

test: cs315f08_group48.test
	cat cs315f08_group48.test | ./$(PROG)

clean:
	-rm -f lex.yy.c
	-rm -f $(PROG)