!23456789---------------------------------------------------------------!
             Subroutine atomtypes(atom,atomtype,Na)
                      implicit none
                      integer i,j,Na,flag
                      double precision q,m
                      character*6 atom(Na),atomtype(Na)
!=========================================================================
                   open(11,file='inputs/atomlabels.dat')
                   open(21,file='outputs/atomtypes.dat')
                   do i=1,Na
                     read(11,*) j,atom(i),atomtype(i),q,m
                   enddo
                   write(21,*) atomtype(1)
                   do i=2,Na
                      do j=1,i-1
                       if(atomtype(i).eq.atomtype(j))then
                         flag =0
                         exit
                       else
                         flag =1
                       endif
                      enddo
                      if(flag.eq.1)then
                      write(21,*) atomtype(i)
                      endif
                   enddo
                   close(11)
                   close(21)
                  END 
!========================================================================
