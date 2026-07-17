!======================================================================!
            Program residuefile
              implicit none
              integer Nc
              parameter (Nc=7)
              integer i,j,ic,Nr(Nc),cr,crt,Na,N
              integer flag_nag(Nc),flag_nam(Nc)

              character*32 fname22,comment
                 flag_nag(:) = 0
                 flag_nam(:) = 0

!=======================================================================!
!NOTE: This pgm is to create a residuefile listing in sequence all the residues  constituting a molecule. For example,                                      NAG-NAM-NAG-NAM----------NAG-NAM
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
             open(11,file='number_disaccharide.tex') !input
             open(12,file='NAG_NAM_periodiclinks.tex')
             open(23,file='report.tex')
             open(24,file='allchains.tex') 

             !------Read which chains are pbc linked for NAG-NAM------!
                read(12,*) comment
                do
                  read(12,*,end=100) i, j
                  flag_nag(i) = 1
                  flag_nam(j) = 1
                 enddo
 100             close(12)

                N = 0
                crt = 0
             do ic=1,Nc


              write(fname22,fmt='(a,i0,a)') 'List_chain',ic,'.tex'    
              open(22, file=fname22)
              write(24,'(a)') fname22
            !-----------files for iniconfi-------------------!
               if(flag_nag(ic).eq.1)then
                  write(22,'(a)') 'iniconf_FApbc.gro'
                  Na = 27+34+10+17+22+10+11
               else
                  write(22,'(a)') 'iniconf_FA.gro'
                  Na = 28+34+10+17+22+10+11
               endif
                  cr = 7
                read(11,*) j,Nr(ic) !no of disaccharide in chain ic
               do i=2,Nr(ic)-1
                        write(22,'(a)') 'iniconf_FB.gro'
                        Na = Na+27+34+10+17+22+10+11
                        cr = cr+7
               enddo
               if(flag_nam(ic).eq.1)then
                  write(22,'(a)') 'iniconf_FCpbc.gro'
                  Na = Na+27+34+10+17+22+10+11
               else
                  write(22,'(a)') 'iniconf_FC.gro'
                  Na = Na+27+36+10+17+22+10+11
               endif
                  cr = cr+7
                 write(23,*) 'total atoms in chain',ic, 'is',Na
                 write(23,*) 'total residues in chain',ic,'is', cr
                   N = N + Na
                   crt = crt + cr
                 close(22)
            enddo!ic 
                 write(23,*) 'total atoms',N
                 write(23,*) 'total residues', crt
                 close(22)
                 close(23)
                 close(24)
                 close(11)
                 close(12)
                 End Program
!======================================================================!
