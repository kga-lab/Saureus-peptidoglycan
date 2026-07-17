!========================-writing dihedrals to itp file-===============!
           write(32,'(a)') ''
           write(32,'(a)') '[ dihedrals ]'
           write(32,'(a)') '; i    j   k   l   func'
           open(23,file='outputs/dihedrals.dat',status='unknown')
           do i1=1,c
             read(23,*) i,j,k,l !writing to dihedrals.dat
             write(32,'(i5,4i6)') i,j,k,l, 9 !func type = 9     
           enddo 
!======================================================================!
