!23456789==============================================================!
            Program makeGro
               implicit none
               integer Nc,Na,maxr
               parameter (Nc=1,maxr=56,Na=1051)
               integer Nr(Nc),Nar(maxr,Nc)
               integer i,j,k,ca,ic,kr,c1,fp,fpc(Nc)
               double precision x,y,z,Lx,Ly,Lz,pi,xo,yo,zo
                parameter (pi =  3.141592653589793d0)
               character*6 comment, resnam, atom
               character*32 filename,chainname(Nc)
               Lx = 16.d0
               Ly = 16.d0 
               Lz = 16.d0 
               Nr(1) = maxr !no of residues in chain-1
               fpc(1) = 61 !file pointer for chain-1
!======================================================================!
                fp = 51
               open(21,file='glycan.gro')

               write(21,'(a)') 'glycan chain in water'
               write(21,*) Na 

              open(11,file='allchains.tex',status='old')
               do ic=1,Nc
                  read(11,*) chainname(ic) 
               enddo
              close(11)
               ca = 0
              do ic = 1,Nc       
                  c1 = 0
               open(fpc(ic),file=chainname(ic))
                do kr=1,Nr(ic)   
                     read(fpc(ic),*) filename
                     include 'Read_residue.f' 
                     ca = ca + Nar(kr,ic)
                enddo 
                 close(fpc(ic))
              enddo  
                 write(21,*) Lx, Ly, Lz
               close(21)
               End Program
!=====================================================================!
