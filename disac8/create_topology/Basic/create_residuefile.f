!======================================================================!
            Program residuefile
              implicit none
              integer i,Nr,N,cr
              parameter (Nr = 8) ! no of a pair of NAG-NAM
!=======================================================================!
!NOTE: This pgm is to create a residuefile listing in sequence all the residues  constituting a molecule. For example, NAG-NAM-NAG-NAM----------NAG-NAM
!                                            |       |                |
!                                            ALA     ALA              ALA
!                                            |       |                |
!                                            GLN     GLN              GLN
!                                            |       |                |
!                                            LYS     LYS              LYS
!                                            |       |                |
!                                            DAL     DAL              DAL
!                                            |       |                |
!                                            DAL     DAL              DAL       !=======================================================================!
              open(22, file='residues_chain1.tex')
           
            !----------atomlabels--files-------------------!
                 write(22,'(a)') 'atomlabels_LeftNAG.dat'
                  N = 28
                  cr = 1
              do i=1,Nr-1
                 write(22,'(a)') 'atomlabels_NAM_residue.dat'
                 write(22,'(a)') 'atomlabels_ALA_residue.dat'
                 write(22,'(a)') 'atomlabels_GLN_residue.dat'
                 write(22,'(a)') 'atomlabels_LYS_residue.dat'
                 write(22,'(a)') 'atomlabels_DAL_residue.dat'
                 write(22,'(a)') 'atomlabels_DAL.dat'
                 write(22,'(a)') 'atomlabels_NAG_residue.dat'
                 N = N+34+10+17+22+10+11+27
                 cr = cr + 7
              enddo
                 write(22,'(a)') 'atomlabels_RightNAM.dat'
                 write(22,'(a)') 'atomlabels_ALA_residue.dat'
                 write(22,'(a)') 'atomlabels_GLN_residue.dat'
                 write(22,'(a)') 'atomlabels_LYS_residue.dat'
                 write(22,'(a)') 'atomlabels_DAL_residue.dat'
                 write(22,'(a)') 'atomlabels_DAL.dat'
                   N = N+36+10+17+22+10+11 
                   cr = cr + 6
                 write(*,*) 'total atoms N=',N
                 write(*,*) 'total residues=', cr
            !----------bonds--files-------------------!
                 write(22,'(a)') 'bonds_LeftNAG.dat'
              do i=1,Nr-1
                 write(22,'(a)') 'bonds_NAM_residue.dat'
                 write(22,'(a)') 'bonds_ALA_residue.dat'
                 write(22,'(a)') 'bonds_GLN_residue.dat'
                 write(22,'(a)') 'bonds_LYS_residue.dat'
                 write(22,'(a)') 'bonds_DAL_residue.dat'
                 write(22,'(a)') 'bonds_DAL.dat'
                 write(22,'(a)') 'bonds_NAG_residue.dat'
              enddo
                 write(22,'(a)') 'bonds_RightNAM.dat'
                 write(22,'(a)') 'bonds_ALA_residue.dat'
                 write(22,'(a)') 'bonds_GLN_residue.dat'
                 write(22,'(a)') 'bonds_LYS_residue.dat'
                 write(22,'(a)') 'bonds_DAL_residue.dat'
                 write(22,'(a)') 'bonds_DAL.dat'

             !---------improper--files-------------------!
                 write(22,'(a)') 'improper_LeftNAG.dat'
              do i=1,Nr-1
                 write(22,'(a)') 'improper_NAM_residue.dat'
                 write(22,'(a)') 'improper_ALA_residue.dat'
                 write(22,'(a)') 'improper_GLN_residue.dat'
                 write(22,'(a)') 'improper_LYS_residue.dat'
                 write(22,'(a)') 'improper_DAL_residue.dat'
                 write(22,'(a)') 'improper_DAL.dat'
                 write(22,'(a)') 'improper_NAG_residue.dat'
              enddo
                 write(22,'(a)') 'improper_RightNAM.dat'
                 write(22,'(a)') 'improper_ALA_residue.dat'
                 write(22,'(a)') 'improper_GLN_residue.dat'
                 write(22,'(a)') 'improper_LYS_residue.dat'
                 write(22,'(a)') 'improper_DAL_residue.dat'
                 write(22,'(a)') 'improper_DAL.dat'
             !----------restraints--files----------------!
                 write(22,'(a)') 'rest_LeftNAG.dat'
              do i=1,Nr-1
                 write(22,'(a)') 'rest_NAM_residue.dat'
                 write(22,'(a)') 'rest_ALA_residue.dat'
                 write(22,'(a)') 'rest_GLN_residue.dat'
                 write(22,'(a)') 'rest_LYS_residue.dat'
                 write(22,'(a)') 'rest_DAL_residue.dat'
                 write(22,'(a)') 'rest_DAL.dat'
                 write(22,'(a)') 'rest_NAG_residue.dat'
              enddo
                 write(22,'(a)') 'rest_RightNAM.dat'
                 write(22,'(a)') 'rest_ALA_residue.dat'
                 write(22,'(a)') 'rest_GLN_residue.dat'
                 write(22,'(a)') 'rest_LYS_residue.dat'
                 write(22,'(a)') 'rest_DAL_residue.dat'
                 write(22,'(a)') 'rest_DAL.dat'
             !--------------------------------------------!
                 close(22)
                 End Program
!======================================================================!
