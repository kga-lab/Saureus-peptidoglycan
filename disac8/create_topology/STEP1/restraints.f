             !=================Restraint====================!
            write(32,'(a)') ''
            write(32,'(2a)') '#ifdef REST_ON_',molname
            write(32,'(3a)') '#include "../restraints/',
     +                            trim(molname),'_rest.itp"'
            write(32,'(a)') '#endif'
         
            write(27,'(a)') '[ position_restraints ]'
            write(28,'(a)') '[ dihedral_restraints ]'

           do ic=1,Nc
             do kr=1,Nr(ic)
              read(fpc(ic),*) restname(kr,ic)
             enddo
           enddo
            ca = 0
          do ic=1,Nc
           do kr=1,Nr(ic)
            open(fp,file=trim(adjustl(pathi))//restname(kr,ic))
            read(fp,*) comment,sn  !position restraint
            do k1=1,sn
             read(fp,*) i, k, fcx, fcy, fcz 
             i = i + ca
             write(27,'(i5,i6,3a9)') i, 1, fcx,fcy,fcz
            enddo
           read(fp,*) comment,sn  !dihedral restraint
            do k1=1,sn
             read(fp,*) i,j,k,l,i1,fcx,fcy,fcz  
             i = i + ca
             j = j + ca
             k = k + ca
             l = l + ca 
             write(28,'(i5,3i6,i6,3a9)') i,j,k,l,1,adjustr(fcx),
     +                                adjustr(fcy),adjustr(fcz)
            enddo
             ca = ca + Nar(kr,ic)  
             close(fp)          
          enddo
        enddo
!======================================================================!
