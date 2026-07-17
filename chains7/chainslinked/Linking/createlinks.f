!23456789--------------------------------------------------------------!
          PROGRAM create_links
             implicit none
             integer Nc,Na,maxr,Nmax
             parameter(Nc=7,maxr=91,Na=11921,Nmax=Na+2000)
             integer Nr(Nc),rc,kc,kc1,kc2,cr1,cr2,sc1,sc2,fs(Na)
             integer fsr(maxr*Nc)
             integer i,j,k,l,ic,jc,ic2,i2,j2,jc2,maxit,r1,r2,c,k1,k2
             integer i5,ite,flag2,cindex
             integer cr(Na),cp,A(100,Nc),cpmax(Nc),crpi(100),crpj(100)
         integer ip,jp,tc,fr,flag,tc2,frmin,B(Nmax),D(Nmax),cs,fp,fp2
         integer iold,inew,flg(Nmax),co,cn,Nar,Smin,S2,S(100,2),kmin
             parameter (maxit=400,frmin=50)
             double precision x(Na),y(Na),z(Na),rx,ry,rz,rij,rmin
             double precision xo,yo,zo,xp,yp,zp,Lx,Ly,Lz
            character*6 atom(Na),atomtype(Na),resnam(Na),res2,res3,atom2
            character*32 filename,res,dummy,pres

            character*32 atomlabels(maxr,Nc),bonds(maxr,Nc)
            character*32 impro(maxr,Nc),rest(maxr,Nc)
               rmin = 0.85d0
!=======================================================================!
!INPUTS ARE: Nc = no of chains, 
!            Na=  total no of atoms.
!            atominfo file (taken from STEP1 of free-chain simulation)
!            traj_glycan.gro trajectory file to be used for calculating contacts
!             (from free-chain simulation)
!             allchains.tex,residues_chain1.tex,residues_chain2.tex etc  
!filepts used: 11,12,13,14,21,22,23,24,25,26,27,28,31,41,51
!=======================================================================!
            open(12,file='traj_glycan.gro',status='old')
            open(27,file='newreport.tex') !newfile
            open(28,file='number_residues.tex') !newfile

                include 'get_chaininfo.f'  
                open(21,file='contacts.dat') !new file
                open(22,file='contacts2.dat')!new file
                 tc = 0
            do ite=1,maxit
               read(12,*) dummy
               read(12,*) dummy 
             do i=1,Na
              read(12,'(a8,a7,i6,3f8.3)') res3,atom2,j,x(i),y(i),z(i)
             enddo
               read(12,*) Lx,Ly,Lz
               include 'closecontacts.f'
               write(*,*) ite
           enddo 
                close(21)
                close(22)
                include 'compute_frequency.f'
                include 'select_links.f' 
                include 'make_residuefiles.f'
                include 'bondlist.f'
                include 'ascend_ordering.f' 
                include 'makegro.f'
                 END PROGRAM
!======================================================================!
               include 'findmaxrows.f'
               include 'get_atom_number.f'
