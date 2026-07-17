!===========================[ pairs ]===================================!
               write(32,'(a)') ''
               write(32,'(a)') '[ pairs ]'
               write(32,'(a)') '; i    j   func   sigma14  epsilon14'
                P(:,:) =0
                c = 0
            do i=1,Na
              do j=1,Na
                if(B(i,j).eq.1)then
                 do k=1,Na
                  if((B(j,k).eq.1).and.(k.ne.i))then
                   do l=1,Na
                     if((B(k,l).eq.1).and.(l.ne.j))then
                      P(i,l) = 1  
                      if(l.gt.i)then 
                       write(23,*) i,j,k,l  !writing dihedrals to file
                      c = c+1        
                      endif
                     endif
                    enddo
                   endif
                  enddo
                 endif
                enddo
              enddo
              close(23)
 
            !----------writing-----!
             do i=1,Na
               do l=i+1,Na
                  if(P(i,l).eq.1)then
                    write(32,'(i5,2i6)') i,l,1   !pair func type =1
                    write(21,*) i,l !writing to pairs.dat
                  endif
               enddo
             enddo
!======================================================================!
