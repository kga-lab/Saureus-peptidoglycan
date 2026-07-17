!23456789==============================================================!
          Subroutine dihedraltypes(atomtype,maxn,Na)
                 implicit none
                 integer Na,maxn,i,j,k,l,kk,k1,flag
                 integer bb(maxn,4)
                 character*6 atomtype(Na)
                
!======================================================================!
              open(11,file='inputs/dihedrals.dat')
              open(21,file='outputs/dihedraltypes.dat')

             read(11,*) i,j,k,l
             write(21,'(a,3a10)') atomtype(i),atomtype(j),atomtype(k),
     +                             atomtype(l)
             bb(1,1)=i
             bb(1,2)=j
             bb(1,3)=k
             bb(1,4)=l 
             do kk=2,maxn
               read(11,*) i,j,k,l
               bb(kk,1) = i
               bb(kk,2) = j
               bb(kk,3) = k
               bb(kk,4) = l
               do k1=1,kk-1
                  if(((atomtype(i).eq.atomtype(bb(k1,1))).and.
     +                (atomtype(j).eq.atomtype(bb(k1,2))).and.
     +                (atomtype(k).eq.atomtype(bb(k1,3))).and.
     +                (atomtype(l).eq.atomtype(bb(k1,4)))).or.
     +               ((atomtype(i).eq.atomtype(bb(k1,4))).and.
     +                (atomtype(j).eq.atomtype(bb(k1,3))).and.
     +                (atomtype(k).eq.atomtype(bb(k1,2))).and.
     +                (atomtype(l).eq.atomtype(bb(k1,1)))))then
                 flag = 1
                 exit
                else
                 flag = 0
                endif
               enddo
               if(flag.eq.0)then
               write(21,'(a,3a10)') atomtype(i),atomtype(j),atomtype(k)
     +                               ,atomtype(l)
               endif
             enddo
                close(11)
                close(21)
                END Subroutine
!==============================================================!
