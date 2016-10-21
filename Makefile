
# Classpath para compilar y correr el programa
CLASSPATH=$(PWD)/lib/java-cup-11a.jar:.

make: Yylex.java parser.java Lab11.class lab11.sh

lab11.sh:
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
check: lab11.sh grading.py
	python grading.py

# Submit para el GES
submit: lab11.zip
	@echo 'Creando arhivo para subir al GES ...'

clean:
	rm Yylex.java
	rm parser.java
	rm sym.java
	rm *.class 