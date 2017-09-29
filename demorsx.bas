10 'Demo program for mixed modes
20 ON ERROR GOTO 30000
30 ON BREAK GOSUB 30100
40 GOSUB 1000
50 GOSUB 2000
60 GOSUB 3000
70 GOSUB 4000
80 GOSUB 5000
90 CLEAR INPUT
100 IF INKEY$="" THEN 100
110 GOSUB 6000
120 END
1000 '---- Initialize colors and mode ----
1010 BORDER 0
1020 INK 0,1
1030 INK 1,24
1040 INK 2,26
1050 INK 3,6
1060 |NORM,1
1070 CLS
1080 |SETM,0,2,1,0,2,0,3,1
1090 |BORD,5,24,0,24,1,1,2,1,3,6,4,6
1100 RETURN
2000 '---- Define first zone (mode 2) ----
2010 |MODE,2
2020 WINDOW 1,80,1,5
2030 PEN 0
2040 PAPER 1
2050 CLS
2060 MOVE 20,376:DRAWR 600,0,0
2061 MOVE 20,344:DRAWR 600,0,0
2062 MOVE 20,376:DRAW 20,344,0
2063 MOVE 620,376:DRAW 620,344,0
2070 LOCATE 4,3
2080 PRINT"Multi-mode on CPC 464 to 6128+. Here is mode 2! Wait for the Mandelbrot..."
2100 RETURN
3000 '---- Define third zone (mode 1) ----
3010 |MODE,1
3020 WINDOW 1,40,19,25
3030 PEN 2
3040 PAPER 3
3050 CLS
3060 FOR i%=1 TO 279
3070 c%=INT(RND(1)*11)
3080 PEN INT(RND(1)*3)
3090 PRINT CHR$(c%+192);
3100 NEXT
3110 RETURN
4000 '---- Define second zone (mode 0) ----
4010 PEN 1
4020 PAPER 0
4030 |MODE,0
4040 WINDOW 1,20,6,18
4070 RETURN
5000 '---- Draw Mandelbrot on the second zone ----
5010 'Code from https://www.genesis8bit.fr/archives/indexf.php?news_id=269
5020 'with some minor optimizations
5030 e=-1.3:m=0.0215:n=0.013:b%=14:l=4
5040 FOR y%=318 TO 112 STEP -2
5050 d=-2.4
5060 FOR x%=0 TO 636 STEP 4
5070 z=0:t=z
5080 i=0:j=i
5090 FOR a%=0 TO b%
5100 s=t-j+d:r=2*i*z+e:z=s:t=z*z:i=r:j=i*i
5110 IF t+j>=l THEN PLOT x%,y%,a%:a%=b%
5120 NEXT
5130 d=d+m
5140 NEXT
5150 e=e+n
5160 NEXT
5170 RETURN
6000 '---- Clean exit ----
6010 PEN 1
6020 PAPER 0
6030 |NORM,1
6040 RETURN
30000 '---- Error handler ----
30010 IF ERR=28 THEN PRINT"Please run LOADRSX.BAS before this program":STOP
30020 PRINT"Error";ERR;"at line";ERL
30030 END
30100 '---- Break handler ----
30110 GOSUB 6000
30120 PRINT"*BREAK*"
30130 END

