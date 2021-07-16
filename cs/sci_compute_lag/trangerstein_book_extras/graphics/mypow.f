c***********************************************************************
c  Copyright 2006 John A. Trangenstein
c
c  This software is made available for research and instructional use 
c  only. 
c  You may copy and use this software without charge for these 
c  non-commercial purposes, provided that the copyright notice and 
c  associated text is reproduced on all copies.  
c  For all other uses (including distribution of modified versions), 
c  please contact the author at
c    John A. Trangenstein
c    Department of Mathematics
c    Duke University
c    Durham, NC 27708-0320
c    USA
c  or
c    johnt@math.duke.edu
c  
c  This software is made available "as is" without any assurance that it
c  is completely correct, or that it will work for your purposes.  
c  Use the software at your own risk.
c***********************************************************************
c "$Header: /home/faculty/johnt/cvs/deal_new/graphics/mypow.f,v 1.1 2009/08/20 17:31:49 johnt Exp $"
      function my_powd(x,i)
      double precision my_powd,x
      integer i
      my_powd=x**i
      return
      end

      function my_powi(x,i)
      integer my_powi,x,i
      my_powi=x**i
      return
      end

      function my_pows(x,i)
      real my_pows,x
      integer i
      my_pows=x**i
      return
      end
