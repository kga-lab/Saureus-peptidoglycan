!==================================================================!
         do ic=1,Nc-1
           do ip=1,cpmax(ic)
              i = A(ip,ic)
             do jc=ic+1,Nc
               do jp=1,cpmax(jc) 
                j = A(jp,jc)   
                if(resnam(i).ne.resnam(j))then
                   rx = x(i)-x(j)
                   ry = y(i)-y(j)
                   rz = z(i)-z(j)
                   !---MINIMUM IMAGE CONVENTION
                   rx = rx - (Lx* (ANINT(rx/Lx)))  !OK for pbc-link
                  ! ry = ry - (Ly* (ANINT(ry/Ly)))
                  ! rz = rz - (Lz* (ANINT(rz/Lz)))
                   !--------------
                   rij = dsqrt((rx**2)+(ry**2)+(rz**2))
                   if(rij.le.rmin)then
                    write(21,*) i,ic,j,jc
                    write(22,*) i,ic,j,jc  !copy for shuffling
                    tc = tc + 1
                   endif
                endif
               enddo
             enddo
            enddo
          enddo
!===================================================================!
