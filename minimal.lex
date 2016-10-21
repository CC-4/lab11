import java_cup.runtime.Symbol;
%%
%{
    private int curr_lineno = 1;
    int curr_lineno() {
      return curr_lineno;
    }
%}

%cup
%%

"def" 				{ return new Symbol(sym.KEY_DEF); }
"if" 				{ return new Symbol(sym.KEY_IF); }
"then" 				{ return new Symbol(sym.KEY_THEN); }
"else" 				{ return new Symbol(sym.KEY_ELSE); }

";" 				{ return new Symbol(sym.SEMI); }
"+" 				{ return new Symbol(sym.PLUS); }
"-" 				{ return new Symbol(sym.MINUS); }
"*" 				{ return new Symbol(sym.TIMES); }
"," 				{ return new Symbol(sym.COMMA); }
"/" 				{ return new Symbol(sym.DIV); }
"(" 				{ return new Symbol(sym.LPAREN); }
")" 				{ return new Symbol(sym.RPAREN); }
"=" 				{ return new Symbol(sym.EQUAL); }

[0-9]+				{ return new Symbol(sym.INT, AbstractTable.inttable.addString(yytext())); }
"0x"[0-9A-Za-z]+	{ return new Symbol(sym.INT, AbstractTable.inttable.addString(yytext())); }
"0"[0-7]+ 			{ return new Symbol(sym.INT, AbstractTable.inttable.addString(yytext())); }
"0b"[0-1]+			{ return new Symbol(sym.INT, AbstractTable.inttable.addString(yytext())); }


[a-z][a-zA-Z0-9_]* 	{ return new Symbol(sym.ID, AbstractTable.idtable.addString(yytext())); }

[ \t\r\f]			{ /* ignore white space. */ }
\n 					{ curr_lineno++; }
. 					{ System.err.println("Illegal character: "+ yytext() + " " + (int)yytext().charAt(0)); }
