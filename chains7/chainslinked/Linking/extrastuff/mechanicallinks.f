             Program p2
               implicit none
               integer i,j,k,nc,i2,ic,ir,N,idum,ii,rn
               parameter (nc=24,N=16816)  
               integer nd(nc),flag1(nc),flag2(nc),l(2)
               double precision ran2
               character*16 fname1,fname2,fname3
               character*6 res, atom,atomtype
                  idum = 12345678
!==========================================================!
             open(11,file='number_disaccharide.tex')
             open(12,file='atominfo.dat')

                do k=1,nc
                  read(11,*) i,nd(i)
                enddo
             do k=1,nc
                write(fname1,fmt='(a,i0,a)') 'chain',k,'.dat'
                 open(32,file=fname1,access='append')
                 do j=1,nd(k)
                   do
                     read(12,*) i,ic,ir,res,atom,atomtype
                     if(trim(atom).eq.'NZ')then
                        i2 = i+14
                       write(32,*) j,i,i2
                       exit
                     endif
                   enddo
                 enddo
                 close(32)
              enddo
                 close(11)
                 close(12)
!========================================================!
             do ic=1,nc
               write(fname1,fmt='(a,i0,a)') 'chain',ic,'.dat'

               open(32,file=fname1,action='read')
                do ii=1,nd(i)
                 read(32,*) j,l(1),l(2)
                    rn = (2*ran2(idum))

                  read(32,*) j,l(1),l(2)
                     
   
                 END  
!===========================================================!
                  include 'ran2.f'
