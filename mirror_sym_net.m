function net = mirror_sym_net(nA,nB,nBp,p)
% Generates a random mirror-symmetric network following the procedure
% described in the following paper:
%
%  Liyue Zhang, Adilson E. Motter, and Takashi Nishikawa
%  Incoherence-Mediated Remote Synchronization
%  Phys. Rev. Lett. 118, 174102 (2017)
%
% Output: struct variable 'net' with fields, 'nA', 'nB', 'nBp', 'p', 'A'
%
% If no input argument is given, it will use:
%
%   nA = 6, nB = 30, nBp = 2, p = 0.8
%
% The indexing for the adjacency matrix 'net.A' is as follows:
%
%   Group A: i = 1, ... ,nA
%   Group B: i = nA+1, ..., nA+nB
%   Group C: i = nA+nB+1, ..., N (= 2*nA + nB)
%
% Copyright (c) 2017 by Takashi Nishikawa

if nargin == 0
    nA = 6; nB = 30; nBp = 2; p = 0.8;
end

N = 2*nA + nB;
A = zeros(N);

% Connect nodes in group B.
for i = nA+1:nA+nB
    for j = i+1:nA+nB
        if rand <= p; A(i,j) = 1; A(j,i) = 1; end
    end
end
 
% Connect Node 1 and N to other nodes in groups A and C, respectively. Also
% connect nodes in groups A and C to nodes in group B.
for i = 2:nA
    A(1,i) = 1; A(i,1) = 1;
    A(N, N-i+1) = 1; A(N-i+1, N) = 1;
    nrm=randperm(nB);
    ix = nA + nrm(1:nBp);
    A(ix,i) = 1; A(i,ix) = 1;
    A(ix, N-i+1) = 1; A(N-i+1, ix) = 1;
end

net = struct('nA', nA, 'nB', nB, 'nBp', nBp, 'p', p, 'A', A);
