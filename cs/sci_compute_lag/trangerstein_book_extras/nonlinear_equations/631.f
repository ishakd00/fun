c http://www.netlib.org/toms/631
C     ALGORITHM 631 COLLECTED ALGORITHMS FROM ACM.
C     ALGORITHM APPEARED IN ACM-TRANS. MATH. SOFTWARE, VOL.11, NO. 2,
C     JUN., 1985, P. 120-134.
C     PROGRAM DRIVER
C----------------------------------------------------------------------C
C                                                                      C
C  DRIVER ... APPLICATION OF ZERO1 AND ZERO2 TO THE EQUATION           C
C                  X**7 + 28*X**4 - 480 = 0                            C
C             WITH BRACKETS  A = 1, B = 2,                             C
C             AND TOLERANCES  PRECIS = R1MACH(4), DWARF = R1MACH(1)    C
C                                                                      C
C----------------------------------------------------------------------C
C
      INTEGER NOUT,NDEG,IER
      REAL PRECIS,DWARF
      DOUBLE PRECISION A,B,ZERO
      EXTERNAL EVF,EVFDF

      DATA NOUT/6/
C                             FIRST EXECUTABLE STATEMENT.
      NDEG = 4
      PRECIS = R1MACH(4)
      DWARF = R1MACH(1)
      WRITE (NOUT,9001) PRECIS,DWARF
      A = 1.D0
      B = 2.D0
      CALL ZERO1(EVF,A,B,NDEG,PRECIS,DWARF,ZERO,IER)
      WRITE (NOUT,9011)
      WRITE (NOUT,9031) ZERO,A,B,IER
      A = 1.D0
      B = 2.D0
      CALL ZERO2(EVFDF,A,B,NDEG,PRECIS,DWARF,ZERO,IER)
      WRITE (NOUT,9021)
      WRITE (NOUT,9031) ZERO,A,B,IER
      STOP

 9001 FORMAT ('0DRIVER ... APPLICATION OF ZERO1 AND ZERO2 TO THE ',
     .  'EQUATION'/18X,'X**7 + 28*X**4 - 480 = 0'/13X,
     .  'WITH BRACKETS  A = 1, B = 2,'/13X,'AND TOLERANCES  PRECIS = ',
     .  1PE7.1,' DWARF = ',1PE7.1/)
 9011 FORMAT ('0OUTPUT FROM ZERO1')
 9021 FORMAT ('0OUTPUT FROM ZERO2')
 9031 FORMAT ('   ZERO =',F19.15,'   A =',F19.15,'   B =',F19.15,
     .  '   IER =',I3)

      END
C     REAL FUNCTION R1MACH(I)
C ***BEGIN PROLOGUE  R1MACH
C ***DATE WRITTEN   790101   (YYMMDD)
C ***REVISION DATE  820801   (YYMMDD)
C ***CATEGORY NO.  R1
C ***KEYWORDS  MACHINE CONSTANTS
C ***AUTHOR  FOX, P. A., (BELL LABS)
C           HALL, A. D., (BELL LABS)
C           SCHRYER, N. L., (BELL LABS)
C ***PURPOSE  RETURNS SINGLE PRECISION MACHINE DEPENDENT CONSTANTS
C ***DESCRIPTION
C     R1MACH CAN BE USED TO OBTAIN MACHINE-DEPENDENT PARAMETERS
C     FOR THE LOCAL MACHINE ENVIRONMENT.  IT IS A FUNCTION
C     SUBROUTINE WITH ONE (INPUT) ARGUMENT, AND CAN BE CALLED
C     AS FOLLOWS, FOR EXAMPLE
C
C          A = R1MACH(I)
C
C     WHERE I=1,...,5.  THE (OUTPUT) VALUE OF A ABOVE IS
C     DETERMINED BY THE (INPUT) VALUE OF I.  THE RESULTS FOR
C     VARIOUS VALUES OF I ARE DISCUSSED BELOW.
C
C  SINGLE-PRECISION MACHINE CONSTANTS
C  R1MACH(1) = B**(EMIN-1), THE SMALLEST POSITIVE MAGNITUDE.
C  R1MACH(2) = B**EMAX*(1 - B**(-T)), THE LARGEST MAGNITUDE.
C  R1MACH(3) = B**(-T), THE SMALLEST RELATIVE SPACING.
C  R1MACH(4) = B**(1-T), THE LARGEST RELATIVE SPACING.
C  R1MACH(5) = LOG10(B)
C ***REFERENCES  FOX, P.A., HALL, A.D., SCHRYER, N.L, *FRAMEWORK FOR
C                 A PORTABLE LIBRARY*, ACM TRANSACTIONS ON MATHE-
C                 MATICAL SOFTWARE, VOL. 4, NO. 2, JUNE 1978,
C                 PP. 177-188.
C ***ROUTINES CALLED  XERROR
C ***END PROLOGUE  R1MACH
C
C     INTEGER SMALL(2)
C     INTEGER LARGE(2)
C     INTEGER RIGHT(2)
C     INTEGER DIVER(2)
C     INTEGER LOG10(2)
C
C     REAL RMACH(5)
C
C     EQUIVALENCE (RMACH(1),SMALL(1))
C     EQUIVALENCE (RMACH(2),LARGE(1))
C     EQUIVALENCE (RMACH(3),RIGHT(1))
C     EQUIVALENCE (RMACH(4),DIVER(1))
C     EQUIVALENCE (RMACH(5),LOG10(1))
C
C     MACHINE CONSTANTS FOR THE BURROUGHS 1700 SYSTEM.
C
C     DATA RMACH(1) / Z400800000 /
C     DATA RMACH(2) / Z5FFFFFFFF /
C     DATA RMACH(3) / Z4E9800000 /
C     DATA RMACH(4) / Z4EA800000 /
C     DATA RMACH(5) / Z500E730E8 /
C
C     MACHINE CONSTANTS FOR THE BURROUGHS 5700/6700/7700 SYSTEMS.
C
C     DATA RMACH(1) / O1771000000000000 /
C     DATA RMACH(2) / O0777777777777777 /
C     DATA RMACH(3) / O1311000000000000 /
C     DATA RMACH(4) / O1301000000000000 /
C     DATA RMACH(5) / O1157163034761675 /
C
C     MACHINE CONSTANTS FOR THE CDC 6000/7000 SERIES.
C
C     DATA RMACH(1) / 00014000000000000000B /
C     DATA RMACH(2) / 37767777777777777777B /
C     DATA RMACH(3) / 16404000000000000000B /
C     DATA RMACH(4) / 16414000000000000000B /
C     DATA RMACH(5) / 17164642023241175720B /
C
C     MACHINE CONSTANTS FOR THE CRAY 1
C
C     DATA RMACH(1) / 200004000000000000000B /
C     DATA RMACH(2) / 577777777777777777777B /
C     DATA RMACH(3) / 377214000000000000000B /
C     DATA RMACH(4) / 377224000000000000000B /
C     DATA RMACH(5) / 377774642023241175720B /
C
C     MACHINE CONSTANTS FOR THE DATA GENERAL ECLIPSE S/200
C
C     NOTE - IT MAY BE APPROPRIATE TO INCLUDE THE FOLLOWING CARD -
C     STATIC RMACH(5)
C
C     DATA SMALL/20K,0/,LARGE/77777K,177777K/
C     DATA RIGHT/35420K,0/,DIVER/36020K,0/
C     DATA LOG10/40423K,42023K/
C
C     MACHINE CONSTANTS FOR THE HARRIS 220
C
C     DATA SMALL(1),SMALL(2) / �20000000, �00000201 /
C     DATA LARGE(1),LARGE(2) / �37777777, �00000177 /
C     DATA RIGHT(1),RIGHT(2) / �20000000, �00000352 /
C     DATA DIVER(1),DIVER(2) / �20000000, �00000353 /
C     DATA LOG10(1),LOG10(2) / �23210115, �00000377 /
C
C     MACHINE CONSTANTS FOR THE HONEYWELL 600/6000 SERIES.
C
C     DATA RMACH(1) / O402400000000 /
C     DATA RMACH(2) / O376777777777 /
C     DATA RMACH(3) / O714400000000 /
C     DATA RMACH(4) / O716400000000 /
C     DATA RMACH(5) / O776464202324 /
C
C     MACHINE CONSTANTS FOR THE HP 2100
C
C     3 WORD DOUBLE PRECISION WITH FTN4
C
C     DATA SMALL(1), SMALL(2) / 40000B,       1 /
C     DATA LARGE(1), LARGE(2) / 77777B, 177776B /
C     DATA RIGHT(1), RIGHT(2) / 40000B,    325B /
C     DATA DIVER(1), DIVER(2) / 40000B,    327B /
C     DATA LOG10(1), LOG10(2) / 46420B,  46777B /
C
C     MACHINE CONSTANTS FOR THE HP 2100
C     4 WORD DOUBLE PRECISION WITH FTN4
C
C     DATA SMALL(1), SMALL(2) / 40000B,       1 /
C     DATA LARGE91), LARGE(2) / 77777B, 177776B /
C     DATA RIGHT(1), RIGHT(2) / 40000B,    325B /
C     DATA DIVER(1), DIVER(2) / 40000B,    327B /
C     DATA LOG10(1), LOG10(2) / 46420B,  46777B /
C
C     MACHINE CONSTANTS FOR THE IBM 360/370 SERIES,
C     THE XEROX SIGMA 5/7/9, THE SEL SYSTEMS 85/86  AND
C     THE PERKIN ELMER (INTERDATA) 7/32.
C
C     DATA RMACH(1) / Z00100000 /
C     DATA RMACH(2) / Z7FFFFFFF /
C     DATA RMACH(3) / Z3B100000 /
C     DATA RMACH(4) / Z3C100000 /
C     DATA RMACH(5) / Z41134413 /
C
C     MACHINE CONSTANTS FOR THE PDP-10 (KA OR KI PROCESSOR).
C
C     DATA RMACH(1) / "000400000000 /
C     DATA RMACH(2) / "377777777777 /
C     DATA RMACH(3) / "146400000000 /
C     DATA RMACH(4) / "147400000000 /
C     DATA RMACH(5) / "177464202324 /
C
C     MACHINE CONSTANTS FOR PDP-11 FORTRAN�S SUPPORTING
C     32-BIT INTEGERS (EXPRESSED IN INTEGER AND OCTAL).
C
C     DATA SMALL(1) /    8388608 /
C     DATA LARGE(1) / 2147483647 /
C     DATA RIGHT(1) /  880803840 /
C     DATA DIVER(1) /  889192448 /
C     DATA LOG10(1) / 1067065499 /
C
C     DATA RMACH(1) / O00040000000 /
C     DATA RMACH(2) / O17777777777 /
C     DATA RMACH(3) / O06440000000 /
C     DATA RMACH(4) / O06500000000 /
C     DATA RMACH(5) / O07746420233 /
C
C     MACHINE CONSTANTS FOR PDP-11 FORTRAN�S SUPPORTING
C     16-BIT INTEGERS  (EXPRESSED IN INTEGER AND OCTAL).
C
C     DATA SMALL(1),SMALL(2) /   128,     0 /
C     DATA LARGE(1),LARGE(2) / 32767,    -1 /
C     DATA RIGHT(1),RIGHT(2) / 13440,     0 /
C     DATA DIVER(1),DIVER(2) / 13568,     0 /
C     DATA LOG10(1),LOG10(2) / 16282,  8347 /
C
C     DATA SMALL(1),SMALL(2) / O000200, O000000 /
C     DATA LARGE(1),LARGE(2) / O077777, O177777 /
C     DATA RIGHT(1),RIGHT(2) / O032200, O000000 /
C     DATA DIVER(1),DIVER(2) / O032400, O000000 /
C     DATA LOG10(1),LOG10(2) / O037632, O020233 /
C
C     MACHINE CONSTANTS FOR THE UNIVAC 1100 SERIES.
C
C     DATA RMACH(1) / O000400000000 /
C     DATA RMACH(2) / O377777777777 /
C     DATA RMACH(3) / O146400000000 /
C     DATA RMACH(4) / O147400000000 /
C     DATA RMACH(5) / O177464202324 /
C
C     MACHINE CONSTANTS FOR THE VAX 11/780
C    (EXPRESSED IN INTEGER AND HEXADECIMAL)
C  ***THE HEX FORMAT BELOW MAY NOT BE SUITABLE FOR UNIX SYSTEMS***
C  *** THE INTEGER FORMAT SHOULD BE OK FOR UNIX SYSTEMS***
C
C     DATA SMALL(1) /       128 /
C     DATA LARGE(1) /    -32769 /
C     DATA RIGHT(1) /     13440 /
C     DATA DIVER(1) /     13568 /
C     DATA LOG10(1) / 547045274 /
C
C     DATA SMALL(1) / Z00000080 /
C     DATA LARGE(1) / ZFFFF7FFF /
C     DATA RIGHT(1) / Z00003480 /
C     DATA DIVER(1) / Z00003500 /
C     DATA LOG10(1) / Z209B3F9A /
C
C ***FIRST EXECUTABLE STATEMENT  R1MACH
C
C     IF (I .LT. 1  .OR.  I .GT. 5) RETURN
C
C     R1MACH = RMACH(I)
C     RETURN
C
C     END
      SUBROUTINE EVF(X,FX)
      DOUBLE PRECISION X,FX

      FX = X**7 + 28.D0*X**4 - 480.D0
      RETURN
      END
      SUBROUTINE EVFDF(X,FX,DFX)
      DOUBLE PRECISION X,FX,DFX

      FX = X**7 + 28.D0*X**4 - 480.D0
      DFX = 7.D0*X**6 + 112.D0*X**3
      RETURN
      END
      SUBROUTINE ZERO1(EVF,A,B,NDEG,PRECIS,DWARF,ZERO,IER)
C-----------------------------------------------------------------------
C
C   PURPOSE              - FIND A ZERO OF A FUNCTION WHICH CHANGES
C                            SIGN IN A GIVEN INTERVAL BY LARKIN'S
C                            METHOD OF RATIONAL INTERPOLATION.
C
C   PRECISION            - DOUBLE.
C
C   ARGUMENTS    EVF     - AN EXTERNAL SUBROUTINE EVF(X,FX) WITH
C                            DOUBLE PRECISION ARBUMENTS X,FX WHICH
C                            COMPUTES F(X) FOR ANY X IN THE INTERVAL
C                            (A,B) INCLUSIVE. (INPUT)
C                            EVF MUST APPEAR IN AN EXTERNAL STATEMENT
C                            IN THE CALLING PROGRAM.
C                A,B     - DOUBLE PRECISION BOUNDARY POINTS.
C                            (INPUT/OUTPUT)
C                          ON INPUT, F(A) AND F(B) SHOULD HAVE OPPOSITE
C                            SIGNS UNLESS ONE EQUALS 0.
C                          ON OUTPUT, BOTH A AND B ARE ALTERED BUT F(A)
C                            AND F(B) REMAIN OPPOSITELY SIGNED UNLESS
C                            ONE EQUALS 0. IF NEITHER F(A) NOR F(B)
C                            EQUALS 0, THEN
C                              ABS(A-B) .LE. 4*PRECIS*ABS(A)+2*DWARF.
C                NDEG    - MAXIMUM TOTAL DEGREE OF RATIONAL INTER-
C                            POLATION. (INPUT)
C                            IF NDEG.LT.2 THEN 2 IS USED IN PLACE OF
C                            NDEG. IF NDEG.GT.11 THEN 11 IS USED IN
C                            PLACE OF NDEG.
C                PRECIS  - REAL RELATIVE CONVERGENCE PARAMETER. (INPUT)
C                            PRECIS SHOULD BE AT LEAST MACHINE PRE-
C                            CISION, I.E. 1+PRECIS.GT.1 IN DOUBLE
C                            PRECISION ARITHMETIC.
C                DWARF   - REAL ABSOLUTE CONVERGENCE PARAMETER. (INPUT)
C                            DWARF SHOULD BE AT LEAST AS LARGE AS THE
C                            SMALLEST POSITIVE NORMALIZED REAL NUMBER
C                            REPRESENTABLE IN THE COMPUTER.
C                ZERO    - DOUBLE PRECISION APPROXIMATE ZERO OF F(X).
C                            (OUTPUT)
C                            ZERO EQUALS WHICHEVER OF OUTPUT A OR B HAS
C                            SMALLER F MAGNITUDE.
C                IER     - ERROR INDICATOR. (OUTPUT)
C                            NO ERROR: IER=0 .
C                            TERMINAL ERROR:
C                              IER=129 INDICATES THAT F HAS THE SAME
C                              SIGN ON INPUT A AND B.
C
C-----------------------------------------------------------------------
C
C                                 SPECIFICATIONS FOR ARGUMENTS.
C
      INTEGER NDEG,IER
      REAL PRECIS,DWARF
      DOUBLE PRECISION A,B,ZERO
C
C                                 SPECIFICATIONS FOR LOCAL VARIABLES.
C
      INTEGER MAXDEG,NN,N,NLAST,I,J
      REAL TOL,C,D,E,D0,D1
      DOUBLE PRECISION X(11),U(11),X0,F0,F1,F2,Z,FZ,H,HLAST,R,S,T
      DATA MAXDEG/11/
C
C     REMARK:  IN THIS SUBROUTINE THE MAXIMUM ALLOWABLE DEGREE OF
C                RATIONAL INTERPOLATION HAS BEEN ARBITRARILY SET AT 11.
C                (SEE DESCRIPTION OF NDEG.) TO INCREASE THE MAXIMUM
C                ALLOWABLE DEGREE TO M:
C                  1. DIMENSION X AND U AT M (RATHER THAN 11),
C                  2. INITIALIZE MAXDEG AT M (RATHER THAN 11),
C                IN THE ABOVE LINES OF CODE.
C
C                                 FIRST EXECUTABLE STATEMENT.
C
      X0 = A
      X(1) = B
      CALL EVF(A,F0)
      CALL EVF(B,F1)
      IF (F0.EQ.0. .OR. F1.EQ.0.) GO TO 120
      IF (F0.GT.0. .AND. F1.GT.0.) GO TO 140
      IF (F0.LT.0. .AND. F1.LT.0.) GO TO 140
      NN = NDEG
      IF (NN.LT.2) NN = 2
      IF (NN.GT.MAXDEG) NN = MAXDEG
      R = X(1) - X0
      E = 0.
      F2 = F0
C
C                                 MAIN LOOP.
C
   10 CONTINUE
      TOL = 2.*PRECIS*DABS(X0) + DWARF
      IF (DABS(R).LE.2.*TOL) GO TO 120
      U(1) = R* (F0/ (F0-F1))
      IF (E.LT.TOL .OR. DABS(F0).GE.DABS(F2)) GO TO 60
C
C                                 INTERPOLATE.
C
      H = U(1)
      HLAST = H
      NLAST = 1
      S = R
      DO 30 I = 2,N
          S = S + U(I) - U(I-1)
          T = X(I) - X0 - S
          IF (T.EQ.0.) GO TO 40
          U(I) = H* (S/T)
          H = H + U(I)
          D1 = DABS(U(I))
          IF (I.EQ.2) GO TO 20
          IF (D1.GE.D0) GO TO 40
          T = H/R
          IF (T.LE.0. .OR. T.GE.1.) GO TO 40
   20     HLAST = H
          NLAST = I
          D0 = D1
   30 CONTINUE
   40 Z = X0 + HLAST
      D0 = DABS(HLAST)
      D1 = DABS(Z-X(1))
      C = E
      E = D
      D = AMIN1(D0,D1)
      IF (D.GE..5*C) GO TO 60
      IF (D.GE.TOL) GO TO 70
      IF (D0.LT.TOL) GO TO 50
      IF (R.LT.0.) TOL = -TOL
      Z = X(1) - TOL
      GO TO 70

   50 IF (R.LT.0.) TOL = -TOL
      Z = X0 + TOL
      GO TO 70
C
C                                 END INTERPOLATE.
C
   60 CONTINUE
C
C                                 BISECT.
C
      H = .5*R
      Z = X0 + H
      NLAST = 1
      D = DABS(H)
      E = D
C
C                                 END BISECT.
C
   70 CONTINUE
C
C                                 EVALUATE AND ORGANIZE.
C
      CALL EVF(Z,FZ)
      IF (FZ.NE.0.) GO TO 80
      X0 = Z
      F0 = FZ
      GO TO 120

   80 N = MIN0(NLAST+1,NN)
      J = N + 1
      DO 90 I = 2,N
          J = J - 1
          X(J) = X(J-1)
          U(J) = U(J-1)
   90 CONTINUE
      IF (FZ.GT.0. .AND. F1.GT.0.) GO TO 100
      IF (FZ.LT.0. .AND. F1.LT.0.) GO TO 100
      X(2) = X0
      F2 = F0
      U(2) = U(2) - R
      GO TO 110

  100 X(1) = X0
      F2 = F1
      F1 = F0
  110 CONTINUE
      X0 = Z
      F0 = FZ
      R = X(1) - X0
C
C                                 END EVALUATE AND ORGANIZE.
C
      GO TO 10
C
C                                 END MAIN LOOP.
C
  120 CONTINUE
C
C                                 RETURN WITHOUT ERROR.
C
      IER = 0
      A = X0
      B = X(1)
      IF (DABS(F1).LT.DABS(F0)) GO TO 130
      ZERO = A
      RETURN

  130 ZERO = B
      RETURN

  140 CONTINUE
C
C                                 RETURN WITH ERROR.
C
      IER = 129
      RETURN
      END
      SUBROUTINE ZERO2(EVFDF,A,B,NDEG,PRECIS,DWARF,ZERO,IER)
C-----------------------------------------------------------------------
C
C   PURPOSE              - FIND A ZERO OF A FUNCTION WHICH CHANGES
C                            SIGN IN A GIVEN INTERVAL BY LARKIN'S
C                            METHOD OF RATIONAL INTERPOLATION.
C
C   PRECISION            - DOUBLE.
C
C   ARGUMENTS    EVFDF   - AN EXTERNAL SUBROUTINE EVFDF(X,FX,DFX)
C                            WITH DOUBLE PRECISION ARGUMENTS
C                            X,FX,DFX WHICH COMPUTES F(X) AND DF(X)
C                            FOR ANY X IN THE INTERVAL (A,B)
C                            INCLUSIVE. (INPUT)
C                            EVFDF MUST APPEAR IN AN EXTERNAL STATE-
C                            MENT IN THE CALLING PROGRAM.
C                A,B     - DOUBLE PRECISION BOUNDARY POINTS.
C                            (INPUT/OUTPUT)
C                          ON INPUT, F(A) AND F(B) SHOULD HAVE OPPOSITE
C                            SIGNS UNLESS ONE EQUALS 0.
C                          ON OUTPUT, BOTH A AND B ARE ALTERED BUT F(A)
C                            AND F(B) REMAIN OPPOSITELY SIGNED UNLESS
C                            ONE EQUALS 0. IF NEITHER F(A) NOR F(B)
C                            EQUALS 0, THEN
C                              ABS(A-B) .LE. 4*PRECIS*ABS(A)+2*DWARF.
C                NDEG    - MAXIMUM TOTAL DEGREE OF RATIONAL INTER-
C                            POLATION. (INPUT)
C                            IF NDEG.LT.2 THEN 2 IS USED IN PLACE OF
C                            NDEG. IF NDEG.GT.11 THEN 11 IS USED IN
C                            PLACE OF NDEG.
C                PRECIS  - REAL RELATIVE CONVERGENCE PARAMETER. (INPUT)
C                            PRECIS SHOULD BE AT LEAST MACHINE PRE-
C                            CISION, I.E. 1+PRECIS.GT.1 IN DOUBLE
C                            PRECISION ARITHMETIC.
C                DWARF   - REAL ABSOLUTE CONVERGENCE PARAMETER. (INPUT)
C                            DWARF SHOULD BE AT LEAST AS LARGE AS THE
C                            SMALLEST POSITIVE NORMALIZED REAL NUMBER
C                            REPRESENTABLE IN THE COMPUTER.
C                ZERO    - DOUBLE PRECISION APPROXIMATE ZERO OF F(X).
C                            (OUTPUT)
C                            ZERO EQUALS WHICHEVER OF OUTPUT A OR B HAS
C                            SMALLER F MAGNITUDE.
C                IER     - ERROR INDICATOR. (OUTPUT)
C                            NO ERROR: IER=0 .
C                            TERMINAL ERROR:
C                              IER=129 INDICATES THAT F HAS THE SAME
C                              SIGN ON INPUT A AND B.
C
C-----------------------------------------------------------------------
C
C                                 SPECIFICATIONS FOR ARGUMENTS.
C
      INTEGER NDEG,IER
      REAL PRECIS,DWARF
      DOUBLE PRECISION A,B,ZERO
C
C                                 SPECIFICATIONS FOR LOCAL VARIABLES.
C
      INTEGER MAXDEG,NN,N,NLAST,I,J,K
      REAL TOL,C,D,E,D0,D1
      DOUBLE PRECISION X(5),U(11),W(3),X0,F0,F1,DF0,DF1,Z,FZ,DFZ,H,
     .                 HLAST,R,S,T,H1,S1,V
      LOGICAL NOT0,NOT1
      DATA MAXDEG/11/
C
C     REMARK:  IN THIS SUBROUTINE THE MAXIMUM ALLOWABLE DEGREE OF
C                RATIONAL INTERPOLATION HAS BEEN ARBITRARILY SET AT 11.
C                (SEE DESCRIPTION OF NDEG.) TO INCREASE THE MAXIMUM
C                ALLOWABLE DEGREE TO M:
C                  1. DIMENSION X AT THE INTEGER PART OF M/2 (RATHER
C                     THAN 5),
C                  2. DIMENSION U AT M (RATHER THAN 11),
C                  3. INITIALIZE MAXDEG AT M (RATHER THAN 11),
C                IN THE ABOVE LINES OF CODE.
C
C                                 FIRST EXECUTABLE STATEMENT.
C
      X0 = A
      X(1) = B
      CALL EVFDF(A,F0,DF0)
      CALL EVFDF(B,F1,DF1)
      IF (F0.EQ.0. .OR. F1.EQ.0.) GO TO 170
      IF (F0.GT.0. .AND. F1.GT.0.) GO TO 190
      IF (F0.LT.0. .AND. F1.LT.0.) GO TO 190
      NN = NDEG
      IF (NN.LT.2) NN = 2
      IF (NN.GT.MAXDEG) NN = MAXDEG
      IF (DABS(F1).GE.DABS(F0)) GO TO 10
      X0 = B
      X(1) = A
      S = F0
      F0 = F1
      F1 = S
      S = DF0
      DF0 = DF1
      DF1 = S
   10 N = 2
      NOT1 = .TRUE.
      R = X(1) - X0
      D = DABS(R)
      E = D
      IF (NN.EQ.2 .OR. DF1* (R/F1).LE.0.) GO TO 20
      N = 3
      NOT1 = .FALSE.
      U(3) = -F1/DF1
      W(1) = U(3)
   20 CONTINUE
C
C                                 MAIN LOOP.
C
   30 CONTINUE
      TOL = 2.*PRECIS*DABS(X0) + DWARF
      IF (DABS(R).LE.2.*TOL) GO TO 170
      V = R/ (F1-F0)
      NOT0 = (V*DF0.LE.0.)
      IF (E.LT.TOL .OR. NOT0) GO TO 90
C
C                                 INTERPOLATE.
C
      U(1) = -F0/DF0
      H = U(1)
      V = -F0*V
      S = V - U(1)
      U(2) = H* (S/ (R-S))
      H = H + U(2)
      HLAST = H
      NLAST = 2
      IF (N.EQ.2) GO TO 70
      S1 = R
      H1 = V
      W(1) = U(3)
      DO 60 I = 3,N
          J = I/2
          S1 = S1 + U(I) - V
          T = X(J) - X0 - S1
          IF (T.EQ.0.) GO TO 70
          V = H1* (S1/T)
          H1 = H1 + V
          IF (I.EQ.3) W(2) = V - S1
          S = S + V - U(I-1)
          T = X(J) - X0 - S
          IF (T.EQ.0.) GO TO 70
          U(I) = H* (S/T)
          H = H + U(I)
          D1 = DABS(U(I))
          IF (I.EQ.3) GO TO 40
          IF (D1.GE.D0) GO TO 70
          T = H/R
          IF (T.LE.0. .OR. T.GE.1.) GO TO 70
          GO TO 50

   40     W(3) = U(3) - S
   50     HLAST = H
          NLAST = I
          D0 = D1
   60 CONTINUE
   70 Z = X0 + HLAST
      D0 = DABS(HLAST)
      D1 = DABS(Z-X(1))
      C = E
      E = D
      D = AMIN1(D0,D1)
      IF (D.GE..5*C) GO TO 90
      IF (D.GE.TOL) GO TO 100
      IF (D0.LT.TOL) GO TO 80
      IF (R.LT.0.) TOL = -TOL
      Z = X(1) - TOL
      GO TO 100

   80 IF (R.LT.0.) TOL = -TOL
      Z = X0 + TOL
      GO TO 100
C
C                                 END INTERPOLATE.
C
   90 CONTINUE
C
C                                 BISECT.
C
      H = .5*R
      Z = X0 + H
      NLAST = 1
      D = DABS(H)
      E = D
C
C                                 END BISECT.
C
  100 CONTINUE
C
C                                 EVALUATE AND ORGANIZE.
C
      CALL EVFDF(Z,FZ,DFZ)
      IF (FZ.NE.0.) GO TO 110
      X0 = Z
      F0 = FZ
      GO TO 170

  110 N = MIN0(NLAST+2,NN)
      IF (N.EQ.2) GO TO 140
      J = N + 1
      DO 120 I = 3,N
          J = J - 1
          U(J) = U(J-2)
  120 CONTINUE
      IF (N.LT.4) GO TO 140
      K = N/2
      J = K + 1
      DO 130 I = 2,K
          J = J - 1
          X(J) = X(J-1)
  130 CONTINUE
  140 IF (FZ.GT.0. .AND. F1.GT.0.) GO TO 150
      IF (FZ.LT.0. .AND. F1.LT.0.) GO TO 150
      X(2) = X0
      U(3) = W(1)
      U(4) = W(2)
      U(5) = W(3)
      GO TO 160

  150 X(1) = X0
      F1 = F0
      NOT1 = NOT0
  160 CONTINUE
      X0 = Z
      F0 = FZ
      DF0 = DFZ
      R = X(1) - X0
      IF (NOT1) N = 2
C
C                                 END EVALUATE AND ORGANIZE.
C
      GO TO 30
C
C                                 END MAIN LOOP.
C
  170 CONTINUE
C
C                                 RETURN WITHOUT ERROR.
C
      IER = 0
      A = X0
      B = X(1)
      IF (DABS(F1).LT.DABS(F0)) GO TO 180
      ZERO = A
      RETURN

  180 ZERO = B
      RETURN

  190 CONTINUE
C
C                                 RETURN WITH ERROR.
C
      IER = 129
      RETURN
      END
0DRIVER ... APPLICATION OF ZERO1 AND ZERO2 TO THE EQUATION
                  X**7 + 28*X**4 - 480 = 0
             WITH BRACKETS  A = 1, B = 2,
             AND TOLERANCES  PRECIS = 7.1E-15 DWARF = 3.1-294

0OUTPUT FROM ZERO1
   ZERO =  1.922884153250999   A =  1.922884153251026   B =  1.922884153250999
0OUTPUT FROM ZERO2
   ZERO =  1.922884153250999   A =  1.922884153251026   B =  1.922884153250999
