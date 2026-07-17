!23456789==============================================================!
          Subroutine pairtypes(atomtype,maxn,Na)
                 implicit none
                 integer Na,maxn,i,j,k,k1,flag
                 integer bb(maxn,2)
                 character*6 atomtype(Na)
!======================================================================!
             open(11,file='inputs/pairs.dat')
             open(21,file='outputs/pairtypes.dat')
             read(11,*) i,j
             write(21,'(a,a12)') atomtype(i),atomtype(j)
             bb(1,1)=i
             bb(1,2)=j
             do k=2,maxn
               read(11,*) i,j
               bb(k,1) = i
               bb(k,2) = j
               do k1=1,k-1
                if(((atomtype(i).eq.atomtype(bb(k1,1))).and.
     +              (atomtype(j).eq.atomtype(bb(k1,2)))).or.
     +             ((atomtype(i).eq.atomtype(bb(k1,2))).and.
     +              (atomtype(j).eq.atomtype(bb(k1,1)))))then
                 flag = 1
                 exit
                else
                 flag = 0
                endif
               enddo
                if(flag.eq.0)then
                write(21,'(a,a12)') atomtype(i),atomtype(j)
                endif
             enddo
                close(11)
                close(21)
                END Subroutine
!==============================================================!
