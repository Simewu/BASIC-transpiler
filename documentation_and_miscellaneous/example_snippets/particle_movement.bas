
REM "Particle Movement Demo"

numBalls=800
Friction=10

DIM X(numBalls),Y(numBalls),VX(numBalls),VY(numBalls),Size(numBalls)
DIM Hue(numBalls),Saturation(numBalls),Value(numBalls)
sw=ScreenWidth
sh=ScreenHeight
FOR i=1 TO numBalls
	 'Initialize the arrays starting values
	X(i)=RND*sw
	Y(i)=RND*sh
	VY(i)=RND*10-5
	VX(i)=RND*10-5
	Size(i)=5+RND*10
	Hue(i)=360*i/numBalls
	Saturation(i)=(RND+1)/2 '0.5 to 1 saturation
	Value(i)=(RND+1)/2 '0.5 to 1 value
NEXT
PRINT "The particles are attracted to your mouse pointer."

loop:
SLEEP 0.05
CLS GFX
FOR i=1 TO numBalls
	IF Mouse=1 THEN
		 'Make the particles orbit the mouse
		dx=MouseX-X(i)
		dy=MouseY-Y(i)
		dist=SQR(dx*dx+dy*dy)
		VX(i)=VX(i)+(dx/dist)
		VY(i)=VY(i)+(dy/dist)
	ENDIF
	
	 'Increment the particle positions by the velocity of that particle
	X(i)=X(i)+VX(i)/Friction
	Y(i)=Y(i)+VY(i)/Friction
	
	 'Wall collision detection:
	IF Y(i)<Size(i)THEN
		Y(i)=Size(i)
		VY(i)=-VY(i)
	ENDIF
	IF Y(i)>ScreenHeight-Size(i)THEN
		Y(i)=ScreenHeight-Size(i)
		VY(i)=-VY(i)
	ENDIF
	IF X(i)<Size(i)THEN
		X(i)=Size(i)
		VX(i)=-VX(i)
	ENDIF
	IF X(i)>ScreenWidth-Size(i)THEN
		X(i)=ScreenWidth-Size(i)
		VX(i)=-VX(i)
	ENDIF
	
	COLORHUE Hue(i),Saturation(i),Value(i),0.8
	CIRCLE X(i),Y(i),Size(i)
NEXT
GOTO loop