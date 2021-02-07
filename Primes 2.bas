100 REM ***********************************
110 REM *                                 *
120 REM * Find primes up to input limit   *
125 REM * 255 array size ok for 65,000ish *
130 REM *                                 *
140 REM * Tim Holyoake, 7th February 2021 *
150 REM *                                 *
160 REM * After Trevor Lusty's column in  *
170 REM * Computing Today, March 1980.    *
180 REM *                                 *
190 REM ***********************************
199 CLS
200 PRINT "Enter prime number limit (greater than 18) ";
210 INPUT L
220 IF L<19 THEN END
239 REM Array for storing primes found that are >= 17
240 DIM P(255)
250 A=2:B=3:C=5:D=7:E=11:F=13:T=0.00001
260 PRINT ".";A;B;".";C;".";D;"...";E;".";F;"...";
319 REM N keeps track of how much space is used in array P
320 P(1)=17:X=19:N=1
329 REM Lines 330 - 365 sieve out all multiples up to 13
330 IF X=B*INT(X/B+T) THEN PRINT ".."; : GOTO 480
340 IF X=C*INT(X/C+T) THEN PRINT ".."; : GOTO 480
350 IF X=D*INT(X/D+T) THEN PRINT ".."; : GOTO 480
360 IF X=E*INT(X/E+T) THEN PRINT ".."; : GOTO 480
365 IF X=F*INT(X/F+T) THEN PRINT ".."; : GOTO 480
369 REM X is not a multiple of 2,3,5,7,11 or 13
370 SR = SQR(X)
380 FOR J=1 TO N
390 W = P(J)
399 REM *** No need to sieve past the square root of X
400 IF W>SR THEN 430
410 IF X=W*INT(X/W+T) THEN PRINT ".."; : GOTO 480
420 NEXT J
429 REM Found a new prime, add it to array P, increment count N
430 N = N+1
438 REM *** Can store first 255 primes found - good for X < 65,000ish
439 REM *** Only add a new prime to array if space for it
440 IF N > 255 THEN 460
450 P(N) = X
460 PRINT ".";X;
479 REM Ignore all even numbers > 2
480 X = X+A
489 REM *** Test all numbers up to limit
490 IF X < L THEN 330
500 END