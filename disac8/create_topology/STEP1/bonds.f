!======================================================================!
           !----------------[ bonds ]------------------------!
             write(32,'(a)') ''
             write(32,'(a)') '[ bonds ]'
             write(32,'(a)') '; i    j   func   bo   kb'
            do ic=1,Nc
              do kr=1,Nr(ic)
              read(fpc(ic),*) bondfile(kr,ic)
              call findmaxrows(bondfile(kr,ic),Nbr(kr,ic))
              Nbr(kr,ic) = Nbr(kr,ic) - 1
              enddo
            enddo
            Nb = sum(Nbr(:,:))
            ca = 0
            flag = 1
            B(:,:) = 0
           
            do ic=1,Nc
             do kr=1,Nr(ic)
                   open(fp,file=trim(adjustl(pathi))//bondfile(kr,ic))
                   read(fp,*) comment
                   do k1=1,Nbr(kr,ic)
                        read(fp,*) i,j
                        jj = j
                        include 'check_connectivity.f'
                       if(flag.eq.1) then
                        i =  i + ca
                        j =  j + ca
                        write(20,*) i,j  !writing to bonds.dat as output
                         B(i,j) = 1
                         B(j,i) = 1
                        write(32, '(i5,2i6)') i, j, 1  !bond func=1
                       endif
                        flag = 1
                 enddo
                 ca = ca + Nar(kr,ic)
                 close(fp)
             enddo
           enddo
!=======================================================================!

