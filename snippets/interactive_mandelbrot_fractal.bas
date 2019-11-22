
REM "Interactive Mandelbrot Fractal Demo"

'Mandelbrot settings
realPart=0
complexPart=0
resolution=16
zoom=350
detail=25
iterations=30

updateDrawing=1
resBackup=resolution
ScreenWidth=1000
ScreenHeight=1000
xoff=-0.75
yoff=0

PRINT "Use the arrow keys to move around"
PRINT "Hold W/E to zoom"
PRINT "Hold A/D to change number of iterations"
PRINT "Hold Q/E to change density"
PRINT "Press J to generate a mid-resolution render (fast)"
PRINT "Press K to generate a high-resolution render (slow)"

loop:
SLEEP 0.01
IF KeyW=1 THEN
	zoom=zoom*1.05
	updateDrawing=1
ENDIF
IF KeyS=1 THEN
	zoom=zoom/1.05
	updateDrawing=1
ENDIF
IF KeyD=1 THEN
	iterations=iterations+0.5
	updateDrawing=1
ENDIF
IF KeyA=1 THEN
	iterations=iterations-0.5
	updateDrawing=1
ENDIF
IF UpArrow=1 THEN
	yoff=yoff-20/zoom
	updateDrawing=1
ENDIF
IF DownArrow=1 THEN
	yoff=yoff+20/zoom
	updateDrawing=1
ENDIF
IF LeftArrow=1 THEN
	xoff=xoff-20/zoom
	updateDrawing=1
ENDIF
IF RightArrow=1 THEN
	xoff=xoff+20/zoom
	updateDrawing=1
ENDIF
IF KeyE=1 THEN
	detail=detail+0.3
	updateDrawing=1
ENDIF
IF KeyQ=1 THEN
	detail=detail-0.3
	updateDrawing=1
ENDIF
IF KeyJ=1 THEN
	KeyJ=0
	TEXTFONT "Times",70
	COLOR 0,0,0,0.8
	RECT 0,ScreenHeight/2.25,ScreenWidth,ScreenHeight-ScreenHeight/2.25
	COLOR 1,1,1
	DRAWTEXT "Rendering...",ScreenWidth/2,ScreenHeight/2
	temp=resolution
	resolution=3
	GOSUB draw
	updateDrawing=0
ENDIF
IF KeyK=1 THEN
	KeyK=0
	INPUT "Please be patient during the high resolution render\nType \"ok\" to continue:ok",confirm
	IF confirm="ok" THEN
		TEXTFONT "Times",70
		COLOR 0,0,0,0.8
		RECT 0,ScreenHeight/2.25,ScreenWidth,ScreenHeight-ScreenHeight/2.25
		COLOR 1,1,1
		DRAWTEXT "Rendering...",ScreenWidth/2,ScreenHeight/2
		temp=resolution
		resolution=1
		GOSUB draw
		updateDrawing=0
	ENDIF
ENDIF
IF updateDrawing=1 THEN
	resolution=resBackup
	GOSUB draw
	updateDrawing=0
ENDIF
GOTO loop

draw:
SLEEP 0.01
CLS GFX
IF iterations<0 THEN
	iterations=0
ENDIF
IF detail<0 THEN
	detail=0
ENDIF
FOR X=0 TO ScreenWidth+resolution STEP resolution
	FOR Y=0 TO ScreenHeight+resolution STEP resolution
		X0=(X-ScreenWidth/2)/zoom+xoff
		Y0=(Y-ScreenHeight/2)/zoom+yoff
		GOSUB mandelbrot
		POINT X,Y,resolution
	NEXT
NEXT
RETURN

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
 'equation to get a smooth gradient
S=(I+1-LOG(ABS(LOG(ABS(SQR(C)))))/0.693147)
COLOR MOD(S*detail,255),MOD(S*detail,255),MOD(S*detail,255)
RETURN