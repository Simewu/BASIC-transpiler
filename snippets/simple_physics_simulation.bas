
REM "Simple Physics Simulation Demo"

ScreenWidth=300
ScreenHeight=500

PosX=ScreenWidth/2 'Ball start x position
PosY=ScreenHeight/2 'Ball start y position
Radius=30 'Size of ball
VelX=-10+RND*20 'Make the inital x velocity random from -10 to 10
VelY=RND*-10 'Make the inital y velocity random from -10 to 0
Gravity=0.15
Friction=1.1

PRINT "The ball orbits around your mouse!"

loop:
SLEEP 0.01
CLS GFX
VelY=VelY+Gravity
PosX=PosX+VelX
PosY=PosY+VelY

IF Mouse=1 THEN
	VelX=-10+RND*20
	VelY=RND*-20
	PosX=MouseX
	PosY=MouseY
ENDIF
IF Mouse=0 THEN 'Make the ball orbit the mouse
	dx=MouseX-PosX
	dy=MouseY-PosY
	dist=SQR(dx*dx+dy*dy)
	VelX=VelX+(dx/dist)/3
	VelY=VelY+(dy/dist)/3
ENDIF

IF PosY<Radius THEN 'Top Wall Collision
	PosY=Radius
	VelY=-VelY/Friction
	VelX=VelX/Friction
ENDIF
IF PosY>ScreenHeight-Radius THEN 'Bottom Wall Collision
	PosY=ScreenHeight-Radius
	VelY=-VelY/Friction
	VelX=VelX/Friction
ENDIF
IF PosX<Radius THEN 'Left Wall Collision
	PosX=Radius
	VelX=-VelX/Friction
	VelY=VelY/Friction
ENDIF
IF PosX>ScreenWidth-Radius THEN 'Right Wall Collision
	PosX=ScreenWidth-Radius
	VelX=-VelX/Friction
	VelY=VelY/Friction
ENDIF

CIRCLE PosX,PosY,Radius

GOTO loop