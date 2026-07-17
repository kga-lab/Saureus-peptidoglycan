              Program ordering
                implicit none
                integer i,ic,j,jc,fr
                integer k1,k,im,cindex

                open(21,file='selectedcontacts_chosen.dat')

                im=1
               do k1=1,7 !chains
                  open(11,file='selectedcontacts.dat')
                  do k=1,32 !contacts
                    read(11,*) i,ic,j,jc,fr,cindex
                    if(ic.eq.im) then
                       write(21,*) i,ic,j,jc,fr,cindex
                    endif
                  enddo
                    im = im+1
                   close(11)
              enddo
                 close(21)
                  END
