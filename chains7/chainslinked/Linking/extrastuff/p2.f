             Program p2
               implicit none
               integer i,j,k,nc,i2,ic,ir,N
               parameter (nc=7,N=11921)  
               integer nd(nc),flag1(nc),flag2(nc)
               character*16 fname1
               character*6 res, atom,atomtype
                              
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
                 END  
