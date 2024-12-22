
REM "Bell Curve Random Demo"

'This simulation will calculate random points that have a higher chance of being in the center of the screen then anywhere else on the screen

iterations=30

COLOR 1,1,1,0.1

loop:
SLEEP 0.01
FOR i=1 TO 500 'this loop improves performance
	x=0
	y=0
	FOR j=1 TO iterations
		x=x+RND
		y=y+RND
	NEXT
	x=x/iterations
	y=y/iterations
	x=ScreenWidth/2+(x*2-1)*ScreenHeight
	y=ScreenHeight/2+(y*2-1)*ScreenHeight
	POINT x,y
NEXT
GOTO loop