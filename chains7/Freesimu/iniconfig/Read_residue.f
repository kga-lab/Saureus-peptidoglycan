!=================================================================!
          open(fp,file=filename,status='old',action='read')
            read(fp,*) comment
            read(fp,*) Nar
               c1 = c1 + 1
             do i=1,Nar
                read(fp,*) resnam, atom, j, x,y,z
                    xo = x
                    yo = y
                    zo = z
                    x = (xo*dcos(theta))+(zo*dsin(theta))  
                    z = (xo*dsin(theta))-(zo*dcos(theta)) 
                  j = j + ca
                  y = y + (1.04d0*dble(c1-1)) + ym*vs(ic) + 0.6d0 
                  x = x + xm
               write(21,'(a8,a6,i6,3f8.3)') adjustr(resnam),
     +                    adjustr(atom),j,x,y,z
             enddo
               close(fp)
!========================================================================!
