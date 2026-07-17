!======================================================================!
            Program residuefile
              implicit none
              integer Nc
              parameter (Nc=7)
              integer i,j,ic,Nr(Nc),N,cr,Na,crt
              integer flag_nag(Nc),flag_nam(Nc)
              character*32 fname22,comment
                 flag_nag(:) = 0
                 flag_nam(:) = 0

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
!                                            DAL     DAL              DAL
!=======================================================================!
               open(11,file='number_disaccharide.tex')
               open(12,file='NAG_NAM_periodiclinks.tex')
               open(24,file='allchains.tex')
               open(23,file='number_residues.tex') !chainwise no of residues
                 N = 0
                 crt = 0

             !------Read which chains are pbc linked for NAG-NAM------!
                read(12,*) comment
                do
                  read(12,*,end=100) i, j
                  flag_nag(i) = 1
                  flag_nam(j) = 1
                 enddo
 100             close(12)

              do ic=1,Nc
                write(fname22,fmt='(a,i0,a)') 'residues_chain',ic,'.tex'
                open(22, file=fname22)
                write(24,'(a)') fname22
            !----------atomlabels--files-------------------!
                if(flag_nag(ic).eq.1)then
                  write(22,'(a)') 'atomlabels_LeftNAG_linked.dat'
                  Na = 27
                else
                 write(22,'(a)') 'atomlabels_LeftNAG.dat'
                  Na = 28
                endif
                  cr = 1
                 read(11,*) j, Nr(ic) !no of disaccharide in chain ic
              do i=1,Nr(ic)-1
                 write(22,'(a)') 'atomlabels_NAM_residue.dat'
                 write(22,'(a)') 'atomlabels_ALA_residue.dat'
                 write(22,'(a)') 'atomlabels_GLN_residue.dat'
                 write(22,'(a)') 'atomlabels_LYS_residue.dat'
                 write(22,'(a)') 'atomlabels_DAL_residue.dat'
                 write(22,'(a)') 'atomlabels_DAL.dat'
                 write(22,'(a)') 'atomlabels_NAG_residue.dat'
                 Na = Na+34+10+17+22+10+11+27
                 cr = cr + 7
              enddo
                if(flag_nam(ic).eq.1)then
                 write(22,'(a)') 'atomlabels_RightNAM_linked.dat'
                  Na=Na+34
                 else
                  write(22,'(a)') 'atomlabels_RightNAM.dat'
                  Na=Na+36
                 endif
                 write(22,'(a)') 'atomlabels_ALA_residue.dat'
                 write(22,'(a)') 'atomlabels_GLN_residue.dat'
                 write(22,'(a)') 'atomlabels_LYS_residue.dat'
                 write(22,'(a)') 'atomlabels_DAL_residue.dat'
                 write(22,'(a)') 'atomlabels_DAL.dat'
                   Na = Na+10+17+22+10+11 
                   cr = cr + 6 !OK
            !----------bonds--files-------------------!
                 if(flag_nag(ic).eq.1)then
                  write(22,'(a)') 'bonds_LeftNAG_linked.dat'
                 else
                  write(22,'(a)') 'bonds_LeftNAG.dat'
                 endif

              do i=1,Nr(ic)-1
                 write(22,'(a)') 'bonds_NAM_residue.dat'
                 write(22,'(a)') 'bonds_ALA_residue.dat'
                 write(22,'(a)') 'bonds_GLN_residue.dat'
                 write(22,'(a)') 'bonds_LYS_residue.dat'
                 write(22,'(a)') 'bonds_DAL_residue.dat'
                 write(22,'(a)') 'bonds_DAL.dat'
                 write(22,'(a)') 'bonds_NAG_residue.dat'
              enddo
                if(flag_nam(ic).eq.1)then
                  write(22,'(a)') 'bonds_RightNAM_linked.dat'
                else
                 write(22,'(a)') 'bonds_RightNAM.dat'
                endif

                 write(22,'(a)') 'bonds_ALA_residue.dat'
                 write(22,'(a)') 'bonds_GLN_residue.dat'
                 write(22,'(a)') 'bonds_LYS_residue.dat'
                 write(22,'(a)') 'bonds_DAL_residue.dat'
                 write(22,'(a)') 'bonds_DAL.dat'

             !---------improper--files-------------------!
                if(flag_nag(ic).eq.1)then
                  write(22,'(a)') 'improper_LeftNAG_linked.dat'
                else
                   write(22,'(a)') 'improper_LeftNAG.dat'
                endif
              do i=1,Nr(ic)-1
                 write(22,'(a)') 'improper_NAM_residue.dat'
                 write(22,'(a)') 'improper_ALA_residue.dat'
                 write(22,'(a)') 'improper_GLN_residue.dat'
                 write(22,'(a)') 'improper_LYS_residue.dat'
                 write(22,'(a)') 'improper_DAL_residue.dat'
                 write(22,'(a)') 'improper_DAL.dat'
                 write(22,'(a)') 'improper_NAG_residue.dat'
              enddo
                if(flag_nam(ic).eq.1)then
                  write(22,'(a)') 'improper_RightNAM_linked.dat'
                else
                  write(22,'(a)') 'improper_RightNAM.dat'
                endif
                 write(22,'(a)') 'improper_ALA_residue.dat'
                 write(22,'(a)') 'improper_GLN_residue.dat'
                 write(22,'(a)') 'improper_LYS_residue.dat'
                 write(22,'(a)') 'improper_DAL_residue.dat'
                 write(22,'(a)') 'improper_DAL.dat'
             !----------restraints--files----------------!
                 if(flag_nag(ic).eq.1)then
                    write(22,'(a)') 'rest_LeftNAG_linked.dat'
                 else
                    write(22,'(a)') 'rest_LeftNAG.dat'
                 endif
              do i=1,Nr(ic)-1
                 write(22,'(a)') 'rest_NAM_residue.dat'
                 write(22,'(a)') 'rest_ALA_residue.dat'
                 write(22,'(a)') 'rest_GLN_residue.dat'
                 write(22,'(a)') 'rest_LYS_residue.dat'
                 write(22,'(a)') 'rest_DAL_residue.dat'
                 write(22,'(a)') 'rest_DAL.dat'
                 write(22,'(a)') 'rest_NAG_residue.dat'
              enddo
                 if(flag_nam(ic).eq.1)then
                    write(22,'(a)') 'rest_RightNAM_linked.dat'
                 else
                    write(22,'(a)') 'rest_RightNAM.dat'
                 endif
                 write(22,'(a)') 'rest_ALA_residue.dat'
                 write(22,'(a)') 'rest_GLN_residue.dat'
                 write(22,'(a)') 'rest_LYS_residue.dat'
                 write(22,'(a)') 'rest_DAL_residue.dat'
                 write(22,'(a)') 'rest_DAL.dat'
             !--------------------------------------------!
                 close(22)
                  N = N + Na
                  crt = crt + cr
                  write(23,*) ic, cr !no of residues in every chain
              enddo!ic
                  write(*,*) 'total atoms=',N
                  write(*,*) 'total residues=',crt    
                 close(23)
                 close(24)
                 close(11)
                 close(12)
                 End Program
!======================================================================!
