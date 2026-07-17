!===================================================================!
             open(23,file='contactlist.dat')
             open(24,file='selectedcontacts.dat')
               cs = 0
               crpi(:) = 0
               crpj(:) = 0
               fs(:) = 0 !flag for a selected atom link
               fsr(:) = 0 ! flag for selected residue
             do k=1,tc2
               read(23,*) i,ic,j,jc,fr
               if((fr.ge.frmin).and.
     +            (fs(i).eq.0).and.(fs(j).eq.0).and.
     +            (fsr(cr(i)).eq.0).and.(fsr(cr(j)).eq.0)) then
                 write(24,*) i,ic,j,jc,fr,1
                 cs = cs + 1
                 crpi(cs) = cr(i)
                 crpj(cs) = cr(j)
                 fs(i) = 1
                 fs(j) = 1
                 fsr(cr(i)-1)=1
                 fsr(cr(i))=1
                 fsr(cr(i)+1)=1
                 fsr(cr(j)-1)=1
                 fsr(cr(j))=1
                 fsr(cr(j)+1)=1
               endif    
            enddo 
                write(*,*) 'total selected links=',cs
             close(23) 
             close(24)
!===================================================================!
