!23456789---------------------------------------------------------------!
              Program mycreateitp
               implicit none
                integer Na,Nb,Nc,maxr
                parameter(Nc=7,maxr=91,Na=11921)
                integer Nr(Nc),Nar(maxr,Nc),Nbr(maxr,Nc)
                integer B(Na,Na),bb(4),P(Na,Na)   
                integer i,j,k,l,m,i1,j1,k1,i2,j2,k2,l2,ii,jj
                integer ic,kr,cr,c,ca,fjp,sum1,sn,jc
                integer fpc(Nc),fp
                integer flag,flag2
                double precision q,qt,mass
                character*6 atom(Na),atomtype(Na),resnam(maxr,Nc)
                character*32, molname,filename,pathi,patho,chainname(Nc)
                character*32, bondfile(maxr,Nc),improfile(maxr,Nc)
                character*32, restname(maxr,Nc)
                character*6 comment,fcx,fcy,fcz
!---------------------FURTHER INPUTS-----------------!                 
                 molname = 'glycan' !Give name of the molecule here
                 pathi = 'inputs/'
                 patho = 'outputs/'
                include'fileopen.f'

                 do i=1,Nc
                 read(12,*) ic,Nr(i)
                 fpc(i) = i+100  !file pointers 
                 enddo
!======================================================================
!NOTE: Na = no of atom in the molecule
!      Nb = no of bonds in the molecule
!      Nr = no of residues to be read and written to make a molecule
!=======================================================================
             fp = 51
          !-----------WELCOME----------------------!
              include 'welcome.f'
              include 'atomlabels.f'
              include 'bonds.f'          
              include 'pairs.f'
              include 'angles.f'
              include 'dihedrals.f'
              include 'improper.f'
              include 'cmap.f'
              include 'restraints.f'
              include 'fileclose.f'
              END PROGRAM
!====================================================================!   
              include 'findmaxrows.f'
