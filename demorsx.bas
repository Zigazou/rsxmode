10 'Demo program for mixed modes
20 ON ERROR GOTO 30000
30 ON BREAK GOSUB 30100
40 GOSUB 1000
50 GOSUB 2000
60 GOSUB 3000
70 GOSUB 4000
80 GOSUB 5000
90 GOSUB 6000
100 END
1000 '---- Initialize colors and mode ----
1010 BORDER 0
1020 INK 0,0
1030 INK 1,13
1040 INK 2,26
1050 INK 3,6
1060 |NORM,1
1070 CLS
1080 |SETM,0,2,1,0,2,0,3,1
1090 |BORD,5,13,0,13,1,0,2,0,3,6,4,6
1100 RETURN
2000 '---- Define first zone (mode 2) ----
2010 |MODE,2
2020 WINDOW 1,80,1,5
2030 PEN 0
2040 PAPER 1
2050 CLS
2060 PRINT
2070 PRINT "  ";STRING$(76,42)
2080 PRINT"  *This is an example of the split screen modes on the CPC464, this is mode 2*"
2090 PRINT"  ";STRING$(76,"*")
2100 RETURN
3000 '---- Define third zone (mode 1) ----
3010 |MODE,1
3020 WINDOW 1,40,20,25
3030 PEN 2
3040 PAPER 3
3050 CLS
3060 PRINT
3070 PRINT"       Mode 1, 40 columns window."
3080 LOCATE 9,4
3090 PEN 1
3100 PRINT"Popular Computing Weekly"
3110 RETURN
4000 '---- Define second zone (mode 0) ----
4010 PEN 1
4020 PAPER 0
4030 |MODE,0
4035 'MOVE 0,100:DRAW 640,100
4040 ORIGIN 0,120
4050 WINDOW 1,20,6,18
4060 PEN 6
4070 LOCATE 2,12
4080 PRINT"Press a key to CLS"
4090 RETURN
5000 '---- Draw stars on the second zone ----
5010 DEG
5020 DEFINT a,i,x,y
5030 FOR i = 1 to 500
5040 IF INKEY$<>"" THEN CLS:GOTO 5010
5050 col = RND(1)*15+1
5060 x = RND(1)*600
5070 y = RND(1)*160+20
5080 FOR a = 0 TO 360 STEP 30
5090 PLOT x,y,col
5100 DRAW x+20*sin(a),y+20*cos(a),col
5110 NEXT a
5120 NEXT i
5130 RETURN
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
