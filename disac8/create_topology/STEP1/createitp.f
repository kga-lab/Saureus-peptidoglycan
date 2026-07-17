!23456789---------------------------------------------------------------!
              Program mycreateitp
               implicit none
                integer Na,Nb,Nc,maxr
                parameter(Nc=1,maxr=100,Na=1051) !OK
                integer Nr(Nc),Nar(maxr,Nc),Nbr(maxr,Nc)
                integer B(Na,Na),bb(4),P(Na,Na)   
                integer i,j,k,l,m,i1,j1,k1,i2,j2,k2,l2,ii,jj
                integer ic,kr,cr,c,ca,fjp,sum1,sn
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
                 Nr(1) = 56
                 fpc(1) = 61  !file pointer 
!======================================================================
!NOTE: Na = no of atom in the molecule
!      Nb = no of bonds in the molecule
!      Nr = no of residues to be read and written to make a molecule
!=======================================================================
               include'fileopen.f'
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
