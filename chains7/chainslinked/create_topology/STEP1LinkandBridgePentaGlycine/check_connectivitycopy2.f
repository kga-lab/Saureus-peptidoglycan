!============================================================================!
!STEP-A calculate jump=> fjp and sum=> sum1 and decide to close(fp) for GLY
                fjp=1  !file jump
                sum1=Nar(kr,ic)
          if(trim(resnam(kr,ic)).ne.'NAG')then !NAM->NAG; NAM->ALA; AA->AA
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
             elseif((jj.eq.-4).and.
     +              (trim(bondfile(kr,ic)).eq.'bonds_LYS_linked.dat'))
     +              then
                    fjp = 6
                    sum1 = sum(Nar(kr:kr-1+fjp,ic))

             elseif((jj.eq.-6).and.(trim(resnam(kr,ic)).eq.'GLY'))then
                     close(fp) !because -6 is the last entry in bondfile
             else
                   fjp=1  !file jump
                   sum1=Nar(kr,ic)
             endif
           else      ! resnam = NAG
                fjp=1
                sum1=Nar(kr,ic)
           endif
!===================================
!STEP-B to get a pair of bonded particles 
           if(mod(jj,2).eq.0) then
              if(jj.eq.-8)then !-8 is reserved for cross-linking
                 read(87,*) i1,j1 !GLY linked->DAL linked
                    i = i1 - ca
                    j = j1 - ca 
              else   
                open(77,file=trim(adjustl(pathi))//bondfile(kr+fjp,ic))
                read(77,*) comment
                do ii=1,Nbr(kr+fjp,ic)
                   read(77,*) i1,j1
                   if(j1.eq.jj+1)then
                      j = i1 + sum1
                      exit
                   endif
                 enddo
                   close(77)
               endif
             else  !do nothing
               flag=0
            endif   
!============================================================================
