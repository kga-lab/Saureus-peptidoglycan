!============================================================!
            open(21,file='contacts.dat')
            open(23,file='contactlist.dat')
             tc2 = 0
            do k=1,tc
               read(21,*) i,ic,j,jc
               flag = 1
               fr = 1 
              open(22,file='contacts2.dat')
              do k2=1,k-1
                 read(22,*) i2,ic2,j2,jc2
                 if((i.eq.i2).and.(j.eq.j2))then
                    flag=0
                    exit
                 endif
              enddo
              if(flag.ne.0)then
                 read(22,*) i2,ic2,j2,jc2 !skipping at kth position
                 do k2=k+1,tc
                  read(22,*) i2,ic2,j2,jc2
                  if((i.eq.i2).and.(j.eq.j2))then
                    fr = fr+1
                  endif
                 enddo
               write(23,*) i,ic,j,jc,fr
                 tc2 = tc2 + 1
               endif
                  close(22)
             enddo     
             close(21)   
             close(23)
!============================================================!
