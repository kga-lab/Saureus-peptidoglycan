!============================improper [ dihedrals ]====================!
            write(32,'(a)') ''
            write(32,'(a)') '[ dihedrals ]'
            write(32,'(a)') '; i    j   k   l   func  zeta  kzeta'

             do ic=1,Nc
              do kr=1,Nr(ic)
               read(fpc(ic),*) improfile(kr,ic)
              enddo
            enddo
            !--------------within the residues----------!
             ca = 0
          do ic=1,Nc
           do kr=1,Nr(ic)
              open(fp,file=trim(adjustl(pathi))//improfile(kr,ic))
              read(fp,*) sn
             do k1=1,sn
              read(fp,*) i,j,k,l
              i = i + ca
              j = j + ca
              k = k + ca
              l = l + ca
              write(32,'(i5,4i6)') i,j,k,l, 2 !func type = 2     
              write(24,*) i,j,k,l
            enddo
           close(fp)
             ca = ca + Nar(kr,ic)
           enddo
          enddo
           !----------across Amino-acids----------!
            do i=1,Na
               if(atomtype(i).eq.'C')then
                do j=1,Na
                 if((B(i,j).eq.1).and.((atomtype(j).eq.'CT1').or.
     +           (atomtype(j).eq.'CTD1').or.(atomtype(j).eq.'CT2')))then
                  do k=1,Na
                  if((B(i,k).eq.1).and.(atomtype(k).eq.'NH1'))then !OK i-k
                    do l=1,Na
                     if((B(i,l).eq.1).and.(atomtype(l).eq.'O'))then !OK i-l
                      write(32,'(i5,4i6)') i,j,k,l, 2 !func type = 2
                      write(24,*) i,j,k,l
                     endif
                  enddo!l
                 endif
                enddo!k
               endif
              enddo!j
             elseif(atomtype(i).eq.'NH1')then
                do j=1,Na
                 if((B(i,j).eq.1).and.(atomtype(j).eq.'C'))then
                  do k=1,Na
                   if((B(i,k).eq.1).and.((atomtype(k).eq.'CT1').or.
     +                                   (atomtype(k).eq.'CTD1')))then !OK i-k
                    do l=1,Na
                     if((B(i,l).eq.1).and.(atomtype(l).eq.'H'))then !OK i-l
                      write(32,'(i5,4i6)') i,j,k,l, 2 !func type = 2
                      write(24,*) i,j,k,l
                     endif
                    enddo!l
                   endif
                  enddo!k
                 endif
                enddo!j
              endif
            enddo!i
!======================================================================!
