!23456789===============================================================!
           Program createtypes
              implicit none
              integer i,j,Na,flag,pairmax,bondmax,anglemax,dihmax,fp,fp2
              integer impromax,N
              parameter (N=11921)
              double precision q,m
              character*6 atom(N),atomtype(N),comment,resnam
              character*32 filename
!=======================================================================
           !----------maxrows--------------------!  
              filename='atomlabels.dat'
              call findmaxrows(filename,Na)
              filename='bonds.dat'
              call findmaxrows(filename,bondmax)
              filename='pairs.dat'
              call findmaxrows(filename,pairmax)
              filename='angles.dat'
              call findmaxrows(filename,anglemax)
              filename='dihedrals.dat'
              call findmaxrows(filename,dihmax)
              filename='impropers.dat'
              call findmaxrows(filename,impromax)
           !------------create types----------------!
              call atomtypes(atom,atomtype,Na)
              call bondtypes(atomtype,bondmax,Na)
              call pairtypes(atomtype,pairmax,Na)
              call angletypes(atomtype,anglemax,Na)
              call dihedraltypes(atomtype,dihmax,Na)
              call impropertypes(atomtype,impromax,Na)
               END
!======================================================================!
                include 'findmaxrows.f'
                include 'atomtypes.f'
                include 'bondtypes.f'
                include 'pairtypes.f'
                include 'angletypes.f'
                include 'dihedraltypes.f'
                include 'impropertypes.f'
