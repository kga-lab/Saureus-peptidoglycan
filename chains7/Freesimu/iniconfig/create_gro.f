!23456789==============================================================!
            Program makeGro
               implicit none
               integer Nc,Na,maxr,Nr,Nar
               parameter (Nc=7,Na=11921)
               integer i,j,k,ca,ic,kr,c1,fp,fpc,jc
               double precision x,y,z,Lx,Ly,Lz,pi,xo,yo,zo
               double precision vs(Nc),ym,xm,ys,ysn,theta
                parameter (pi =  3.141592653589793d0)
               character*6 comment, resnam, atom
               character*32 filename,chainname
               Lx = 14.d0
               Ly = 14.d0 
               Lz = 12.d0 
               ym = 3.8d0
               xm = -2.d0
!======================================================================!
              open(11,file='allchains.tex')
              open(12,file='chainlayout.dat') 


                fp = 51
                fpc =52
               open(21,file='glycan.gro')
               write(21,'(a)') 'glycan chain in water'
               write(21,*) Na 
               ca = 0
               do ic = 1,Nc       
                  read(12,*) jc,vs(jc)
                  read(11,*) chainname !List_chain1.tex,...
                  call findmaxrows(chainname,Nr)
                  c1 = 0
                  theta = 0
               open(fpc,file=chainname)
                if(vs(ic).eq.0.d0)xm=xm+2.d0
                do kr=1,Nr   
                     read(fpc,*) filename !iniconf_FA,...
                     include 'Read_residue.f' 
                     ca = ca + Nar
                     theta = theta + (pi/3.d0)
                enddo 
                    ym = y
                 close(fpc)
              enddo  
                 write(21,*) Lx, Ly, Lz
               close(21)
               End Program
!=====================================================================!
               include 'findmaxrows.f'
