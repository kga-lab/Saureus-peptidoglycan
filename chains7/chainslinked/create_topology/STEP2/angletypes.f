!23456789==============================================================!
          Subroutine angletypes(atomtype,maxn,Na)
                 implicit none
                 integer Na,maxn,i,j,k,l,k1,flag
                 integer bb(maxn,3)
                 character*6 atomtype(Na)
                
!======================================================================!
             open(11,file='inputs/angles.dat')
             open(21,file='outputs/angletypes.dat')
             read(11,*) i,j,k
             write(21,'(a,2a10)') atomtype(i),atomtype(j),atomtype(k)
             bb(1,1)=i
             bb(1,2)=j
             bb(1,3)=k
              
             do l=2,maxn
               read(11,*) i,j,k
               bb(l,1) = i
               bb(l,2) = j
               bb(l,3) = k
               do k1=1,l-1
                if(((atomtype(i).eq.atomtype(bb(k1,1))).and.
     +              (atomtype(j).eq.atomtype(bb(k1,2))).and.
     +              (atomtype(k).eq.atomtype(bb(k1,3)))).or.
     +             ((atomtype(i).eq.atomtype(bb(k1,3))).and.
     +              (atomtype(j).eq.atomtype(bb(k1,2))).and.
     +              (atomtype(k).eq.atomtype(bb(k1,1)))))then
                 flag = 1
                 exit
                else
                 flag = 0
                endif
               enddo
               if(flag.eq.0)then
               write(21,'(a,2a10)') atomtype(i),atomtype(j),atomtype(k)
               endif
             enddo
                close(11)
                close(21)
                END Subroutine
!==============================================================!
