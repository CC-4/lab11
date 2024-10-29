
CLASSDIR= /usr/class/cc4/cool
CLASSPATH := ${CLASSDIR}/lib:.:/usr/java/lib/rt.jar

lab11: Lab11.class
	@rm -f lab11
	echo '#!/bin/sh' >> lab11
	echo 'java -classpath ${CLASSPATH}:`dirname $$0` Lab11 $$*' >> lab11
	chmod 755 lab11

Yylex.java: minimal.lex
	java -classpath ${CLASSDIR}/lib/jlex.jar JLex.Main minimal.lex
	mv minimal.lex.java Yylex.java

parser.java: minimal.cup
	java -classpath ${CLASSDIR}/lib/java-cup-11a.jar java_cup.Main minimal.cup

Lab11.class: parser.java sym.java Yylex.java cool-tree.java Lab11.java SymbolTable.java
	javac -classpath ${CLASSPATH}  -d . parser.java sym.java Yylex.java SymbolTable.java cool-tree.java TreeConstants.java CgenSupport.java Lab11.java

# Autrograder
check: lab11 grading.py
	python3 grading.py

clean:
	rm -rf grading Yylex.java parser.java sym.java *.class
