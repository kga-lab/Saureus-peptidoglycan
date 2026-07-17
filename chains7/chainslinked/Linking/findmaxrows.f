!23456789---------------------------------------------------------------!
              Subroutine findmaxrows(filename,c)
                implicit none
                integer fp,c
                character*32 filename,dummy
                c = 0
                fp = 51
                open(fp,file=filename)  
               do 
                 read(fp,*,end=100) dummy
                  c = c + 1
               enddo
 100           close(fp)
               END
!========================================================================!               
