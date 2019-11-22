
REM "Mandelbrot Demo"

'Mandelbrot settings
resolution=2
zoom=350
iterations=100
realPart=0
complexPart=0

ScreenWidth=1000 'set the size of the canvas
ScreenHeight=1000

FOR X=0 TO ScreenWidth+resolution STEP resolution
	FOR Y=0 TO ScreenHeight+resolution STEP resolution
		X0=(X-ScreenWidth/2)/zoom-0.75
		Y0=(Y-ScreenHeight/2)/zoom
		GOSUB mandelbrot
		POINT X,Y,resolution
	NEXT
NEXT
PRINT "Mandelbrot has been rendered."

mandelbrot: 'gets a pixel color
XREAL=realPart
YCOMP=complexPart
FOR I=0 TO iterations
	X2=XREAL*XREAL-YCOMP*YCOMP+X0
	YCOMP=2*XREAL*YCOMP+Y0
	C=X2*X2+YCOMP*YCOMP
	XREAL=X2
	IF C>=16 THEN
		BREAK
	ENDIF
NEXT
IF I<iterations THEN
	COLOR 0,0,0
ELSE
	COLOR 1,1,1
ENDIF
RETURN