
REM "Random Beep Music Demo"

TCOLOR 1,1,1
PRINT "Put some headphones on learn to speak robot!"
SLEEP 3

loop:
r=RND
SLEEP r
BEEP 100+RND*1000,r
OldX=X
OldY=Y
X=RND*ScreenWidth
Y=RND*ScreenHeight
COLOR RND/2,RND/2,RND/2
POINT X,Y,10+RND*80
IF OldX<>0 AND OldY<>0 THEN
	COLOR 1,1,1
	LINE X,Y,OldX,OldY
ENDIF
GOTO loop