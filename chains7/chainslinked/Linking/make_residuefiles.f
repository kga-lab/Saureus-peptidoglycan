!==================================================================!
              open(41,file='allchains.tex',status='old') 
              fp = 51    
               !--------Read the old residues for every chain ----!
             do kc=1,Nc
                read(41,*) filename
               call findmaxrows(filename,rc)
                rc  = rc/4 !because it has atomlabels,bonds,improper,restr
                open(fp,file=filename) 
                do k=1,rc
                   read(fp,*) atomlabels(k,kc)
                enddo
                do k=1,rc
                   read(fp,*) bonds(k,kc)
                enddo
                do k=1,rc
                   read(fp,*) impro(k,kc)
                enddo
                do k=1,rc
                   read(fp,*) rest(k,kc)
                enddo
                 close(fp)
                 Nr(kc) = rc
            enddo 
             close(41)
             !------------make changes--------------------!
               open(24,file='selectedcontacts_chosen.dat') !selectedcontacts.dat (Final_shorted is my chosen from selectedcontacts which is obtained by first running the code with selectedcontacts.dat as input here) and see below *cs* 
                cs = 29 ! MANUALLY SELECTED WHEN ABOVE FILE IS Final_shorted.dat, otherwise delete this line
              do l=1,cs
                 read(24,*)i,ic,j,jc,fr,cindex 
                  B(i) = j
                  B(j) = i  
                    sc1 = 0
                    do kc=1,ic-1
                      sc1 = sc1 + Nr(kc)
                    enddo 
                    sc2 = 0
                    do kc=1,jc-1
                      sc2 = sc2 + Nr(kc)
                    enddo
                 if(trim(resnam(i)).eq.'LYS')then
                     cr1 = cr(i)-sc1  !LYS
                     cr2 = cr(j)-sc2  !DAL
                     kc1 = ic         !LYS
                     kc2 = jc         !DAL
                 else
                     cr1 = cr(j)-sc2  !LYS
                     cr2 = cr(i)-sc1  !DAL
                     kc1 = jc         !LYS
                     kc2 = ic         !DAL
                 endif
                if(cindex.eq.1) then  !cross-linking
                 atomlabels(cr1,kc1) = 'atomlabels_LYS_linked.dat'
                 bonds(cr1,kc1)      = 'bonds_LYS_linked.dat'
                 impro(cr1,kc1)      = 'improper_LYS_linked.dat'
                 rest(cr1,kc1)       = 'rest_LYS_linked.dat'
                 atomlabels(cr2,kc2) = 'atomlabels_DAL_linked.dat'     
                 bonds(cr2,kc2)      = 'bonds_DAL_linked.dat'
                 impro(cr2,kc2)      = 'improper_DAL_linked.dat'
                 rest(cr2,kc2)       = 'rest_DAL_linked.dat'
                else                  !only handing bridge
                 atomlabels(cr1,kc1) = 'atomlabels_LYS_bridge.dat'
                 bonds(cr1,kc1)      = 'bonds_LYS_bridge.dat'
                 impro(cr1,kc1)      = 'improper_LYS_bridge.dat'
                 rest(cr1,kc1)       = 'rest_LYS_bridge.dat'
                 atomlabels(cr2,kc2) = 'atomlabels_DAL_residue.dat'
                 bonds(cr2,kc2)      = 'bonds_DAL_residue.dat'
                 impro(cr2,kc2)      = 'improper_DAL_residue.dat'
                 rest(cr2,kc2)       = 'rest_DAL_residue.dat'
                endif
              enddo!l
             !-----------write--as newresidues_chain-----------------!
           open(41,file='allchains.tex',status='old')
              
           do kc=1,Nc
            read(41,*) filename
            open(fp,file='new'//trim(filename)) !create new in current folder 

            write(fp,'(a)') atomlabels(1,kc)
              c = 1
            do k=2,Nr(kc)
             if(trim(atomlabels(k-1,kc)).eq.'atomlabels_LYS_linked.dat')
     +        then
                  do i5=1,4
                write(fp,'(a)') 'atomlabels_GLY_residue.dat'
                   c=c+1
                  enddo
                write(fp,'(a)') 'atomlabels_GLY_linked.dat'
                   c=c+1
             elseif(trim(atomlabels(k-1,kc)).eq.
     +                  'atomlabels_LYS_bridge.dat')then
                   do i5=1,4
                write(fp,'(a)') 'atomlabels_GLY_residue.dat'
                   c=c+1
                  enddo
                  write(fp,'(a)') 'atomlabels_GLY_bridge.dat'
                   c=c+1
             endif
            if(trim(atomlabels(k-1,kc)).ne.'atomlabels_DAL_linked.dat')
     +            then
                  write(fp,'(a)') atomlabels(k,kc) 
                  c = c + 1
            endif
            enddo
                 write(27,*)'Report: chain',kc,'has now residues = ',c
                 write(28,*) kc,c

            write(fp,'(a)') bonds(1,kc)
            do k=2,Nr(kc)
              if(trim(bonds(k-1,kc)).eq.'bonds_LYS_linked.dat')
     +           then
                  do i5=1,4
                   write(fp,'(a)') 'bonds_GLY_residue.dat'
                  enddo
                   write(fp,'(a)') 'bonds_GLY_linked.dat'
              elseif(trim(bonds(k-1,kc)).eq.'bonds_LYS_bridge.dat')then 
                  do i5=1,4
                   write(fp,'(a)') 'bonds_GLY_residue.dat'
                  enddo
                   write(fp,'(a)') 'bonds_GLY_bridge.dat'
             endif
             if(trim(bonds(k-1,kc)).ne.'bonds_DAL_linked.dat')
     +            then
                  write(fp,'(a)') bonds(k,kc)
             endif
            enddo

            write(fp,'(a)') impro(1,kc)
            do k=2,Nr(kc)
              if(trim(impro(k-1,kc)).eq.'improper_LYS_linked.dat')
     +           then
                  do i5=1,4
                   write(fp,'(a)') 'improper_GLY_residue.dat'
                  enddo
                   write(fp,'(a)') 'improper_GLY_linked.dat'
              elseif(trim(impro(k-1,kc)).eq.'improper_LYS_bridge.dat')
     +              then
                  do i5=1,4
                   write(fp,'(a)') 'improper_GLY_residue.dat'
                  enddo
                   write(fp,'(a)') 'improper_GLY_bridge.dat'
              endif
              if(trim(impro(k-1,kc)).ne.'improper_DAL_linked.dat')
     +            then
                  write(fp,'(a)') impro(k,kc)
            endif
            enddo

            write(fp,'(a)') rest(1,kc)
            do k=2,Nr(kc)
              if(trim(rest(k-1,kc)).eq.'rest_LYS_linked.dat')
     +           then
                  do i5=1,4
                   write(fp,'(a)') 'rest_GLY_residue.dat'
                  enddo
                   write(fp,'(a)') 'rest_GLY_linked.dat'
              elseif(trim(rest(k-1,kc)).eq.'rest_LYS_bridge.dat')then
                  do i5=1,4
                   write(fp,'(a)') 'rest_GLY_residue.dat'
                  enddo
                   write(fp,'(a)') 'rest_GLY_bridge.dat'
              endif
              if(trim(rest(k-1,kc)).ne.'rest_DAL_linked.dat')then
                  write(fp,'(a)') rest(k,kc)
              endif
            enddo
              close(fp)
          enddo!kc
             close(41)
             close(28)
!==================================================================!
