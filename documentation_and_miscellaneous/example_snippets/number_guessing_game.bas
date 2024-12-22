
REM "Number Guessing Game Demo"

num=INT(1+RND*100)
trys=0
INPUT "I'm thinking of a number between 1 and 100...:50",guess
WHILE guess<>num AND guess<>-1
	trys=trys+1
	IF guess>num THEN
		INPUT "Lower!",guess
	ELSE
		INPUT "Higher!",guess
	ENDIF
WEND
IF guess=num THEN
	ALERT "Correct!\nI was thinking of "+num+"!"
	COLOR 1,1,1
	TEXTFONT "Times",70
	DRAWTEXT "That took "+trys+" trys!",ScreenWidth/2,ScreenHeight/2
	RRECT 50,100,ScreenWidth-50,ScreenHeight-100,50,2
ELSE
	ALERT "Nope! I win!\nI was thinking of "+num+"."
ENDIF