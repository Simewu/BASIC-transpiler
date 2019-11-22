
REM "String Functions Demo"

ScreenHeight=10
ConsoleHeight=200

BCOLOR 1,1,1
TCOLOR 0,0,0
PRINT "PRINT \"Hello World\":\t\t\t";
PRINT "Hello World"
PRINT "PRINT LEN(\"Hello World\"):\t\t";
PRINT LEN("Hello World")
PRINT "PRINT LEFT$(\"Hello World\",7):\t\t";
PRINT LEFT$("Hello World",7)
PRINT "PRINT RIGHT$(\"Hello World\",7):\t\t";
PRINT RIGHT$("Hello World",7)
PRINT "PRINT MID$(\"Hello World\",1,6):\t\t";
PRINT MID$("Hello World",1,6)
PRINT "PRINT UPPER$(\"Hello World\"):\t\t";
PRINT UPPER$("Hello World")
PRINT "PRINT LOWER$(\"Hello World\"):\t\t";
PRINT LOWER$("Hello World")
PRINT "PRINT REPLACE$(\"Hello World\",\"H\",\"W\"):\t";
PRINT REPLACE$("Hello World","H","W")
PRINT "PRINT REPLACE$(\"Hello World\",\"[f-z]\",\"*\"): ";
PRINT REPLACE$("Hello World","[f-z]","*")
PRINT "PRINT CHR$(\"Hello World\"):\t";
PRINT CHR$("Hello World")
PRINT "PRINT ASC(72):\t\t\t\t";
PRINT ASC(72)
PRINT "PRINT INDEXOF(\"Hello World\",\"W\"):\t";
PRINT INDEXOF("Hello World","W")
PRINT "PRINT \"Hello World\"[6]:\t\t\t";
PRINT "Hello World"[6]