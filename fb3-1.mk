calc: calc.l calc.y calc.h calc_funcs.c
	bison -d calc.y
	flex -o calc.lex.c calc.l
	cc -o $@ calc.tab.c calc.lex.c calc_funcs.c
