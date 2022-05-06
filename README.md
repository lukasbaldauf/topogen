# topogen
Generate coarse-grained topology files for gromacs.


### Usage:  
Generate topolgy files for a length 10 alginate

    python topogen.py 'MGMGMGMMMG' 10-alginate
    ./bonds2constr.sh outfiles/10-alginate.itp outfile/10-alginate.itp
    
### Examples
Setting up and running a system in GROMACS containing
- 2 alginate chains of length 10
- 2 chitosan chains of length 3
- ions to neutralize each oligomer individually 
<img src="https://github.com/lukasbaldauf/topogen/blob/main/vmdscene.png" width="250" height="250" />


    python topogen.py 'MMMMMMMMMM' 10-alginate
    python topogen.py 'YYY' 3-chitosan
    
    # IMPORTANT! Replace stiff bonds by restraints
    ./bonds2constr.sh outfiles/10-alginate.itp outfile/10-alginate.itp
    ./bonds2constr.sh outfiles/3-chitosan.itp outfile/3-chitosan.itp
    
    cd example
    gmx editconf -f ../outfiles/10-alginate.gro -box 8 -bt cubic -o tmp.gro
    gmx insert-molecules -f tmp.gro -ci ../outfiles/10-alginate.gro -nmol 1 -o tmp.gro
    gmx insert-molecules -f tmp.gro -ci ../outfiles/3-chitosan.gro -nmol 2 -o tmp.gro
    gmx insert-molecules -f tmp.gro -ci ../forcefield/NA.gro -nmol 20 -o tmp.gro
    gmx insert-molecules -f tmp.gro -ci ../forcefield/CL.gro -nmol 6 -o init-conf.gro
    rm \#tmp.gro*
    
    mkdir min
    cd min
    gmx grompp -f ../../mdps/min.mdp -c ../init-conf.gro -p ../top/topol.top -o min.tpr
    gmx mdrun -deffnm min -v
    cd ../
    
    mkdir nvt
    cd nvt
    gmx grompp -f ../../mdps/nvt.mdp -c ../min/min.gro -p ../top/topol.top -o nvt.tpr
    gmx mdrun -deffnm nvt -nstlist 10 -v
  
    
    
    
    


  
  

    
    
