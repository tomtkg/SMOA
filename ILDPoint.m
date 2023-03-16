function [W,N] = ILDPoint(N,M)
%ILD - Generate a set of uniformly distributed points on the unit
%hyperplane named Incremental lattice desigin.
%
%   [W,N] = ILDPoint(N,M) returns approximately N uniformly distributed
%   points with M objectives on the unit hyperplane.
%
%   Note that the number of sampled points L may be slightly larger than
%   the predefined size N due to the need for uniformity.
%
%   Example:
%       [W,N] = ILDPoint(286,10)
%
%------------------------------- Reference --------------------------------
% T. Takagi, K. Takadama, and H. Sato, Incremental lattice design of weight
% vector set, Proceedings of the 2020 Genetic and Evolutionary Computation
% Conference Companion, 2020, 1486-1494.
%--------------------------------------------------------------------------

% This algorithm is written by Tomoaki Takagi
    
    I = M * eye(M);
    W = zeros(1,M);
    edgeW = W;
    while size(W) < N
        edgeW = repmat(edgeW,M,1) + repelem(I,size(edgeW,1),1);
        edgeW = unique(edgeW,'rows');
        edgeW(min(edgeW,[],2)~=0,:) = [];
        W = [W+1;edgeW];
    end
    W = W./sum(W,2);
%     W = max(W,1e-6);
    N = size(W,1);
end
