!=====================================================================!
           open(11,file='inputs/allchains.tex',status='old')
           open(25,file='outputs/atomlabels.dat',status='unknown')
           open(20,file='outputs/bonds.dat',status='unknown')
           open(21,file='outputs/pairs.dat',status='unknown')
           open(22,file='outputs/angles.dat',status='unknown')
           open(23,file='outputs/dihedrals.dat',status='unknown')
           open(24,file='outputs/impropers.dat',status='unknown')
           open(26,file='outputs/cmap.dat',status='unknown')
           open(27,file='outputs/pos_rest.itp',status='unknown')
           open(28,file='outputs/dih_rest.itp',status='unknown')

           open(32,file=trim(adjustl(patho))//trim(adjustl(molname))
     +                                      //'.itp')
!======================================================================!

