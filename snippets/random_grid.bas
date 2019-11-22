
REM "Random Grid Demo"

Size=10
FOR X=Size/2 TO ScreenWidth+Size/2 STEP Size
	FOR Y=Size/2 TO ScreenHeight+Size/2 STEP Size
		COLOR RND,RND,RND
		POINT X,Y,Size
	NEXT
NEXT