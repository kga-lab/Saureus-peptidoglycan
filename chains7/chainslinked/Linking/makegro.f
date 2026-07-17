!======================================================================!
             open(41,file='newallchains.tex',status='old')
             open(13,file='system_eq3_pbc.gro')  !OK
             open(31,file='iniconfig.gro')
             read(13,*) dummy
             read(13,*) dummy
             write(31,'(a)') 'glycan in water'
             write(31,*) cn
              c = 0
            do kc=1,Nc
               read(41,*) filename
               call findmaxrows(filename,rc)
               rc = rc/4 
               open(fp,file=filename)
              do k=1,rc
                 read(fp,*) res
                 call get_atom_number(res,Nar,res2)
                 if(trim(res).eq.'atomlabels_LYS_linked.dat')then
                    Nar = Nar + 2
                   open(14,file='pentaglycine_crosslinked.xyz') !for reading PENTAGLYCINE 35
                   flag2= 0
                   xp = xo+0.200d0
                   yp = yo+0.2d0
                   zp = zo+0.2d0
                 elseif(trim(res).eq.'atomlabels_LYS_bridge.dat')then
                    Nar = Nar + 2
                   open(14,file='pentaglycine_bridge.xyz') !for reading PENTAGLYCINE 37
                   flag2= 0
                   xp = xo+0.200d0
                   yp = yo+0.2d0
                   zp = zo+0.20d0
                 endif
                 !------skipping DAL.dat when DAL_linked found---!
                 if(trim(pres).eq.'atomlabels_DAL_linked.dat')then
                  do j=1,11  !skipping DAL.dat
                   read(13,'(a8,a7,i6,3f8.3)') res3,atom2,i,xo,yo,zo
                  enddo
                 endif
              !----------------------------------------------!
                do j=1,Nar
                 if(trim(res2).eq.'GLY')then
                     read(14,'(a8,a7,i6,3f8.3)')res3,atom2,i,xo,yo,zo
                       flag2 = flag2 + 1
                         c = c + 1
                     write(31,'(a8,a6,i6,3f8.3)') adjustr(res2),
     +                    adjustr(atom2),c,xp+xo,yp+yo,zp+zo
                  else
                    read(13,'(a8,a7,i6,3f8.3)') res3 ,atom2 ,i,xo,yo,zo
                    if((trim(res).eq.'atomlabels_LYS_linked.dat').or.
     +                 (trim(res).eq.'atomlabels_LYS_bridge.dat'))then
                     if((j.ne.19).and.(j.ne.20))then
                           c = c + 1
                        write(31,'(a8,a6,i6,3f8.3)') adjustr(res2),
     +                    adjustr(atom2),c,xo,yo,zo
                     endif
                    else 
                          c = c + 1
                        write(31,'(a8,a6,i6,3f8.3)') adjustr(res2),
     +                    adjustr(atom2),c,xo,yo,zo
                    endif
                   endif
                 enddo!j
                   pres = res
                    if((flag2.eq.35).or.(flag2.eq.37))then
                       xp = xo
                       yp = yo
                       zp = zo
                       close(14)
                    endif
                enddo!k
                  close(fp)
              enddo !kc
                   write(31,*) Lx,Ly,Lz
                  close(41)
                  close(13)
                  close(31)
!======================================================================!
