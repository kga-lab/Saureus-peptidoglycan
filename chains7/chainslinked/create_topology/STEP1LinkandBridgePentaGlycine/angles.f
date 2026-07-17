!================== [ angles ]=================================! 
           write(32,'(a)') ''
           write(32,'(a)') '[ angles ]'
           write(32,'(a)') '; i    j   k   func'
             do i=1,Na
                do j=1,Na
                 if(B(i,j).eq.1)then
                  do k=i+1,Na
                   if((B(j,k).eq.1))then  
                    write(32,'(i5,3i6)') i,j,k,5  !func type = 5
                    write(22,*) i,j,k !writing to angles.dat
                   endif
                  enddo
                 endif
                enddo
              enddo
!==============================================================!
