!======================================================================!
             do ic=1,Nc
              read(11,*) chainname(ic)  
             enddo
             Nar(:,:) = 0
             cr = 0
             qt = 0.d0
             c = 0
          do ic=1,Nc
          open(fpc(ic),file=trim(adjustl(pathi))//chainname(ic))
          do kr = 1,Nr(ic)
             cr = cr + 1
             read(fpc(ic),*) filename  !atomlabels
             call findmaxrows(filename,Nar(kr,ic))
             Nar(kr,ic) = Nar(kr,ic)-2
            open(fp,file=trim(adjustl(pathi))//filename)  
            read(fp,*) comment
            read(fp,*) resnam(kr,ic)
            write(32,'(a,i4,a9)') ';residue', cr, resnam(kr,ic) 
            do j=1,Nar(kr,ic)
               c = c + 1
             read(fp,*) i,atom(c),atomtype(c),q,mass
              qt = qt + q
             write(32,'(i6,a11,i7,a9,a7,i7,f11.3,f11.4,a9,f7.2)') c,
     +      adjustr(atomtype(c)),cr,adjustr(resnam(kr,ic)), 
     +      adjustr(atom(c)),c,q,mass, '; qtot',qt
          write(25,'(i6,2a11,2f11.4)') c,adjustr(atom(c)),
     +                            adjustr(atomtype(c)),q,mass
           enddo
           close(fp)
          enddo
        enddo
            write(*,*) 'total atoms matched', Na,sum(Nar(:,:))
!==================================================================!
