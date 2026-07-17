              Program repairgro
                implicit none
                integer i,j,N
                double precision x,y,z
                character*32 dummy
                character*6 res, atom
!=============================================================
             open(11,file='iniconfig.gro',status='old')
             open(21,file='iniconfig2.gro')
             read(11,*) dummy
             read(11,*) N
             write(21,'(a)') 'glycan in water'
             write(21,*) N
             do j=1,N
               read(11,'(a8,a7,i6,3f8.3)') res,atom,i,x,y,z
                if((i.gt.5741).and.(i.le.11838))then
                    x = x - 0.5d0
                elseif((i.gt.11838).and.(i.le.17559)) then
                    x = x - 1.0d0
                elseif((i.gt.17559).and.(i.le.23649)) then
                    x = x - 1.5d0
                elseif((i.gt.23649).and.(i.le.29895)) then
                    x = x - 2.0d0
                elseif(i.gt.29895) then
                    x = x - 2.5d0
                endif
               write(21,'(a8,a6,i6,3f8.3)') adjustr(res),
     +                    adjustr(atom),i,x,y,z

             enddo
                write(21,*) 14.d0, 54.d0, 5.d0
                close(11)
                close(21)
               END 
!=====================================================
