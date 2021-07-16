/* ismin.f -- translated by f2c (version 20090411).
   You must link the resulting object file with libf2c:
	on Microsoft Windows system, link with libf2c.lib;
	on Linux or Unix systems, link with .../path/to/libf2c.a -lm
	or, if you install libf2c.a in a standard place, with -lf2c -lm
	-- in that order, at the end of the command line, as in
		cc *.o -lf2c -lm
	Source for libf2c is in /netlib/f2c/libf2c.zip, e.g.,

		http://www.netlib.org/f2c/libf2c.zip
*/

#include "f2c.h"

integer ismin_(integer *n, real *sx, integer *incx)
{
    /* System generated locals */
    integer ret_val, i__1;

    /* Local variables */
    static integer i__, ix;
    static real smin;

    /* Parameter adjustments */
    --sx;

    /* Function Body */
    ret_val = 0;
    if (*n < 1 || *incx <= 0) {
	return ret_val;
    }
    ret_val = 1;
    if (*n == 1) {
	return ret_val;
    }
    if (*incx == 1) {
	smin = sx[1];
	i__1 = *n;
	for (i__ = 2; i__ <= i__1; ++i__) {
	    if (sx[i__] < smin) {
		ret_val = i__;
		smin = sx[i__];
	    }
	}
    } else {
	ix = 1;
	smin = sx[1];
	ix += *incx;
	i__1 = *n;
	for (i__ = 2; i__ <= i__1; ++i__) {
	    if (sx[ix] < smin) {
		ret_val = i__;
		smin = sx[ix];
	    }
	    ix += *incx;
	}
    }
    return ret_val;
} /* ismin_ */

