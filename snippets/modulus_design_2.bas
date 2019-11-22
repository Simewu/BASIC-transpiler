
REM "Modulus Design #2 Demo"

Zoom=3000000
Size=1
PRINT "Another design!"
FOR X=Size/2 TO ScreenWidth+Size/2 STEP Size
	FOR Y=Size/2 TO ScreenHeight+Size/2 STEP Size
		x=X-ScreenWidth/2-Size/2
		y=Y-ScreenHeight/2-Size/2
		n=MOD(Zoom/ABS(x*y),255)
		COLOR n,n,n
		POINT X,Y,Size
	NEXT
NEXT