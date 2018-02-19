# Generation of random mirror-symmetric networks

Generates a random mirror-symmetric network following the procedure
described in the following paper:

 Liyue Zhang, Adilson E. Motter, and Takashi Nishikawa  
 *Incoherence-Mediated Remote Synchronization*  
 Phys. Rev. Lett. **118**, 174102 (2017)  
 [DOI: 10.1103/PhysRevLett.118.174102](https://doi.org/10.1103/PhysRevLett.118.174102)
 
 (The adjacency matrix of Fig. 2(a) of this paper can be found in adj_mat.txt.)
 
 
**Usage**: net = mirror_sym_net(nA,nB,nBp,p)

Output: struct variable 'net' with fields, 'nA', 'nB', 'nBp', 'p', 'A'

If no input argument is given, it will use:

  nA = 6, nB = 30, nBp = 2, p = 0.8

The indexing for the adjacency matrix 'net.A' is as follows:

  Group A: i = 1, ... ,nA  
  Group B: i = nA+1, ..., nA+nB  
  Group C: i = nA+nB+1, ..., N (= 2*nA + nB)

Copyright (c) 2017 by Takashi Nishikawa
