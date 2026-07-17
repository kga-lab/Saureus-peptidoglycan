#!/bin/bash

cp ../../Freesimu/create_topology/STEP1/inputs/allchains.tex .

cp ../../Freesimu/create_topology/STEP1/inputs/residues_chain* .

cp ../../Freesimu/create_topology/STEP1/inputs/number_disaccharide.tex .

cp ../../Freesimu/create_topology/STEP1/inputs/NAG_NAM_periodiclinks.tex . 

cp ../../Freesimu/create_topology/STEP1/inputs/number_residues.tex .

cp ../../Freesimu/create_topology/STEP1/outputs/atominfo.dat .

mv ../../Freesimu/simu/Results/traj_glycan.gro . 

mv ../../Freesimu/simu/Results/system_eq3_pbc.gro . 

cp allchains.tex newallchains.tex

sed -i 's/res/newres/g' newallchains.tex 
