
REM "Modulus Design #1 Demo"

Size=3
PRINT "When you multiply X and Y, and make the MOD of that the color."
FOR X=Size/2 TO ScreenWidth+Size/2 STEP Size
	FOR Y=Size/2 TO ScreenHeight+Size/2 STEP Size
		n=MOD(X*Y,255)
		COLOR n,n,n
		POINT X,Y,Size
	NEXT
NEXT