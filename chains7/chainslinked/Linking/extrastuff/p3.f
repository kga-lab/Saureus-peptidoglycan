             Program p3
               implicit none
               integer i,ic,j,jc,fr,k,nd,i1,ic1,rn,n2,k2,cindex,c
               parameter (nd=51,n2=18912)  
               character*16 fname1
               character*6 bead,resnam,temp,beadi,beadj
                              

             open(11,file='selectedcontacts_chosen.dat')
             open(21,file='checkfile1.dat')
                c = 0
                do k=1,nd
                  read(11,*) i,ic,j,jc,fr,cindex
                  open(12,file='atominfo.dat')
                    do k2=1,n2
                     read(12,*) i1,ic1,rn,resnam,bead,temp
                    if(i1.eq.i) then
                       c = c + 1
                       write(21,'(2I16,a)') c,i,bead
                        exit
                     endif
                    enddo
                    close(12)
                enddo
                 close(11)
                 close(21)
                 END  
