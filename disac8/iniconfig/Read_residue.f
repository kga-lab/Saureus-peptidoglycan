!=================================================================!
          open(fp,file=filename,status='old',action='read')
            read(fp,*) comment
            read(fp,*) Nar(kr,ic)
           if((trim(comment).eq.'NAG').or.(trim(comment).eq.'NAM'))then
             c1=c1+1
           endif
             do i=1,Nar(kr,ic)
                read(fp,*) resnam, atom, j, x,y,z
                j = j + ca
                y = y + (0.52d0*dble(c1-1)) 
                x = x + (2.d0*dble(ic-1)) !separation between chains
                if(trim(resnam).ne.'NAG')then
                 x = x + 0.2d0 !NAM and AA are offset
                endif
               write(21,'(a8,a6,i6,3f8.3)') adjustr(resnam),
     +                    adjustr(atom),j,x,y,z
             enddo
               close(fp)
!========================================================================!
