!=================================================================!       
            open(11,file='atominfo.dat',status='old')
             ic = 1
             cp = 0
            do i=1,Na
              read(11,*) j,jc,cr(j),resnam(j),atom(j),atomtype(j)    
              if(jc.ne.ic)then
                  cpmax(ic) = cp
                  cp = 0
                  ic = jc
              endif
               if(((trim(atom(j)).eq.'NZ').and.
     +             (trim(resnam(j)).eq.'LYS')).or.
     +             ((trim(atomtype(j)).eq.'C').and.
     +              (trim(resnam(j)).eq.'DAL')))then
                   cp = cp + 1
                   A(cp,jc) = j
                endif
             enddo
                cpmax(Nc) = cp
             close(11)
!==================================================================!

