!======================================================================!
                !----arranging the bonds i-j in ascending order----!
                !------ordering based on first column--------!                                  
                filename = 'newbonds.dat'
                call findmaxrows(filename,cs)
                open(25,file='newbonds.dat')
                open(26,file='newbonds_ordered.dat')

                flag = 0
                do k=1,cs
                  read(25,*) S(k,1),S(k,2)
                enddo
                do k=1,cs
                  Smin = S(k,1)
                  S2 = S(k,2)
                  kmin = k
                  do l=k+1,cs
                   if(S(l,1).lt.Smin)then
                      Smin = S(l,1)
                      S2 = S(l,2)
                      kmin = l
                      flag = 1
                   endif
                  enddo
                   if(flag.eq.1)then
                      S(kmin,1) = S(k,1)
                      S(kmin,2) = S(k,2)
                    endif
                   write(26,*) Smin,S2
                  enddo
                   close(25)
                   close(26)
!======================================================================!
