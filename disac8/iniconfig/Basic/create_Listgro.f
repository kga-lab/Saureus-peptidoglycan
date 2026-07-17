!======================================================================!
            Program residuefile
              implicit none
              integer i,Nr,N,cr
              parameter (Nr = 8) ! no of a pair of NAG-NAM
!=======================================================================!
!NOTE: This pgm is to create a residuefile listing in sequence all the residues  constituting a molecule. For example, NAG-NAM-NAG-NAM----------NAG-NAM
!          |       |                |
!          ALA     ALA              ALA
!          |       |                |
!          GLN     GLN              GLN
!          |       |                |
!          LYS     LYS              LYS
!          |       |                |
!          DAL     DAL              DAL
!          |       |                |
!          DAL     DAL              DAL
!=======================================================================!
              open(22, file='List_chain1.tex')
           
            !-----------files for iniconfi-------------------!
                        write(22,'(a)') 'iniconf_LeftNAG.gro'
                        write(22,'(a)') 'iniconf_NAM_residue.gro'
                        write(22,'(a)') 'iniconf_ALA_residue.gro'
                        write(22,'(a)') 'iniconf_GLN_residue.gro'
                        write(22,'(a)') 'iniconf_LYS_residue.gro'
                        write(22,'(a)') 'iniconf_DAL_residue.gro'
                        write(22,'(a)') 'iniconf_DAL.gro'
                        N = 28+34+10+17+22+10+11
                        cr = 7
               do i=2,Nr-1
                    if(mod(i,2).eq.0)then
                        write(22,'(a)') 'iniconf_NAG_residue_rot.gro'
                        write(22,'(a)') 'iniconf_NAM_residue_rot.gro'
                        write(22,'(a)') 'iniconf_ALA_residue_rot.gro'
                        write(22,'(a)') 'iniconf_GLN_residue_rot.gro'
                        write(22,'(a)') 'iniconf_LYS_residue_rot.gro'
                        write(22,'(a)') 'iniconf_DAL_residue_rot.gro'
                        write(22,'(a)') 'iniconf_DAL_rot.gro'
                        N = N+27+34+10+17+22+10+11
                        cr = cr+7
                     else
                        write(22,'(a)') 'iniconf_NAG_residue.gro'
                        write(22,'(a)') 'iniconf_NAM_residue.gro'
                        write(22,'(a)') 'iniconf_ALA_residue.gro'
                        write(22,'(a)') 'iniconf_GLN_residue.gro'
                        write(22,'(a)') 'iniconf_LYS_residue.gro'
                        write(22,'(a)') 'iniconf_DAL_residue.gro'
                        write(22,'(a)') 'iniconf_DAL.gro'
                        N  = N+27+34+10+17+22+10+11
                        cr = cr+7
                     endif
               enddo
                 if(mod(Nr,2).eq.0)then
                    write(22,'(a)') 'iniconf_NAG_residue_rot.gro'
                    write(22,'(a)') 'iniconf_RightNAM_rot.gro'
                    write(22,'(a)') 'iniconf_ALA_residue_rot.gro'
                    write(22,'(a)') 'iniconf_GLN_residue_rot.gro'
                    write(22,'(a)') 'iniconf_LYS_residue_rot.gro'
                    write(22,'(a)') 'iniconf_DAL_residue_rot.gro'
                    write(22,'(a)') 'iniconf_DAL_rot.gro'
                    N  = N+27+36+10+17+22+10+11
                    cr = cr+7
                  else
                    write(22,'(a)') 'iniconf_NAG_residue.gro'
                    write(22,'(a)') 'iniconf_RightNAM.gro'
                    write(22,'(a)') 'iniconf_ALA_residue.gro'
                    write(22,'(a)') 'iniconf_GLN_residue.gro'
                    write(22,'(a)') 'iniconf_LYS_residue.gro'
                    write(22,'(a)') 'iniconf_DAL_residue.gro'
                    write(22,'(a)') 'iniconf_DAL.gro'
                    N  = N+27+36+10+17+22+10+11
                    cr = cr+7
                  endif
                 write(*,*) 'total atoms N=',N
                 write(*,*) 'total residues=', cr
                 close(22)
                 End Program
!======================================================================!
