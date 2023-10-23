
%{
	#include <stdio.h>
	int yylex(void);
	void yyerror(char *);
%}


%left '+' '-'
%left '*'
%%

List    : Expr '.' List {printf("parsed expression \n");}
        | Expr '.' {printf("parsed expression \n");}

Expr    : Term Exprs
        ;

Exprs   : '+' Term Exprs
        | '-' Term Exprs
        | //empty
        ;

Term    : Factor Terms
        ;

Terms   : '*' Factor Terms
        | //empty
        ;

Factor  : 'n'
        | '-' Expr
        | '(' Expr ')'
        | '|' Expr '|'
        ;

%%

void yyerror(char *s) {
	fprintf(stderr, "%s\n", s);
	return;
}

int main(void) {
	yyparse();
	return 0;
}
