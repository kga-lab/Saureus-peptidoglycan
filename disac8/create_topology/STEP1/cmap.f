!==============================[ CMAP ] ================================!
                write(32,'(a)') ''
                write(32,'(a)') '[ cmap ]'
                write(32,'(a)') '; i     j     k     l     m     func '

               do i=1,Na
                if(atomtype(i).eq.'C')then
                do j=1,Na
                 if((B(i,j).eq.1).and.(atomtype(j).eq.'NH1'))then
                  do k=1,Na
                   if((B(j,k).eq.1).and.((atomtype(k).eq.'CT1').or.
     +                                (atomtype(k).eq.'CTD1')))then
                    do l=1,Na
                     if((B(k,l).eq.1).and.(atomtype(l).eq.'C'))then
                     do m=1,Na
                      if((B(l,m).eq.1).and.(atomtype(m).eq.'NH1'))then
                       write(26,*)  i,j,k,l,m
                       write(32,'(i5,5i6)') i,j,k,l,m,1 !fun type 1
                      endif
                     enddo!m
                   endif
                  enddo!l
                 endif
                enddo!k
               endif
              enddo!j
              endif
             enddo!i
!=======================================================================!
