
REM "Simple Hue Demo"

FOR X=0 TO ScreenWidth
	COLORHUE 360*X/ScreenWidth
	LINE X,0,X,ScreenHeight
NEXT