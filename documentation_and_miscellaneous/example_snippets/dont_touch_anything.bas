
REM "Don't Touch Anything Demo"

px=ScreenWidth/2
py=ScreenHeight/2

length=40
DIM ox(length),oy(length),os(length),vx(length),vy(length)
frames=0
PRINT "Don't let your mouse cursor touch anything!"

FOR i=1 TO length
	ox(i)=RND*ScreenWidth
	oy(i)=RND*ScreenHeight
	vx(i)=RND*2-1
	vy(i)=RND*2-1
	os(i)=10
NEXT

loop:
SLEEP 0.01
IF Mouse>=0 OR frames=0 THEN
	frames=frames+1
	GOSUB runStep
	COLORHUE frames%360,0.5
	BCOLORHUE frames/3%360,0.9,0.3
ENDIF
GOTO loop

runStep:
SLEEP 0.01
CLS GFX
px=MouseX
py=MouseY
collisionDetected=0
POINT px,py
FOR i=1 TO length
	ox(i)=ox(i)+vx(i)
	oy(i)=oy(i)+vy(i)
	IF ox(i)<-os(i)THEN
		ox(i)=ScreenWidth+os(i)
		vx(i)=vx(i)+RND-0.5
		vy(i)=vy(i)+RND-0.5
		os(i)=os(i)+1
	ENDIF
	IF ox(i)>ScreenWidth+os(i)THEN
		ox(i)=-os(i)
		vx(i)=vx(i)+RND-0.5
		vy(i)=vy(i)+RND-0.5
		os(i)=os(i)+1
	ENDIF
	IF oy(i)<-os(i)THEN
		oy(i)=ScreenHeight+os(i)
		vx(i)=vx(i)+RND-0.5
		vy(i)=vy(i)+RND-0.5
		os(i)=os(i)+1
	ENDIF
	IF oy(i)>ScreenHeight+os(i)THEN
		oy(i)=-os(i)
		vx(i)=vx(i)+RND-0.5
		vy(i)=vy(i)+RND-0.5
		os(i)=os(i)+1
	ENDIF
	CIRCLE ox(i),oy(i),os(i)
	GOSUB checkCollision
NEXT
DRAWTEXT frames,30,10
IF collisionDetected=1 THEN
	FOR i=10 TO ScreenWidth STEP 20
		CIRCLE px,py,i,1
	NEXT
	PRINT "You survived "+frames+" frames."
	END
ENDIF
RETURN

checkCollision:
dx=px-ox(i)
dy=py-oy(i)
dt=SQR(dx*dx+dy*dy)
IF dt+1<=os(i)THEN
	collisionDetected=1
ENDIF
RETURN