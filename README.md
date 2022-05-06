# topogen
Generate coarse-grained topology files for gromacs.


### Usage:  
Generate topolgy files for a length 10 alginate

    python topogen.py 'MGMGMGMMMG' 10-alginate
    ./bonds2constr.sh outfiles/10-alginate.itp outfile/10-alginate.itp
    
### Examples
Generate a "solution" containing:
- 10 alginate chains of length 10
- 10 chitosan chains of length 3
- ions to neutralize each oligomer individually
  
  

    
    
