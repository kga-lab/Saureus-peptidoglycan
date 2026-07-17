!23456789---------------------------------------------------------------!
              Subroutine findmaxrows(filename,c)
                implicit none
                integer fp,c
                character*32 filename,dummy
                character*10 path
                path = 'inputs/'
                c = 0
                fp = 51
                open(fp,file=trim(adjustl(path))//filename)  !OK
               do 
                 read(fp,*,end=100) dummy
                  c = c + 1
               enddo
 100           close(fp)
               END
!========================================================================!               
