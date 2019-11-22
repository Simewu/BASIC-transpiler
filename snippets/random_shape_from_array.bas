
REM "Random Shape from Array Demo"

PTS=10
DIM x(PTS),y(PTS)

FOR i=1 TO PTS
	x(i)=RND*ScreenWidth
	y(i)=RND*ScreenHeight
NEXT

SHAPE PTS,x,y