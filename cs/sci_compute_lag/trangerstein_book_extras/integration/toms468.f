C      ALGORITHM 468, COLLECTED ALGORITHMS FROM ACM.
C      THIS WORK PUBLISHED IN COMMUNICATIONS OF THE ACM
C      VOL. 16, NO. 11, November, 1973, PP.694--699.
#! /bin/sh
# This is a shell archive, meaning:
# 1. Remove everything above the #! /bin/sh line.
# 2. Save the resulting text in a file.
# 3. Execute the file with /bin/sh (not csh) to create the files:
#	Fortran/
#	Fortran/Sp/
#	Fortran/Sp/Drivers/
#	Fortran/Sp/Drivers/Makefile
#	Fortran/Sp/Drivers/driver.f
#	Fortran/Sp/Drivers/res
#	Fortran/Sp/Src/
#	Fortran/Sp/Src/src.f
# This archive created: Thu Dec 15 15:51:01 2005
export PATH; PATH=/bin:$PATH
if test ! -d 'Fortran'
then
	mkdir 'Fortran'
fi
cd 'Fortran'
if test ! -d 'Sp'
then
	mkdir 'Sp'
fi
cd 'Sp'
if test ! -d 'Drivers'
then
	mkdir 'Drivers'
fi
cd 'Drivers'
if test -f 'Makefile'
then
	echo shar: will not over-write existing file "'Makefile'"
else
cat << "SHAR_EOF" > 'Makefile'
all: Res

src.o: src.f
	$(F77) $(F77OPTS) -c src.f

driver.o: driver.f
	$(F77) $(F77OPTS) -c driver.f

DRIVERS= driver
RESULTS= Res

Objs1= driver.o src.o
driver: $(Objs1)
	$(F77) $(F77OPTS) -o driver $(Objs1) $(SRCLIBS)
Res: driver 
	./driver >Res

diffres:Res res
	echo "Differences in results from driver"
	$(DIFF) Res res

clean: 
	rm -rf *.o $(DRIVERS) $(CLEANUP) $(RESULTS)
SHAR_EOF
fi # end of overwriting check
if test -f 'driver.f'
then
	echo shar: will not over-write existing file "'driver.f'"
else
cat << "SHAR_EOF" > 'driver.f'
      program main

c***********************************************************************
c
cc TOMS468_PRB tests TOMS468.
c
      implicit none

      write ( *, '(a)' ) ' '
      write ( *, '(a)' ) 'TOMS468_PRB'
      write ( *, '(a)' ) '  Test TOMS algorithm 468, automatic'
      write ( *, '(a)' ) '  numerical integration.'
      write ( *, '(a)' ) ' '

      call test01
      call test02
      call test03

      write ( *, '(a)' ) ' '
      write ( *, '(a)' ) 'TOMS468_PRB'
      write ( *, '(a)' ) '  Normal end of execution.'

      stop
      end
      subroutine test01

c***********************************************************************
c
cc TEST01 tests QUAD.
c
      implicit none

      real a
      real b
      real epsil
      real exact
      real f01,f02,f03,f04,f05,f06,f07,f08,f09,f10,f11,f12,f13
      external f01
      external f02
      external f03
      external f04
      external f05
      external f06
      external f07
      external f08
      external f09
      external f10
      external f11
      external f12
      external f13
      integer icheck
      integer k
      integer npts
      real result(8)

      epsil = 0.001

      write ( *, '(a)' ) ' '
      write ( *, '(a)' ) 'TEST01'
      write ( *, '(a)' ) '  Test QUAD, for simple quadrature.'
      write ( *, '(a)' ) ' '
      write ( *, '(a,g14.6)' ) '  Error tolerance EPSIL = ', epsil
      write ( *, '(a)' ) ' '

      write ( *, '(a,a)' ) 
     &  '      A         B   ICHECK K     NFUNC     ',
     &  'RESULT(K)        EXACT'
      write ( *, '(a)' ) ' '

      a = 0.0E+00
      b = 1.0E+00

      call quad ( a, b, result, k, epsil, npts, icheck, f01 )

      exact = 2.0E+00 / 3.0E+00

      write ( *, 
     &  '(2x,f8.4,2x,f8.4,2x,i2,2x,i2,2x,i8,2x,g14.6,2x,g14.6)' ) 
     &  a, b, icheck, k, npts, result(k), exact

      a = -1.0E+00
      b =  1.0E+00

      call quad ( a, b, result, k, epsil, npts, icheck, f02 )

      exact = 0.4794282267E+00

      write ( *, 
     &  '(2x,f8.4,2x,f8.4,2x,i2,2x,i2,2x,i8,2x,g14.6,2x,g14.6)' ) 
     &  a, b, icheck, k, npts, result(k), exact

      a = -1.0E+00
      b =  1.0E+00

      call quad ( a, b, result, k, epsil, npts, icheck, f03 )

      exact = 1.582232964E+00

      write ( *, 
     &  '(2x,f8.4,2x,f8.4,2x,i2,2x,i2,2x,i8,2x,g14.6,2x,g14.6)' ) 
     &  a, b, icheck, k, npts, result(k), exact

      a = 0.0E+00
      b = 1.0E+00

      call quad ( a, b, result, k, epsil, npts, icheck, f04 )

      exact = 2.0E+00 / 5.0E+00

      write ( *, 
     &  '(2x,f8.4,2x,f8.4,2x,i2,2x,i2,2x,i8,2x,g14.6,2x,g14.6)' ) 
     &  a, b, icheck, k, npts, result(k), exact

      a = 0.0E+00
      b = 1.0E+00

      call quad ( a, b, result, k, epsil, npts, icheck, f05 )

      exact = 0.8669729873E+00

      write ( *, 
     &  '(2x,f8.4,2x,f8.4,2x,i2,2x,i2,2x,i8,2x,g14.6,2x,g14.6)' ) 
     &  a, b, icheck, k, npts, result(k), exact

      a = 0.0E+00
      b = 1.0E+00

      call quad ( a, b, result, k, epsil, npts, icheck, f06 )

      exact = 1.154700669E+00

      write ( *, 
     &  '(2x,f8.4,2x,f8.4,2x,i2,2x,i2,2x,i8,2x,g14.6,2x,g14.6)' ) 
     &  a, b, icheck, k, npts, result(k), exact

      a = 0.0E+00
      b = 1.0E+00

      call quad ( a, b, result, k, epsil, npts, icheck, f07 )

      exact = 0.7775046341E+00

      write ( *, 
     &  '(2x,f8.4,2x,f8.4,2x,i2,2x,i2,2x,i8,2x,g14.6,2x,g14.6)' ) 
     &  a, b, icheck, k, npts, result(k), exact

      a = 0.1E+00
      b = 1.0E+00

      call quad ( a, b, result, k, epsil, npts, icheck, f08 )

      exact = 0.009098645256E+00

      write ( *, 
     &  '(2x,f8.4,2x,f8.4,2x,i2,2x,i2,2x,i8,2x,g14.6,2x,g14.6)' ) 
     &  a, b, icheck, k, npts, result(k), exact

      a =  0.0E+00
      b = 10.0E+00

      call quad ( a, b, result, k, epsil, npts, icheck, f09 )

      exact = 0.4993638029E+00

      write ( *, 
     &  '(2x,f8.4,2x,f8.4,2x,i2,2x,i2,2x,i8,2x,g14.6,2x,g14.6)' ) 
     &  a, b, icheck, k, npts, result(k), exact

      a = 0.0E+00
      b = 3.1415927E+00

      call quad ( a, b, result, k, epsil, npts, icheck, f10 )

      exact = 0.8386763234E+00

      write ( *, 
     &  '(2x,f8.4,2x,f8.4,2x,i2,2x,i2,2x,i8,2x,g14.6,2x,g14.6)' ) 
     &  a, b, icheck, k, npts, result(k), exact

      a = 0.0E+00
      b = 1.0E+00

      call quad ( a, b, result, k, epsil, npts, icheck, f11 )

      exact = -1.0E+00

      write ( *, 
     &  '(2x,f8.4,2x,f8.4,2x,i2,2x,i2,2x,i8,2x,g14.6,2x,g14.6)' ) 
     &  a, b, icheck, k, npts, result(k), exact

      a = 0.0E+00
      b = 1.0E+00

      call quad ( a, b, result, k, epsil, npts, icheck, f12 )

      exact = -0.6346651825E+00

      write ( *, 
     &  '(2x,f8.4,2x,f8.4,2x,i2,2x,i2,2x,i8,2x,g14.6,2x,g14.6)' ) 
     &  a, b, icheck, k, npts, result(k), exact

      a = 0.0E+00
      b = 1.0E+00

      call quad ( a, b, result, k, epsil, npts, icheck, f13 )
c
c  The reference lists an exact value of 0.0013492485650E+00 but this is
c  apparently a typo.
c
      exact = 0.013492485650E+00

      write ( *, 
     &  '(2x,f8.4,2x,f8.4,2x,i2,2x,i2,2x,i8,2x,g14.6,2x,g14.6)' ) 
     &  a, b, icheck, k, npts, result(k), exact

      return
      end
      subroutine test02

c***********************************************************************
c
cc TEST02 tests QSUB.
c
      implicit none

      real a
      real b
      real epsil
      real exact
      real f01,f02,f03,f04,f05,f06,f07,f08,f09,f10,f11,f12,f13
      external f01
      external f02
      external f03
      external f04
      external f05
      external f06
      external f07
      external f08
      external f09
      external f10
      external f11
      external f12
      external f13
      integer icheck
      integer npts
      real qsub
      real relerr
      real result

      epsil = 0.001

      write ( *, '(a)' ) ' '
      write ( *, '(a)' ) 'TEST02'
      write ( *, '(a)' ) '  Test QSUB, for quadrature with subdivision.'
      write ( *, '(a)' ) ' '
      write ( *, '(a,g14.6)' ) '  Error tolerance EPSIL = ', epsil
      write ( *, '(a)' ) ' '

      write ( *, '(a,a)' ) 
     &  '      A         B   ICHECK   NFUNC     ',
     &  '   RESULT        EXACT          RELERR'
      write ( *, '(a)' ) ' '

      a = 0.0E+00
      b = 1.0E+00

      result = qsub ( a, b, epsil, npts, icheck, relerr, f01 )

      exact = 2.0E+00 / 3.0E+00

      write ( *, 
     &  '(2x,f8.4,2x,f8.4,2x,i2,2x,i8,2x,g14.6,2x,g14.6,2x,g12.4)' ) 
     &  a, b, icheck, npts, result, exact, relerr

      a = -1.0E+00
      b =  1.0E+00

      result = qsub ( a, b, epsil, npts, icheck, relerr, f02 )

      exact = 0.4794282267E+00

      write ( *, 
     &  '(2x,f8.4,2x,f8.4,2x,i2,2x,i8,2x,g14.6,2x,g14.6,2x,g12.4)' ) 
     &  a, b, icheck, npts, result, exact, relerr

      a = -1.0E+00
      b =  1.0E+00

      result = qsub ( a, b, epsil, npts, icheck, relerr, f03 )

      exact = 1.582232964E+00

      write ( *, 
     &  '(2x,f8.4,2x,f8.4,2x,i2,2x,i8,2x,g14.6,2x,g14.6,2x,g12.4)' ) 
     &  a, b, icheck, npts, result, exact, relerr

      a = 0.0E+00
      b = 1.0E+00

      result = qsub ( a, b, epsil, npts, icheck, relerr, f04 )

      exact = 2.0E+00 / 5.0E+00

      write ( *, 
     &  '(2x,f8.4,2x,f8.4,2x,i2,2x,i8,2x,g14.6,2x,g14.6,2x,g12.4)' ) 
     &  a, b, icheck, npts, result, exact, relerr

      a = 0.0E+00
      b = 1.0E+00

      result = qsub ( a, b, epsil, npts, icheck, relerr, f05 )

      exact = 0.8669729873E+00

      write ( *, 
     &  '(2x,f8.4,2x,f8.4,2x,i2,2x,i8,2x,g14.6,2x,g14.6,2x,g12.4)' ) 
     &  a, b, icheck, npts, result, exact, relerr

      a = 0.0E+00
      b = 1.0E+00

      result = qsub ( a, b, epsil, npts, icheck, relerr, f06 )

      exact = 1.154700669E+00

      write ( *, 
     &  '(2x,f8.4,2x,f8.4,2x,i2,2x,i8,2x,g14.6,2x,g14.6,2x,g12.4)' ) 
     &  a, b, icheck, npts, result, exact, relerr

      a = 0.0E+00
      b = 1.0E+00

      result = qsub ( a, b, epsil, npts, icheck, relerr, f07 )

      exact = 0.7775046341E+00

      write ( *, 
     &  '(2x,f8.4,2x,f8.4,2x,i2,2x,i8,2x,g14.6,2x,g14.6,2x,g12.4)' ) 
     &  a, b, icheck, npts, result, exact, relerr

      a = 0.1E+00
      b = 1.0E+00

      result = qsub ( a, b, epsil, npts, icheck, relerr, f08 )

      exact = 0.009098645256E+00

      write ( *, 
     &  '(2x,f8.4,2x,f8.4,2x,i2,2x,i8,2x,g14.6,2x,g14.6,2x,g12.4)' ) 
     &  a, b, icheck, npts, result, exact, relerr

      a =  0.0E+00
      b = 10.0E+00

      result = qsub ( a, b, epsil, npts, icheck, relerr, f09 )

      exact = 0.4993638029E+00

      write ( *, 
     &  '(2x,f8.4,2x,f8.4,2x,i2,2x,i8,2x,g14.6,2x,g14.6,2x,g12.4)' ) 
     &  a, b, icheck, npts, result, exact, relerr

      a = 0.0E+00
      b = 3.1415927E+00

      result = qsub ( a, b, epsil, npts, icheck, relerr, f10 )

      exact = 0.8386763234E+00

      write ( *, 
     &  '(2x,f8.4,2x,f8.4,2x,i2,2x,i8,2x,g14.6,2x,g14.6,2x,g12.4)' ) 
     &  a, b, icheck, npts, result, exact, relerr

      a = 0.0E+00
      b = 1.0E+00

      result = qsub ( a, b, epsil, npts, icheck, relerr, f11 )

      exact = -1.0E+00

      write ( *, 
     &  '(2x,f8.4,2x,f8.4,2x,i2,2x,i8,2x,g14.6,2x,g14.6,2x,g12.4)' ) 
     &  a, b, icheck, npts, result, exact, relerr

      a = 0.0E+00
      b = 1.0E+00

      result = qsub ( a, b, epsil, npts, icheck, relerr, f12 )

      exact = -0.6346651825E+00

      write ( *, 
     &  '(2x,f8.4,2x,f8.4,2x,i2,2x,i8,2x,g14.6,2x,g14.6,2x,g12.4)' ) 
     &  a, b, icheck, npts, result, exact, relerr

      a = 0.0E+00
      b = 1.0E+00

      result = qsub ( a, b, epsil, npts, icheck, relerr, f13 )
c
c  The reference lists an exact value of 0.0013492485650E+00 but this is
c  apparently a typo.
c
      exact = 0.013492485650E+00

      write ( *, 
     &  '(2x,f8.4,2x,f8.4,2x,i2,2x,i8,2x,g14.6,2x,g14.6,2x,g12.4)' ) 
     &  a, b, icheck, npts, result, exact, relerr

      return
      end
      subroutine test03

c***********************************************************************
c
cc TEST03 tests QSUBA.
c
      implicit none

      real a
      real b
      real epsil
      real exact
      real f01,f02,f03,f04,f05,f06,f07,f08,f09,f10,f11,f12,f13
      external f01
      external f02
      external f03
      external f04
      external f05
      external f06
      external f07
      external f08
      external f09
      external f10
      external f11
      external f12
      external f13
      integer icheck
      integer npts
      real qsuba
      real relerr
      real result

      epsil = 0.001

      write ( *, '(a)' ) ' '
      write ( *, '(a)' ) 'TEST03'
      write ( *, '(a)' ) '  Test QSUBA,'
      write ( *, '(a)' ) '  for adaptive quadrature with subdivision.'
      write ( *, '(a)' ) ' '
      write ( *, '(a,g14.6)' ) '  Error tolerance EPSIL = ', epsil
      write ( *, '(a)' ) ' '

      write ( *, '(a,a)' ) 
     &  '      A         B   ICHECK   NFUNC     ',
     &  '   RESULT        EXACT          RELERR'
      write ( *, '(a)' ) ' '

      a = 0.0E+00
      b = 1.0E+00

      result = qsuba ( a, b, epsil, npts, icheck, relerr, f01 )

      exact = 2.0E+00 / 3.0E+00

      write ( *, 
     &  '(2x,f8.4,2x,f8.4,2x,i2,2x,i8,2x,g14.6,2x,g14.6,2x,g12.4)' ) 
     &  a, b, icheck, npts, result, exact, relerr

      a = -1.0E+00
      b =  1.0E+00

      result = qsuba ( a, b, epsil, npts, icheck, relerr, f02 )

      exact = 0.4794282267E+00

      write ( *, 
     &  '(2x,f8.4,2x,f8.4,2x,i2,2x,i8,2x,g14.6,2x,g14.6,2x,g12.4)' ) 
     &  a, b, icheck, npts, result, exact, relerr

      a = -1.0E+00
      b =  1.0E+00

      result = qsuba ( a, b, epsil, npts, icheck, relerr, f03 )

      exact = 1.582232964E+00

      write ( *, 
     &  '(2x,f8.4,2x,f8.4,2x,i2,2x,i8,2x,g14.6,2x,g14.6,2x,g12.4)' ) 
     &  a, b, icheck, npts, result, exact, relerr

      a = 0.0E+00
      b = 1.0E+00

      result = qsuba ( a, b, epsil, npts, icheck, relerr, f04 )

      exact = 2.0E+00 / 5.0E+00

      write ( *, 
     &  '(2x,f8.4,2x,f8.4,2x,i2,2x,i8,2x,g14.6,2x,g14.6,2x,g12.4)' ) 
     &  a, b, icheck, npts, result, exact, relerr

      a = 0.0E+00
      b = 1.0E+00

      result = qsuba ( a, b, epsil, npts, icheck, relerr, f05 )

      exact = 0.8669729873E+00

      write ( *, 
     &  '(2x,f8.4,2x,f8.4,2x,i2,2x,i8,2x,g14.6,2x,g14.6,2x,g12.4)' ) 
     &  a, b, icheck, npts, result, exact, relerr

      a = 0.0E+00
      b = 1.0E+00

      result = qsuba ( a, b, epsil, npts, icheck, relerr, f06 )

      exact = 1.154700669E+00

      write ( *, 
     &  '(2x,f8.4,2x,f8.4,2x,i2,2x,i8,2x,g14.6,2x,g14.6,2x,g12.4)' ) 
     &  a, b, icheck, npts, result, exact, relerr

      a = 0.0E+00
      b = 1.0E+00

      result = qsuba ( a, b, epsil, npts, icheck, relerr, f07 )

      exact = 0.7775046341E+00

      write ( *, 
     &  '(2x,f8.4,2x,f8.4,2x,i2,2x,i8,2x,g14.6,2x,g14.6,2x,g12.4)' ) 
     &  a, b, icheck, npts, result, exact, relerr

      a = 0.1E+00
      b = 1.0E+00

      result = qsuba ( a, b, epsil, npts, icheck, relerr, f08 )

      exact = 0.009098645256E+00

      write ( *, 
     &  '(2x,f8.4,2x,f8.4,2x,i2,2x,i8,2x,g14.6,2x,g14.6,2x,g12.4)' ) 
     &  a, b, icheck, npts, result, exact, relerr

      a =  0.0E+00
      b = 10.0E+00

      result = qsuba ( a, b, epsil, npts, icheck, relerr, f09 )

      exact = 0.4993638029E+00

      write ( *, 
     &  '(2x,f8.4,2x,f8.4,2x,i2,2x,i8,2x,g14.6,2x,g14.6,2x,g12.4)' ) 
     &  a, b, icheck, npts, result, exact, relerr

      a = 0.0E+00
      b = 3.1415927E+00

      result = qsuba ( a, b, epsil, npts, icheck, relerr, f10 )

      exact = 0.8386763234E+00

      write ( *, 
     &  '(2x,f8.4,2x,f8.4,2x,i2,2x,i8,2x,g14.6,2x,g14.6,2x,g12.4)' ) 
     &  a, b, icheck, npts, result, exact, relerr

      a = 0.0E+00
      b = 1.0E+00

      result = qsuba ( a, b, epsil, npts, icheck, relerr, f11 )

      exact = -1.0E+00

      write ( *, 
     &  '(2x,f8.4,2x,f8.4,2x,i2,2x,i8,2x,g14.6,2x,g14.6,2x,g12.4)' ) 
     &  a, b, icheck, npts, result, exact, relerr

      a = 0.0E+00
      b = 1.0E+00

      result = qsuba ( a, b, epsil, npts, icheck, relerr, f12 )

      exact = -0.6346651825E+00

      write ( *, 
     &  '(2x,f8.4,2x,f8.4,2x,i2,2x,i8,2x,g14.6,2x,g14.6,2x,g12.4)' ) 
     &  a, b, icheck, npts, result, exact, relerr

      a = 0.0E+00
      b = 1.0E+00

      result = qsuba ( a, b, epsil, npts, icheck, relerr, f13 )
c
c  The reference lists an exact value of 0.0013492485650E+00 but this is
c  apparently a typo.
c
      exact = 0.013492485650E+00

      write ( *, 
     &  '(2x,f8.4,2x,f8.4,2x,i2,2x,i8,2x,g14.6,2x,g14.6,2x,g12.4)' ) 
     &  a, b, icheck, npts, result, exact, relerr

      return
      end
      function f01 ( x )

c***********************************************************************
c
cc F01 evaluates test function 1.
c
      implicit none

      real f01
      real x

      f01 = sqrt ( x )

      return
      end
      function f02 ( x )

c***********************************************************************
c
cc F02 evaluates test function 2.
c
      implicit none

      real f02
      real x

      f02 = 0.92E+00 * cosh ( x ) - cos ( x )

      return
      end
      function f03 ( x )

c***********************************************************************
c
cc F03 evaluates test function 3.
c
      implicit none

      real f03
      real x

      f03 = 1.0 / ( x**4 + x**2 + 0.9 )

      return
      end
      function f04 ( x )

c***********************************************************************
c
cc F04 evaluates test function 4.
c
      implicit none

      real f04
      real x

      f04 = sqrt ( x**3 )

      return
      end
      function f05 ( x )

c***********************************************************************
c
cc F05 evaluates test function 5.
c
      implicit none

      real f05
      real x

      f05 = 1.0E+00 / ( 1.0E+00 + x**4 )

      return
      end
      function f06 ( x )

c***********************************************************************
c
cc F06 evaluates test function 6.
c
      implicit none

      real f06
      real x

      f06 = 1.0E+00 / ( 1.0E+00 + 0.5E+00 * sin ( 31.4159E+00 * x ) )

      return
      end
      function f07 ( x )

c***********************************************************************
c
cc F07 evaluates test function 7.
c
      implicit none

      real f07
      real x

      f07 = x / ( exp ( x ) - 1.0E+00 )

      return
      end
      function f08 ( x )

c***********************************************************************
c
cc F08 evaluates test function 8.
c
      implicit none

      real f08
      real x

      f08 = sin ( 314.159E+00 * x ) / ( 3.14159E+00 * x )

      return
      end
      function f09 ( x )

c***********************************************************************
c
cc F09 evaluates test function 9.
c
      implicit none

      real f09
      real x

      f09 = 50.0E+00 / ( 2500.0E+00 * x**2 + 1.0E+00 ) / 3.14159E+00

      return
      end
      function f10 ( x )

c***********************************************************************
c
cc F10 evaluates test function 10.
c
      implicit none

      real arg
      real f10
      real x

      arg =         cos (           x ) 
     &  + 3.0E+00 * sin (           x ) 
     &  + 2.0E+00 * cos ( 2.0E+00 * x )
     &  + 3.0E+00 * cos ( 3.0E+00 * x ) 
     &  + 3.0E+00 * sin ( 2.0E+00 * x )

      f10 = cos ( arg )

      return
      end
      function f11 ( x )

c***********************************************************************
c
cc F11 evaluates test function 11.
c
      implicit none

      real f11
      real x

      f11 = log ( x )

      return
      end
      function f12 ( x )

c***********************************************************************
c
cc F12 evaluates test function 12.
c
      implicit none

      real f12
      real pi
      real x

      pi = 3.141592653589793E+00

      f12 = 4.0E+00 * pi**2 * x * sin ( 20.0E+00 * pi * x ) 
     &  * cos ( 2.0E+00 * pi * x )

      return
      end
      function f13 ( x )

c***********************************************************************
c
cc F13 evaluates test function 13.
c
      implicit none

      real f13
      real x

      f13 = 1.0E+00 / ( 1.0E+00 + ( 230.0E+00 * x - 30.0E+00 )**2 )

      return
      end
SHAR_EOF
fi # end of overwriting check
if test -f 'res'
then
	echo shar: will not over-write existing file "'res'"
else
cat << "SHAR_EOF" > 'res'
 
TOMS468_PRB
  Test TOMS algorithm 468, automatic
  numerical integration.
 
 
TEST01
  Test QUAD, for simple quadrature.
 
  Error tolerance EPSIL =   0.100000E-02
 
      A         B   ICHECK K     NFUNC     RESULT(K)        EXACT
 
    0.0000    1.0000   0   4        15    0.666674        0.666667    
   -1.0000    1.0000   0   3         7    0.479428        0.479428    
   -1.0000    1.0000   0   4        15     1.58223         1.58223    
    0.0000    1.0000   0   3         7    0.399999        0.400000    
    0.0000    1.0000   0   3         7    0.866973        0.866973    
    0.0000    1.0000   0   7       127     1.15470         1.15470    
    0.0000    1.0000   0   3         7    0.777505        0.777505    
    0.1000    1.0000   0   8       255    0.909898E-02    0.909865E-02
    0.0000   10.0000   0   7       127    0.499365        0.499364    
    0.0000    3.1416   0   6        63    0.838674        0.838676    
    0.0000    1.0000   0   5        31   -0.999844        -1.00000    
    0.0000    1.0000   0   6        63   -0.634670       -0.634665    
    0.0000    1.0000   1   8       255    0.135495E-01    0.134925E-01
 
TEST02
  Test QSUB, for quadrature with subdivision.
 
  Error tolerance EPSIL =   0.100000E-02
 
      A         B   ICHECK   NFUNC        RESULT        EXACT          RELERR
 
    0.0000    1.0000   0        15    0.666674        0.666667        0.2026E-03
   -1.0000    1.0000   0         7    0.479428        0.479428        0.2540E-03
   -1.0000    1.0000   0        15     1.58223         1.58223        0.5010E-04
    0.0000    1.0000   0         7    0.399999        0.400000        0.4663E-03
    0.0000    1.0000   0         7    0.866973        0.866973        0.6296E-03
    0.0000    1.0000   0       127     1.15470         1.15470        0.1518E-04
    0.0000    1.0000   0         7    0.777505        0.777505        0.1533E-06
    0.1000    1.0000   0       255    0.909898E-02    0.909865E-02    0.5220E-05
    0.0000   10.0000   0       127    0.499365        0.499364        0.2829E-04
    0.0000    3.1416   0        63    0.838674        0.838676        0.3340E-05
    0.0000    1.0000   0        31   -0.999844        -1.00000        0.9854E-03
    0.0000    1.0000   0        63   -0.634670       -0.634665        0.1850E-04
    0.0000    1.0000   1       794    0.134925E-01    0.134925E-01    0.9841E-08
 
TEST03
  Test QSUBA,
  for adaptive quadrature with subdivision.
 
  Error tolerance EPSIL =   0.100000E-02
 
      A         B   ICHECK   NFUNC        RESULT        EXACT          RELERR
 
    0.0000    1.0000   0        15    0.666674        0.666667        0.2026E-03
   -1.0000    1.0000   0         7    0.479428        0.479428        0.2540E-03
   -1.0000    1.0000   0        15     1.58223         1.58223        0.5010E-04
    0.0000    1.0000   0         7    0.399999        0.400000        0.4663E-03
    0.0000    1.0000   0         7    0.866973        0.866973        0.6296E-03
    0.0000    1.0000   0       127     1.15470         1.15470        0.1518E-04
    0.0000    1.0000   0         7    0.777505        0.777505        0.1533E-06
    0.1000    1.0000   0       255    0.909898E-02    0.909865E-02    0.5220E-05
    0.0000   10.0000   0       127    0.499365        0.499364        0.2829E-04
    0.0000    3.1416   0        63    0.838674        0.838676        0.3340E-05
    0.0000    1.0000   0        31   -0.999844        -1.00000        0.9854E-03
    0.0000    1.0000   0        63   -0.634670       -0.634665        0.1850E-04
    0.0000    1.0000   1       787    0.134925E-01    0.134925E-01    0.8364E-03
 
TOMS468_PRB
  Normal end of execution.
SHAR_EOF
fi # end of overwriting check
cd ..
if test ! -d 'Src'
then
	mkdir 'Src'
fi
cd 'Src'
if test -f 'src.f'
then
	echo shar: will not over-write existing file "'src.f'"
else
cat << "SHAR_EOF" > 'src.f'
      SUBROUTINE QUAD ( A, B, RESULT, K, EPSIL, NPTS, ICHECK, F )
C  THIS SUBROUTINE ATTEMPTS TO CALCULATE THE INTEGRAL OF F(X)
C  OVER THE INVERVAL *A* TO *B* WITH RELATIVE ERROR NOT
C  EXCEEDING *EPSIL*.
C  THE RESULT IS OBTAINED USING A SEQUENCE OF 1, 3, 7, 15, 31, 63,
C  127, AND 255 POINT INTERLACING FORMULAE (NO INTEGRAND
C  EVALUATIONS ARE WASTED) OF RESPECTIVE DEGREES 1, 5, 11, 23,
C  47, 95, 191 AND 383.  THE FORMULAE ARE BASED ON THE OPTIMAL
C  EXTENSIONS OF THE 3-POINT GAUSS FORMULA.  DETAILS OF
C  THE FORMULAE ARE GIVEN IN 'THE OPTIMUM ADDITION OF POINTS
C  TO QUADRATURE FORMULAE' BY T.N.L. PATTERSON, MATHS. COMP.
C  VOL 22, 847-856, 1968.
C                     *** INPUT ***
C  A      LOWER LIMIT OF INTEGRATION.
C  B      UPPER LIMIT OF INTEGRATION.
C  EPSIL  RELATIVE ACCURACY REQUIRED.  WHEN THE RELATIVE
C         DIFFERENCE OF TWO SUCCESSIVE FORMULAE DOES NOT
C         EXCEED *EPSIL* THE LAST FORMULA COMPUTED IS TAKEN
C         AS THE RESULT.
C  F      F(X) IS THE INTEGRAND.
C                      *** OUTPUT ***
C  RESULT THIS ARRAY, WHICH SHOULD BE DECLARED TO HAVE AT
C         LEAST 8 ELEMENTS, HOLDS THE RESULTS OBTAINED BY
C         THE 1, 3, 7, ETC. POINT FORMULAE.  THE NUMBER OF
C         FORMULAE COMPUTED DEPENDS ON *EPSIL*.
C  K      RESULT(K) HOLDS THE VALUE OF THE INTEGRAL TO THE
C         SPECIFIED RELATIVE ACCURACY.
C  NPTS   NUMBER INTEGRAND EVALUATIONS.
C  ICHECK ON EXIT NORMALLY ICHECK = 0.  HOWEVER, IF CONVERGENCE
C         TO THE ACCURACY REQUESTED IS NOT ACHIEVED, ICHECK = 1
C         ON EXIT.
C  ABSCISSAE AND WEIGHTS OF QUADRATURE RULES ARE STACKED IN
C  ARRAY *P* IN THE ORDER IN WHICH THEY ARE NEEDED.
C     .. Scalar Arguments ..
      REAL A,B,EPSIL
      INTEGER ICHECK,K,NPTS
C     ..
C     .. Array Arguments ..
      REAL RESULT(8)
C     ..
C     .. Function Arguments ..
      REAL F
      EXTERNAL F
C     ..
C     .. Local Scalars ..
      REAL ACUM,DIFF,FZERO,SUM,X
      INTEGER I,INEW,IOLD,J
C     ..
C     .. Local Arrays ..
      REAL FUNCT(127),P(381)
C     ..
C     .. Intrinsic Functions ..
      INTRINSIC ABS
      DATA
     & P( 1),P( 2),P( 3),P( 4),P( 5),P( 6),P( 7),
     & P( 8),P( 9),P(10),P(11),P(12),P(13),P(14),
     & P(15),P(16),P(17),P(18),P(19),P(20),P(21),
     & P(22),P(23),P(24),P(25),P(26),P(27),P(28) /
     &  0.77459666924148337704E+00,0.55555555555555555556E+00,
     &  0.88888888888888888889E+00,0.26848808986833344073E+00,
     &  0.96049126870802028342E+00,0.10465622602646726519E+00,
     &  0.43424374934680255800E+00,0.40139741477596222291E+00,
     &  0.45091653865847414235E+00,0.13441525524378422036E+00,
     &  0.51603282997079739697E-01,0.20062852938698902103E+00,
     &  0.99383196321275502221E+00,0.17001719629940260339E-01,
     &  0.88845923287225699889E+00,0.92927195315124537686E-01,
     &  0.62110294673722640294E+00,0.17151190913639138079E+00,
     &  0.22338668642896688163E+00,0.21915685840158749640E+00,
     &  0.22551049979820668739E+00,0.67207754295990703540E-01,
     &  0.25807598096176653565E-01,0.10031427861179557877E+00,
     &  0.84345657393211062463E-02,0.46462893261757986541E-01,
     &  0.85755920049990351154E-01,0.10957842105592463824E+00 /
      DATA
     & P(29),P(30),P(31),P(32),P(33),P(34),P(35),
     & P(36),P(37),P(38),P(39),P(40),P(41),P(42),
     & P(43),P(44),P(45),P(46),P(47),P(48),P(49),
     & P(50),P(51),P(52),P(53),P(54),P(55),P(56) /
     &  0.99909812496766759766E+00,0.25447807915618744154E-02,
     &  0.98153114955374010687E+00,0.16446049854387810934E-01,
     &  0.92965485742974005667E+00,0.35957103307129322097E-01,
     &  0.83672593816886873550E+00,0.56979509494123357412E-01,
     &  0.70249620649152707861E+00,0.76879620499003531043E-01,
     &  0.53131974364437562397E+00,0.93627109981264473617E-01,
     &  0.33113539325797683309E+00,0.10566989358023480974E+00,
     &  0.11248894313318662575E+00,0.11195687302095345688E+00,
     &  0.11275525672076869161E+00,0.33603877148207730542E-01,
     &  0.12903800100351265626E-01,0.50157139305899537414E-01,
     &  0.42176304415588548391E-02,0.23231446639910269443E-01,
     &  0.42877960025007734493E-01,0.54789210527962865032E-01,
     &  0.12651565562300680114E-02,0.82230079572359296693E-02,
     &  0.17978551568128270333E-01,0.28489754745833548613E-01 /
      DATA
     & P(57),P(58),P(59),P(60),P(61),P(62),P(63),
     & P(64),P(65),P(66),P(67),P(68),P(69),P(70),
     & P(71),P(72),P(73),P(74),P(75),P(76),P(77),
     & P(78),P(79),P(80),P(81),P(82),P(83),P(84) /
     &  0.38439810249455532039E-01,0.46813554990628012403E-01,
     &  0.52834946790116519862E-01,0.55978436510476319408E-01,
     &  0.99987288812035761194E+00,0.36322148184553065969E-03,
     &  0.99720625937222195908E+00,0.25790497946856882724E-02,
     &  0.98868475754742947994E+00,0.61155068221172463397E-02,
     &  0.97218287474858179658E+00,0.10498246909621321898E-01,
     &  0.94634285837340290515E+00,0.15406750466559497802E-01,
     &  0.91037115695700429250E+00,0.20594233915912711149E-01,
     &  0.86390793819369047715E+00,0.25869679327214746911E-01,
     &  0.80694053195021761186E+00,0.31073551111687964880E-01,
     &  0.73975604435269475868E+00,0.36064432780782572640E-01,
     &  0.66290966002478059546E+00,0.40714410116944318934E-01,
     &  0.57719571005204581484E+00,0.44914531653632197414E-01,
     &  0.48361802694584102756E+00,0.48564330406673198716E-01 /
      DATA
     & P( 85),P( 86),P( 87),P( 88),P( 89),P( 90),P( 91),
     & P( 92),P( 93),P( 94),P( 95),P( 96),P( 97),P( 98),
     & P( 99),P(100),P(101),P(102),P(103),P(104),P(105),
     & P(106),P(107),P(108),P(109),P(110),P(111),P(112) /
     &  0.38335932419873034692E+00,0.51583253952048458777E-01,
     &  0.27774982202182431507E+00,0.53905499335266063927E-01,
     &  0.16823525155220746498E+00,0.55481404356559363988E-01,
     &  0.56344313046592789972E-01,0.56277699831254301273E-01,
     &  0.56377628360384717388E-01,0.16801938574103865271E-01,
     &  0.64519000501757369228E-02,0.25078569652949768707E-01,
     &  0.21088152457266328793E-02,0.11615723319955134727E-01,
     &  0.21438980012503867246E-01,0.27394605263981432516E-01,
     &  0.63260731936263354422E-03,0.41115039786546930472E-02,
     &  0.89892757840641357233E-02,0.14244877372916774306E-01,
     &  0.19219905124727766019E-01,0.23406777495314006201E-01,
     &  0.26417473395058259931E-01,0.27989218255238159704E-01,
     &  0.18073956444538835782E-03,0.12895240826104173921E-02,
     &  0.30577534101755311361E-02,0.52491234548088591251E-02 /
      DATA
     & P(113),P(114),P(115),P(116),P(117),P(118),P(119),
     & P(120),P(121),P(122),P(123),P(124),P(125),P(126),
     & P(127),P(128),P(129),P(130),P(131),P(132),P(133),
     & P(134),P(135),P(136),P(137),P(138),P(139),P(140) /
     &  0.77033752332797418482E-02,0.10297116957956355524E-01,
     &  0.12934839663607373455E-01,0.15536775555843982440E-01,
     &  0.18032216390391286320E-01,0.20357755058472159467E-01,
     &  0.22457265826816098707E-01,0.24282165203336599358E-01,
     &  0.25791626976024229388E-01,0.26952749667633031963E-01,
     &  0.27740702178279681994E-01,0.28138849915627150636E-01,
     &  0.99998243035489159858E+00,0.50536095207862517625E-04,
     &  0.99959879967191068325E+00,0.37774664632698466027E-03,
     &  0.99831663531840739253E+00,0.93836984854238150079E-03,
     &  0.99572410469840718851E+00,0.16811428654214699063E-02,
     &  0.99149572117810613240E+00,0.25687649437940203731E-02,
     &  0.98537149959852037111E+00,0.35728927835172996494E-02,
     &  0.97714151463970571416E+00,0.46710503721143217474E-02,
     &  0.96663785155841656709E+00,0.58434498758356395076E-02 /
      DATA
     & P(141),P(142),P(143),P(144),P(145),P(146),P(147),
     & P(148),P(149),P(150),P(151),P(152),P(153),P(154),
     & P(155),P(156),P(157),P(158),P(159),P(160),P(161),
     & P(162),P(163),P(164),P(165),P(166),P(167),P(168) /
     &  0.95373000642576113641E+00,0.70724899954335554680E-02,
     &  0.93832039777959288365E+00,0.83428387539681577056E-02,
     &  0.92034002547001242073E+00,0.96411777297025366953E-02,
     &  0.89974489977694003664E+00,0.10955733387837901648E-01,
     &  0.87651341448470526974E+00,0.12275830560082770087E-01,
     &  0.85064449476835027976E+00,0.13591571009765546790E-01,
     &  0.82215625436498040737E+00,0.14893641664815182035E-01,
     &  0.79108493379984836143E+00,0.16173218729577719942E-01,
     &  0.75748396638051363793E+00,0.17421930159464173747E-01,
     &  0.72142308537009891548E+00,0.18631848256138790186E-01,
     &  0.68298743109107922809E+00,0.19795495048097499488E-01,
     &  0.64227664250975951377E+00,0.20905851445812023852E-01,
     &  0.59940393024224289297E+00,0.21956366305317824939E-01,
     &  0.55449513263193254887E+00,0.22940964229387748761E-01 /
      DATA
     & P(169),P(170),P(171),P(172),P(173),P(174),P(175),
     & P(176),P(177),P(178),P(179),P(180),P(181),P(182),
     & P(183),P(184),P(185),P(186),P(187),P(188),P(189),
     & P(190),P(191),P(192),P(193),P(194),P(195),P(196) /
     &  0.50768775753371660215E+00,0.23854052106038540080E-01,
     &  0.45913001198983233287E+00,0.24690524744487676909E-01,
     &  0.40897982122988867241E+00,0.25445769965464765813E-01,
     &  0.35740383783153215238E+00,0.26115673376706097680E-01,
     &  0.30457644155671404334E+00,0.26696622927450359906E-01,
     &  0.25067873030348317661E+00,0.27185513229624791819E-01,
     &  0.19589750271110015392E+00,0.27579749566481873035E-01,
     &  0.14042423315256017459E+00,0.27877251476613701609E-01,
     &  0.84454040083710883710E-01,0.28076455793817246607E-01,
     &  0.28184648949745694339E-01,0.28176319033016602131E-01,
     &  0.28188814180192358694E-01,0.84009692870519326354E-02,
     &  0.32259500250878684614E-02,0.12539284826474884353E-01,
     &  0.10544076228633167722E-02,0.58078616599775673635E-02,
     &  0.10719490006251933623E-01,0.13697302631990716258E-01 /
      DATA
     & P(197),P(198),P(199),P(200),P(201),P(202),P(203),
     & P(204),P(205),P(206),P(207),P(208),P(209),P(210),
     & P(211),P(212),P(213),P(214),P(215),P(216),P(217),
     & P(218),P(219),P(220),P(221),P(222),P(223),P(224) /
     &  0.31630366082222647689E-03,0.20557519893273465236E-02,
     &  0.44946378920320678616E-02,0.71224386864583871532E-02,
     &  0.96099525623638830097E-02,0.11703388747657003101E-01,
     &  0.13208736697529129966E-01,0.13994609127619079852E-01,
     &  0.90372734658751149261E-04,0.64476204130572477933E-03,
     &  0.15288767050877655684E-02,0.26245617274044295626E-02,
     &  0.38516876166398709241E-02,0.51485584789781777618E-02,
     &  0.64674198318036867274E-02,0.77683877779219912200E-02,
     &  0.90161081951956431600E-02,0.10178877529236079733E-01,
     &  0.11228632913408049354E-01,0.12141082601668299679E-01,
     &  0.12895813488012114694E-01,0.13476374833816515982E-01,
     &  0.13870351089139840997E-01,0.14069424957813575318E-01,
     &  0.25157870384280661489E-04,0.18887326450650491366E-03,
     &  0.46918492424785040975E-03,0.84057143271072246365E-03 /
      DATA
     & P(225),P(226),P(227),P(228),P(229),P(230),P(231),
     & P(232),P(233),P(234),P(235),P(236),P(237),P(238),
     & P(239),P(240),P(241),P(242),P(243),P(244),P(245),
     & P(246),P(247),P(248),P(249),P(250),P(251),P(252) /
     &  0.12843824718970101768E-02,0.17864463917586498247E-02,
     &  0.23355251860571608737E-02,0.29217249379178197538E-02,
     &  0.35362449977167777340E-02,0.41714193769840788528E-02,
     &  0.48205888648512683476E-02,0.54778666939189508240E-02,
     &  0.61379152800413850435E-02,0.67957855048827733948E-02,
     &  0.74468208324075910174E-02,0.80866093647888599710E-02,
     &  0.87109650797320868736E-02,0.93159241280693950932E-02,
     &  0.98977475240487497440E-02,0.10452925722906011926E-01,
     &  0.10978183152658912470E-01,0.11470482114693874380E-01,
     &  0.11927026053019270040E-01,0.12345262372243838455E-01,
     &  0.12722884982732382906E-01,0.13057836688353048840E-01,
     &  0.13348311463725179953E-01,0.13592756614812395910E-01,
     &  0.13789874783240936517E-01,0.13938625738306850804E-01,
     &  0.14038227896908623303E-01,0.14088159516508301065E-01 /
      DATA
     & P(253),P(254),P(255),P(256),P(257),P(258),P(259),
     & P(260),P(261),P(262),P(263),P(264),P(265),P(266),
     & P(267),P(268),P(269),P(270),P(271),P(272),P(273),
     & P(274),P(275),P(276),P(277),P(278),P(279),P(280) /
     &  0.99999759637974846476E+00,0.69379364324103267170E-05,
     &  0.99994399620705437576E+00,0.53275293669780613125E-04,
     &  0.99976049092443204733E+00,0.13575491094922871973E-03,
     &  0.99938033802502358193E+00,0.24921240048299729402E-03,
     &  0.99874561446809511470E+00,0.38974528447328229322E-03,
     &  0.99780535449595727456E+00,0.55429531493037471492E-03,
     &  0.99651414591489027385E+00,0.74028280424450333046E-03,
     &  0.99483150280062100052E+00,0.94536151685852538246E-03,
     &  0.99272134428278861533E+00,0.11674841174299594077E-02,
     &  0.99015137040077015918E+00,0.14049079956551446427E-02,
     &  0.98709252795403406719E+00,0.16561127281544526052E-02,
     &  0.98351865757863272876E+00,0.19197129710138724125E-02,
     &  0.97940628167086268381E+00,0.21944069253638388388E-02,
     &  0.97473445975240266776E+00,0.24789582266575679307E-02 /
      DATA
     & P(281),P(282),P(283),P(284),P(285),P(286),P(287),
     & P(288),P(289),P(290),P(291),P(292),P(293),P(294),
     & P(295),P(296),P(297),P(298),P(299),P(300),P(301),
     & P(302),P(303),P(304),P(305),P(306),P(307),P(308) /
     &  0.96948465950245923177E+00,0.27721957645934509940E-02,
     &  0.96364062156981213252E+00,0.30730184347025783234E-02,
     &  0.95718821610986096274E+00,0.33803979910869203823E-02,
     &  0.95011529752129487656E+00,0.36933779170256508183E-02,
     &  0.94241156519108305981E+00,0.40110687240750233989E-02,
     &  0.93406843615772578800E+00,0.43326409680929828545E-02,
     &  0.92507893290707565236E+00,0.46573172997568547773E-02,
     &  0.91543758715576504064E+00,0.49843645647655386012E-02,
     &  0.90514035881326159519E+00,0.53130866051870565663E-02,
     &  0.89418456833555902286E+00,0.56428181013844441585E-02,
     &  0.88256884024734190684E+00,0.59729195655081658049E-02,
     &  0.87029305554811390585E+00,0.63027734490857587172E-02,
     &  0.85735831088623215653E+00,0.66317812429018878941E-02,
     &  0.84376688267270860104E+00,0.69593614093904229394E-02 /
      DATA
     & P(309),P(310),P(311),P(312),P(313),P(314),P(315),
     & P(316),P(317),P(318),P(319),P(320),P(321),P(322),
     & P(323),P(324),P(325),P(326),P(327),P(328),P(329),
     & P(330),P(331),P(332),P(333),P(334),P(335),P(336) /
     &  0.82952219463740140018E+00,0.72849479805538070639E-02,
     &  0.81462878765513741344E+00,0.76079896657190565832E-02,
     &  0.79909229096084140180E+00,0.79279493342948491103E-02,
     &  0.78291939411828301639E+00,0.82443037630328680306E-02,
     &  0.76611781930376009072E+00,0.85565435613076896192E-02,
     &  0.74869629361693660282E+00,0.88641732094824942641E-02,
     &  0.73066452124218126133E+00,0.91667111635607884067E-02,
     &  0.71203315536225203459E+00,0.94636899938300652943E-02,
     &  0.69281376977911470289E+00,0.97546565363174114611E-02,
     &  0.67301883023041847920E+00,0.10039172044056840798E-01,
     &  0.65266166541001749610E+00,0.10316812330947621682E-01,
     &  0.63175643771119423041E+00,0.10587167904885197931E-01,
     &  0.61031811371518640016E+00,0.10849844089337314099E-01,
     &  0.58836243444766254143E+00,0.11104461134006926537E-01 /
      DATA
     & P(337),P(338),P(339),P(340),P(341),P(342),P(343),
     & P(344),P(345),P(346),P(347),P(348),P(349),P(350),
     & P(351),P(352),P(353),P(354),P(355),P(356),P(357),
     & P(358),P(359),P(360),P(361),P(362),P(363),P(364) /
     &  0.56590588542365442262E+00,0.11350654315980596602E-01,
     &  0.54296566649831149049E+00,0.11588074033043952568E-01,
     &  0.51955966153745702199E+00,0.11816385890830235763E-01,
     &  0.49570640791876146017E+00,0.12035270785279562630E-01,
     &  0.47142506587165887693E+00,0.12244424981611985899E-01,
     &  0.44673539866202847374E+00,0.12443560190714035263E-01,
     &  0.42165768662616330006E+00,0.12632403643542078765E-01,
     &  0.39621280605761593918E+00,0.12810698163877361967E-01,
     &  0.37042208795007823014E+00,0.12978202239537399286E-01,
     &  0.34430734159943802278E+00,0.13134690091960152836E-01,
     &  0.31789081206847668318E+00,0.13279951743930530650E-01,
     &  0.29119514851824668196E+00,0.13413793085110098513E-01,
     &  0.26424337241092676194E+00,0.13536035934956213614E-01,
     &  0.23705884558982972721E+00,0.13646518102571291428E-01 /
      DATA
     & P(365),P(366),P(367),P(368),P(369),P(370),P(371),
     & P(372),P(373),P(374),P(375),P(376),P(377),P(378),
     & P(379),P(380),P(381) /
     &  0.20966523824318119477E+00,0.13745093443001896632E-01,
     &  0.18208649675925219825E+00,0.13831631909506428676E-01,
     &  0.15434681148137810869E+00,0.13906019601325461264E-01,
     &  0.12647058437230196685E+00,0.13968158806516938516E-01,
     &  0.98482396598119202090E-01,0.14017968039456608810E-01,
     &  0.70406976042855179063E-01,0.14055382072649964277E-01,
     &  0.42269164765363603212E-01,0.14080351962553661325E-01,
     &  0.14093886410782462614E-01,0.14092845069160408355E-01,
     &  0.14094407090096179347E-01 /
      ICHECK = 0
C  CHECK FOR TRIVIAL CASE.
      IF ( A .EQ. B ) GO TO 70
C  SCALE FACTORS.
      SUM = ( B + A ) / 2.0
      DIFF = ( B - A ) / 2.0
C  1-POINT GAUSS.
      FZERO = F ( SUM )
      RESULT(1) = 2.0 * FZERO * DIFF
      I = 0
      IOLD = 0
      INEW = 1
      K = 2
      ACUM = 0.0
      GO TO 30
10    IF ( K .EQ. 8 ) GO TO 50
      K = K + 1
      ACUM = 0.0
C  CONTRIBUTION FROM FUNCTION VALUES ALREADY COMPUTED.
      DO 20 J = 1, IOLD
        I = I + 1
        ACUM = ACUM + P(I) * FUNCT(J)
20    CONTINUE
C  CONTRIBUTION FROM NEW FUNCTION VALUES.
30    IOLD = IOLD + INEW
      DO 40 J = INEW, IOLD
        I = I + 1
        X = P(I) * DIFF
        FUNCT(J) = F ( SUM + X ) + F ( SUM - X )
        I = I + 1
        ACUM = ACUM + P(I) * FUNCT(J)
40    CONTINUE
      INEW = IOLD + 1
      I = I + 1
      RESULT(K) = ( ACUM + P(I) * FZERO ) * DIFF
C  CHECK FOR CONVERGENCE.
      IF ( ABS ( RESULT(K) - RESULT(K-1) ) - EPSIL * ABS ( RESULT(K) ) )
     &  60, 60, 10
C  CONVERGENCE NOT ACHIEVED.
50    ICHECK = 1
C  NORMAL TERMINATION.
60    NPTS = INEW + IOLD
      RETURN
C  TRIVIAL CASE.
70    K = 2
      RESULT(1) = 0.0
      RESULT(2) = 0.0
      NPTS = 0
      RETURN
      END
      REAL FUNCTION QSUB ( A, B, EPSIL, NPTS, ICHECK, RELERR, F )
C     .. Scalar Arguments ..
      REAL A,B,EPSIL,RELERR
      INTEGER ICHECK,NPTS
C     ..
C     .. Function Arguments ..
      REAL F
      EXTERNAL F
C     ..
C     .. Local Scalars ..
      REAL ALPHA,BETA,COMP,ESTIM,H
      INTEGER BAD,IC,J,JJ,K,M,M1,M2,N,NF,NMAX,OUT
      LOGICAL RHS
C     ..
C     .. Local Arrays ..
      REAL RESULT(8)
C     ..
C     .. External Subroutines ..
      EXTERNAL QUAD
C     ..
C     .. Intrinsic Functions ..
      INTRINSIC ABS,ISIGN
C    THIS FUNCTION ROUTINE PERFORMS AUTOMATIC INTEGRATION
C  OVER A FINITE INTERVAL USING THE BASIC INTEGRATION
C  ALGORITHM QUAD, TOGETHER WITH, IF NECESSARY, A NON-
C  ADAPTIVE SUBDIVISION PROCESS.
C    THE CALL TAKES THE FORM
C      QSUB(A,B,EPSIL,NPTS,ICHECK,RELERR,F)
C  AND CAUSES F(X) TO BE INTEGRATED OVER (A,B) WITH RELATIVE
C  ERROR HOPEFULLY NOT EXCEEDING EPSIL.  SHOULD QUAD CONVERGE
C  (ICHECK=0) THEN QSUB WILL RETURN THE VALUE OBTAINED BY IT;
C  OTHERWISE SUBDIVISION WILL BE INVOKED AS A RESCUE
C  OPERATION IN A NON-ADAPTIVE MANNER.  THE ARGUMENT RELERR
C  GIVES A CRUDE ESTIMATE OF THE ACTUAL RELATIVE ERROR
C  OBTAINED.
C    THE SUBDIVISION STRATEGY IS AS FOLLOWS:
C  LET THE INTERVAL (A,B) BE DIVIDED INTO 2**N PANELS AT STEP
C  N OF THE SUBDIVISION PROCESS.  QUAD IS APPLIED FIRST TO
C  THE SUBDIVIDED INTERVAL ON WHICH QUAD LAST FAILED TO
C  CONVERGE, AND IF CONVERGENCE IS NOW ACHIEVED THE REMAINING
C  PANELS ARE INTEGRATED.  SHOULD A CONVERGENCE FAILURE OCCUR
C  ON ANY PANEL, THE INTEGRATION AT THAT POINT IS TERMINATED
C  AND THE PROCEDURE REPEATED WITH N INCREASED BY 1.  THE
C  STRATEGY ENSURES THAT POSSIBLY DELINQUENT INTERVALS ARE
C  EXAMINED BEFORE WORK, WHICH LATER MIGHT HAVE TO BE
C  DISCARDED, IS INVESTED IN WELL-BEHAVED PANELS.  THE
C  PROCESS IS COMPLETE WHEN NO CONVERGENCE FAILURE OCCURS ON
C  ANY PANEL AND THE SUM OF THE RESULTS OBTAINED BY QUAD ON
C  EACH PANEL IS TAKEN AS THE VALUE OF THE INTEGRAL.
C    THE PROCESS IS VERY CAUTIOUS IN THAT THE SUBDIVISION OF
C  THE INTERVAL (A,B) IS UNIFORM, THE FINENESS OF WHICH IS
C  CONTROLLED BY THE SUCCESS OF QUAD.  IN THIS WAY, IT IS
C  RATHER DIFFICULT FOR A SPURIOUS CONVERGENCE TO SLIP 
C  THROUGH.
C    THE CONVERGENCE CRITERION OF QUAD IS SLIGHTLY RELAXED
C  IN THAT A PANEL IS DEEMED TO HAVE BEEN SUCCESSFULLY
C  INTEGRATED IF EITHER QUAD CONVERGES OR THE ESTIMATED
C  ABSOLUTE ERROR COMMITTED ON THIS PANEL DOES NOT EXCEED
C  EPSIL TIMES THE ESTIMATED ABSOLUTE VALUE OF THE INTEGRAL
C  OVER (A,B).  THIS RELAXATION IS TO TRY TO TAKE ACCOUNT OF
C  A COMMON SITUATION WHERE ONE PARTICULAR PANEL CAUSES
C  SPECIAL DIFFICULTY, PERHAPS DUE TO SINGULARITY OF SOME
C  TYPE.  IN THIS CASE, QUAD COULD OBTAIN NEARLY EXACT
C  ANSWERS ON ALL OTHER PANELS, AND SO THE RELATIVE ERROR FOR
C  THE TOTAL INTEGRATION WOULD BE ALMOST ENTIRELY DUE TO THE
C  DELINQUENT PANEL.  WITHOUT THIS CONDITION, THE COMPUTATION
C  MIGHT CONTINUE DESPITE THE REQUESTED RELATIVE ERROR BEING
C  ACHIEVED.
C    THE OUTCOME OF THE INTEGRATION IS INDICATED BY ICHECK.
C    ICHECK = 0 - CONVERGENCE OBTAINED WITHOUT INVOKING
C                 SUBDIVISION.  THIS CORRESPONDS TO THE
C                 DIRECT USE OF QUAD.
C    ICHECK = 1 - RESULT OBTAINED AFTER INVOKING SUBDIVISION.
C    ICHECK = 2 - AS FOR ICHECK=1 BUT AT SOME POINT THE
C                 RELAXED CONVERGENCE CRITERION WAS USED.
C                 THE RISK OF UNDERESTIMATING THE RELATIVE
C                 ERROR WILL BE INCREASED.  IF NECESSARY,
C                 CONFIDENCE MAY BE RESTORED BY CHECKING
C                 EPSIL AND RELERR FOR A SERIOUS DISCREPANCY.
C    ICHECK NEGATIVE
C                 IF DURING THE SUBDIVISION PROCESS THE
C                 ALLOWED UPPER LIMIT ON THE NUMBER OF PANELS
C                 THAT MAY BE GENERATED (PRESENTLY 4096) IS
C                 REACHED, A RESULT IS OBTAINED WHICH MAY BE
C                 UNRELIABLE BY CONTINUING THE INTEGRATION
C                 WITHOUT FURTHER SUBDIVISION IGNORING
C                 CONVERGENCE FAILURES.  THIS OCCURRENCE IS
C                 FLAGGED BY RETURNING ICHECK WITH NEGATIVE
C                 SIGN.
C  THE RELIABILITY OF THE ALGORITHM WILL DECREASE FOR LARGE
C  VALUES OF EPSIL.  IT IS RECOMMENDED THAT EPSIL SHOULD
C  GENERALLY BE LESS THAN ABOUT 0.001.
      DATA NMAX / 4096 /
      CALL QUAD ( A, B, RESULT, K, EPSIL, NPTS, ICHECK, F )
      QSUB = RESULT(K)
      RELERR = 0.0
      IF ( QSUB .NE. 0.0 ) RELERR =
     &  ABS ( ( RESULT(K) - RESULT(K-1) ) / QSUB )
C  CHECK IF SUBDIVISION IS NEEDED.
      IF ( ICHECK .EQ. 0 ) RETURN
C  SUBDIVIDE.
      ESTIM = ABS ( QSUB * EPSIL )
      IC = 1
      RHS = .FALSE.
      N = 1
      H = B - A
      BAD = 1
10    QSUB = 0.0
      RELERR = 0.0
      H = H * 0.5
      N = N + N
C  INTERVAL (A,B) DIVIDED INTO N EQUAL SUBINTERVALS.
C  INTEGRATE OVER SUBINTERVALS BAD TO (BAD+1) WHERE TROUBLE
C  HAS OCCURRED.
      M1 = BAD
      M2 = BAD + 1
      OUT = 1
      GO TO 50
C  INTEGRATE OVER SUBINTERVALS 1 TO (BAD-1).
20    M1 = 1
      M2 = BAD - 1
      RHS = .FALSE.
      OUT = 2
      GO TO 50
C  INTEGRATE OVER SUBINTERVALS (BAD+2) TO N.
30    M1 = BAD + 2
      M2 = N
      OUT = 3
      GO TO 50
C  SUBDIVISION RESULT.
40    ICHECK = IC
      RELERR = RELERR / ABS ( QSUB )
      RETURN
C  INTEGRATE OVER SUBINTERVALS M1 TO M2.
50    IF ( M1 .GT. M2 ) GO TO 90
      DO 80 JJ = M1, M2
        J = JJ
C  EXAMINE FIRST THE LEFT OR RIGHT HALF OF THE SUBDIVIDED 
C  TROUBLESOME INTERVAL DEPENDING ON THE OBSERVED TREND.
        IF ( RHS ) J = M2 + M1 - JJ
        ALPHA = A + H * ( J - 1 )
        BETA = ALPHA + H
        CALL QUAD ( ALPHA, BETA, RESULT, M, EPSIL, NF, ICHECK, F )
        COMP = ABS ( RESULT(M) - RESULT(M-1) )
        NPTS = NPTS + NF
        IF ( ICHECK .NE. 1 ) GO TO 70
        IF ( COMP .LE. ESTIM ) THEN
C  RELAXED CONVERGENCE
          IC = ISIGN ( 2, IC )
          GO TO 70
        ENDIF
C  SUBINTERVAL J HAS CAUSED TROUBLE.
C  CHECK IF FURTHER SUBDIVISION SHOULD BE CARRIED OUT.
        IF ( N .EQ. NMAX ) GO TO 60
        BAD = 2 * J - 1
        RHS = .FALSE.
        IF ( ( J - 2 * ( J / 2 ) ) .EQ. 0 ) RHS = .TRUE.
        GO TO 10
60      IC = -ABS ( IC )
70      QSUB = QSUB + RESULT ( M )
80    CONTINUE
      RELERR = RELERR + COMP
90    GO TO ( 20, 30, 40 ), OUT
      END
      REAL FUNCTION QSUBA ( A, B, EPSIL, NPTS, ICHECK, RELERR, F )
C    THIS FUNCTION ROUTINE PERFORMS AUTOMATIC INTEGRATION
C  OVER A FINITE INTERVAL USING THE BASIC INTEGRATION
C  ALGORITHM QUAD, TOGETHER WITH, IF NECESSARY, AN ADAPTIVE
C  SUBDIVISION PROCESS.  IT IS GENERALLY MORE EFFICIENT THAN
C  THE NON-ADAPTIVE ALGORITHM QSUB BUT IS LIKELY TO BE LESS
C  RELIABLE (SEE COMP.J., 14, 189, 1971 ).
C    THE CALL TAKES THE FORM
C      QSUBA(A,B,EPSIL,NPTS,ICHECK,RELERR,F)
C  AND CAUSES F(X) TO BE INTEGRATED OVER (A,B) WITH RELATIVE
C  ERROR HOPEFULLY NOT EXCEEDING EPSIL.  SHOULD QUAD CONVERGE
C  (ICHECK=0) THEN QSUBA WILL RETURN THE VALUE OBTAINED BY IT;
C  OTHERWISE SUBDIVISION WILL BE INVOKED AS A RESCUE
C  OPERATION IN AN ADAPTIVE MANNER.  THE ARGUMENT RELERR GIVES 
C  A CRUDE ESTIMATE OF THE ACTUAL RELATIVE ERROR OBTAINED.
C    THE SUBDIVISION STRATEGY IS AS FOLLOWS:
C  AT EACH STAGE OF THE PROCESS, AN INTERVAL IS PRESENTED FOR
C  SUBDIVISION.  (INITIALLY THIS WILL BE THE WHOLE INTERVAL
C  (A,B)).  THE INTERVAL IS HALVED AND QUAD APPLIED TO EACH
C  SUBINTERVAL.  SHOULD QUAD FAIL ON THE FIRST SUBINTERVAL,
C  THE SUBINTERVAL IS STACKED FOR FUTURE SUBDIVISION AND THE
C  SECOND SUBINTERVAL IMMEDIATELY EXAMINED.  SHOULD QUAD FAIL
C  ON THE SECOND SUBINTERVAL, THE SUBINTERVAL IS
C  IMMEDIATELY SUBDIVIDED AND THE WHOLE PROCESS REPEATED.
C  EACH TIME A CONVERGED RESULT IS OBTAINED, IT IS
C  ACCUMULATED AS THE PARTIAL VALUE OF THE INTEGRAL.  WHEN
C  QUAD CONVERGES ON BOTH SUBINTERVALS, THE INTERVAL LAST
C  STACKED IS CHOSEN NEXT FOR SUBDIVISION AND THE PROCESS
C  REPEATED.  A SUBINTERVAL IS NOT EXAMINED AGAIN ONCE A
C  CONVERGED RESULT IS OBTAINED FOR IT, SO THAT A SPURIOUS
C  CONVERGENCE IS MORE LIKELY TO SLIP THROUGH THAN FOR THE
C  NON-ADAPTIVE ALGORITHM QSUB.
C    THE CONVERGENCE CRITERION OF QUAD IS SLIGHTLY RELAXED
C  IN THAT A PANEL IS DEEMED TO HAVE BEEN SUCCESSFULLY
C  INTEGRATED IF EITHER QUAD CONVERGES OR THE ESTIMATED
C  ABSOLUTE ERROR COMMITTED ON THIS PANEL DOES NOT EXCEED
C  EPSIL TIMES THE ESTIMATED ABSOLUTE VALUE OF THE INTEGRAL
C  OVER (A,B).  THIS RELAXATION IS TO TRY TO TAKE ACCOUNT OF
C  A COMMON SITUATION WHERE ONE PARTICULAR PANEL CAUSES
C  SPECIAL DIFFICULTY, PERHAPS DUE TO SINGULARITY OF SOME
C  TYPE.  IN THIS CASE, QUAD COULD OBTAIN NEARLY EXACT
C  ANSWERS ON ALL OTHER PANELS, AND SO THE RELATIVE ERROR FOR
C  THE TOTAL INTEGRATION WOULD BE ALMOST ENTIRELY DUE TO THE
C  DELINQUENT PANEL.  WITHOUT THIS CONDITION, THE COMPUTATION
C  MIGHT CONTINUE DESPITE THE REQUESTED RELATIVE ERROR BEING
C  ACHIEVED.
C    THE OUTCOME OF THE INTEGRATION IS INDICATED BY ICHECK.
C    ICHECK = 0 - CONVERGENCE OBTAINED WITHOUT INVOKING
C                 SUBDIVISION.  THIS WOULD CORRESPOND TO THE
C                 DIRECT USE OF QUAD.
C    ICHECK = 1 - RESULT OBTAINED AFTER INVOKING SUBDIVISION.
C    ICHECK = 2 - AS FOR ICHECK=1 BUT AT SOME POINT THE
C                 RELAXED CONVERGENCE CRITERION WAS USED.
C                 THE RISK OF UNDERESTIMATING THE RELATIVE
C                 ERROR WILL BE INCREASED.  IF NECESSARY,
C                 CONFIDENCE MAY BE RESTORED BY CHECKING
C                 EPSIL AND RELERR FOR A SERIOUS DISCREPANCY.
C    ICHECK NEGATIVE
C                 IF DURING THE SUBDIVISION PROCESS THE STACK
C                 OF DELINQUENT INTERVALS BECOMES FULL (IT IS
C                 PRESENTLY SET TO HOLD AT MOST 100 NUMBERS)
C                 A RESULT IS OBTAINED BY CONTINUING THE
C                 INTEGRATION IGNORING CONVERGENCE FAILURES
C                 WHICH CANNOT BE ACCOMMODATED BY THE STACK.
C                 THIS OCCURRENCE IS FLAGGED BY RETURNING
C                 ICHECK WITH NEGATIVE SIGN.
C  THE RELIABILITY OF THE ALGORITHM WILL DECREASE FOR LARGE
C  VALUES OF EPSIL.  IT IS RECOMMENDED THAT EPSIL SHOULD
C  GENERALLY BE LESS THAN ABOUT 0.001.
C     .. Scalar Arguments ..
      REAL A,B,EPSIL,RELERR
      INTEGER ICHECK,NPTS
C     ..
C     .. Function Arguments ..
      REAL F
      EXTERNAL F
C     ..
C     .. Local Scalars ..
      REAL COMP,ESTIM,SUB1,SUB2,SUB3
      INTEGER IC,IS,ISMAX,K,NF
C     ..
C     .. Local Arrays ..
      REAL RESULT(8),STACK(100)
C     ..
C     .. External Subroutines ..
      EXTERNAL QUAD
C     ..
C     .. Intrinsic Functions ..
      INTRINSIC ABS,ISIGN
      DATA ISMAX / 100 /
      CALL QUAD ( A, B, RESULT, K, EPSIL, NPTS, ICHECK, F )
      QSUBA = RESULT(K)
      RELERR = 0.0
      IF ( QSUBA .NE. 0.0 ) 
     &  RELERR = ABS ( ( RESULT(K) - RESULT(K-1) ) / QSUBA )
C  CHECK IF SUBDIVISION IS NEEDED.
      IF ( ICHECK .EQ. 0 ) RETURN
C  SUBDIVIDE.
      ESTIM = ABS ( QSUBA * EPSIL )
      RELERR = 0.0
      QSUBA = 0.0
      IS = 1
      IC = 1
      SUB1 = A
      SUB3 = B
10    SUB2 = ( SUB1 + SUB3 ) * 0.5
      CALL QUAD ( SUB1, SUB2, RESULT, K, EPSIL, NF, ICHECK, F )
      NPTS = NPTS + NF
      COMP = ABS ( RESULT(K) - RESULT(K-1) )
      IF ( ICHECK .EQ. 0 ) GO TO 30
      IF ( COMP .LE. ESTIM ) GO TO 70
      IF ( IS .GE. ISMAX ) GO TO 20
C  STACK SUBINTERVAL (SUB1,SUB2) FOR FUTURE EXAMINATION.
      STACK(IS) = SUB1
      IS = IS + 1
      STACK(IS) = SUB2
      IS = IS + 1
      GO TO 40
20    IC = -ABS ( IC )
30    QSUBA = QSUBA + RESULT(K)
      RELERR = RELERR + COMP
40    CALL QUAD ( SUB2, SUB3, RESULT, K, EPSIL, NF, ICHECK, F )
      NPTS = NPTS + NF
      COMP = ABS ( RESULT(K) - RESULT(K-1) )
      IF ( ICHECK .EQ. 0 ) GO TO 50
      IF ( COMP .LE. ESTIM ) GO TO 80
C  SUBDIVIDE INTERVAL (SUB2,SUB3)
      SUB1 = SUB2
      GO TO 10
50    QSUBA = QSUBA + RESULT(K)
      RELERR = RELERR + COMP
      IF ( IS .EQ. 1 ) GO TO 60
C  SUBDIVIDE THE DELINQUENT INVERVAL LAST STACKED.
      IS = IS - 1
      SUB3 = STACK(IS)
      IS = IS - 1
      SUB1 = STACK(IS)
      GO TO 10
C  SUBDIVISION RESULT.
60    ICHECK = IC
      RELERR = RELERR / ABS ( QSUBA )
      RETURN
C  RELAXED CONVERGENCE.
70    IC = ISIGN ( 2, IC )
      GO TO 30
80    IC = ISIGN ( 2, IC )
      GO TO 50
      END
SHAR_EOF
fi # end of overwriting check
cd ..
cd ..
cd ..
#       End of shell archive
exit 0
