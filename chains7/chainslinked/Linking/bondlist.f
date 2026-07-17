!======================================================================!
             open(41,file='newallchains.tex',status='old')
             open(25,file='newbonds.dat') !this is what we want

             cn = 0
             co = 0
             c = 0
              flg(:) = 0
              D(:) = 0  
             do kc=1,Nc  
               read(41,*) filename
               call findmaxrows(filename,rc)
                rc  = rc/4 !because it has atomlabels,bonds,improper,restr
               open(fp,file=filename)
               do k=1,rc
                 read(fp,*) res
                 call get_atom_number(res,Nar,res2)
                 cn = cn + Nar
                 co = co + Nar
               if(trim(res).eq.'atomlabels_LYS_linked.dat')then
                 inew = cn-3  !to catch NZ from total. ie atom-i for NZ 
                 co = co+2    !because LYS_residue becomes LYS_linked
                 iold = co-5 
                        !---------------find Bonding Information-------!
                        include 'rectify_bonds.f'
                        if(D(inew).ne.0)then
                          write(25,*) inew+3+34,D(inew) !save as GLY->DAL
                        endif
                 co = co - 35
               elseif(trim(res).eq.'atomlabels_LYS_bridge.dat')then
                 inew = cn-3  !to catch NZ from total. ie atom-i for NZ 
                 co = co+2 !because LYS_residue becomes LYS_bridge
                 iold = co-5
                            !there is no cross-bonding---!
                 co = co-37 !addition of pentaglycin bridge 
                     !----------------------------------------------!
               elseif(trim(res).eq.'atomlabels_DAL_linked.dat')then
                 inew = cn-1 !because DAL_residue becomes DAL_linked 
                 iold = co-1
                 co = co+11  !because next DAL.dat was deleted 
                        !--------find Bonding Information-------!
                        include 'rectify_bonds.f'
                        if(D(inew).ne.0)then
                           write(25,*) D(inew)+3+34,inew !save GLY->DAL
                        endif
                        !----------------------------------------------!
               endif
              enddo   
               close(fp)
                 write(27,*)'Report: no of atoms in chain',kc,'is=',cn-c
                 c = cn
             enddo
                 write(27,*) 'total atoms =', cn  
               close(41)   
               close(25)
               close(27)
!======================================================================!
