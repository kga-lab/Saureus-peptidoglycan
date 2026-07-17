!============================================================================
          if(trim(resnam(kr,ic)) .ne. 'NAG') then !NAM->NAG; NAM->ALA; AA->AA
             !----------Glycosidic-Linkage----NAM -> NAG----------!
             if(jj.eq.-2) then
                 flag2 = 0
                 fjp = 0  !file jump
                 sum1 = 0
               do while(flag2.eq.0)
                  fjp = fjp + 1  
                  sum1 = sum1 + Nar(kr-1+fjp,ic)
               if(bondfile(kr+fjp,ic).eq.'bonds_NAG_residue.dat')flag2=1
               enddo
                 open(77,file=trim(adjustl(pathi))//bondfile(kr+fjp,ic))
                 read(77,*) comment
                 do ii=1,Nbr(kr+fjp,ic)
                    read(77,*) i1,j1
                    if(j1.eq.-1)then
                       j=i1+sum1
                       bb(1) = j
                       bb(2) = i
                       exit
                     endif
                 enddo
                   close(77)
             elseif(jj.eq.-1)then
                     j = bb(2)-ca
                     flag = 0
           !-------peptide Linkage NAM -> ALA and Aminoacid -> Aminoacid------!
                 
             elseif((jj.eq.-4).and.  
     +              (trim(bondfile(kr,ic)).eq.'bonds_LYS_linked.dat'))
     +              then
                  write(*,*)'Hare Krishna'
                   open(77,file=trim(adjustl(pathi))//bondfile(kr+6,ic))
                   read(77,*) comment
                   do ii=1,Nbr(kr+6,ic)
                      read(77,*) i1,j1
                      if(j1.eq.-3)then
                         j = i1 + sum(Nar(kr:kr+5,ic))
                         bb(3) = j
                         bb(4) = i
                         exit
                      endif
                   enddo
                      close(77)

             elseif(jj.eq.-4) then
                   open(77,file=trim(adjustl(pathi))//bondfile(kr+1,ic))
                   read(77,*) comment
                   do ii=1,Nbr(kr+1,ic)
                      read(77,*) i1,j1
                      if(j1.eq.-3)then
                         j = i1 + Nar(kr,ic)
                         bb(3) = j
                         bb(4) = i
                         exit
                      endif
                   enddo
                      close(77)

             elseif(jj.eq.-3)then
                      j = bb(4)-ca
                      flag = 0
             elseif(jj.eq.-6) then
                   if(trim(resnam(kr,ic)).eq.'GLY')then
                     close(fp) !because -6 is the last entry in bondfile
                    endif
                open(77,file=trim(adjustl(pathi))//bondfile(kr+1,ic))
                   read(77,*) comment
                   do ii=1,Nbr(kr+1,ic)
                      read(77,*) i1,j1
                      if(j1.eq.-5)then
                         j = i1 + Nar(kr,ic)
                         bb(3) = j
                         bb(4) = i
                         exit
                      endif
                   enddo
                      close(77)

              elseif(jj.eq.-5)then
                      j = bb(4)-ca
                      flag = 0
               !--------Inter-Chain Link----!
             elseif(jj.eq.-7)then !GLY linked->DAL linked
                    read(87,*) i1,j1 !already it is in order
                     i = i1 - ca
                     j = j1 - ca
             elseif(jj.eq.-8)then      
                    flag = 0
             endif
              !----------Glycosidic-Linkage NAG -> NAM----!
          else 
                if(jj.eq.-2) then
                  open(77,file=trim(adjustl(pathi))//bondfile(kr+1,ic))
                     read(77,*) comment
                  do ii=1,Nbr(kr+1,ic)
                      read(77,*) i1,j1
                      if(j1.eq.-1)then
                         j = i1 + Nar(kr,ic)
                         bb(1) = j
                         bb(2) = i
                         exit
                       endif
                  enddo
                      close(77)
                elseif(jj.eq.-1)then
                     j = bb(2)-ca
                     flag = 0
                endif
          endif
!================================================================================
