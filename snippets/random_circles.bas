
REM "Random Circles Demo"

FOR i=1 TO 300
	COLOR RND,RND,RND,RND
	PosX=RND*ScreenWidth
	PosY=RND*ScreenHeight
	Radius=RND*50
	CIRCLE PosX,PosY,Radius
NEXT