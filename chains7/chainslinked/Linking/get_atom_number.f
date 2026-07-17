!===============================================================!
             SUBROUTINE get_atom_number(res,n,res2)
                 implicit none
                 integer n
                 character*32 res
                 character*6 res2
!===============================================================!
              if(trim(res).eq.'atomlabels_LeftNAG_linked.dat')then
                   n = 27
                   res2 = 'NAG'
              elseif(trim(res).eq.'atomlabels_LeftNAG.dat')then
                   n = 28
                   res2 = 'NAG'
              elseif(trim(res).eq.'atomlabels_NAG_residue.dat')then
                   n = 27 
                   res2 = 'NAG'
              elseif(trim(res).eq.'atomlabels_NAM_residue.dat')then
                   n = 34
                   res2 = 'NAM'
              elseif(trim(res).eq.'atomlabels_RightNAM.dat')then
                   n = 36  !for reducing ternimal 
                   res2 = 'NAM'
              elseif(trim(res).eq.'atomlabels_ALA_residue.dat')then
                   n = 10
                   res2 = 'ALA'
              elseif(trim(res).eq.'atomlabels_GLN_residue.dat')then
                   n = 17
                   res2 = 'GLN'
              elseif(trim(res).eq.'atomlabels_LYS_residue.dat')then
                   n = 22
                   res2 = 'LYS'
              elseif(trim(res).eq.'atomlabels_DAL_residue.dat')then
                   n = 10
                   res2 = 'DAL'
              elseif(trim(res).eq.'atomlabels_DAL.dat')then
                   n = 11
                   res2 = 'DAL'
              elseif(trim(res).eq.'atomlabels_LYS_linked.dat')then
                   n = 20
                   res2 = 'LYS'
              elseif(trim(res).eq.'atomlabels_LYS_bridge.dat')then
                   n = 20
                   res2 = 'LYS'
              elseif(trim(res).eq.'atomlabels_DAL_linked.dat')then
                   n = 10
                   res2 = 'DAL'
              elseif(trim(res).eq.'atomlabels_GLY_residue.dat')then
                   n = 7
                   res2 = 'GLY'
              elseif(trim(res).eq.'atomlabels_GLY_linked.dat')then
                   n = 7
                   res2 = 'GLY'
              elseif(trim(res).eq.'atomlabels_GLY_bridge.dat')then
                   n = 9
                   res2 = 'GLY'
            elseif(trim(res).eq.'atomlabels_RightNAM_linked.dat')then
                   n = 34
                  res2 = 'NAM'
              endif
              END SUBROUTINE
!====================================================================!
