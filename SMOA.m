function SMOA
% Supervised multi-objective optimization algorithm

%------------------------------- Reference --------------------------------
% T. Takagi, K. Takadama, and H. Sato, Supervised multi-objective
% optimization algorithm using estimation, Proceedings of the IEEE Congress
% on Evolutionary Computation, 2022, 1-8.
%--------------------------------------------------------------------------

% This function is written by Tomoaki Takagi

    %% Parameter setting
    M = 3;     % Number of objectives
    D = 3;     % Number of decision variables
    H = 2.6e4; % Size of uniformly distributed L1 unit vector set
    FE = 160;  % Number of function evaluations
    
    %% Generate the uniformly distributed L1 unit vector set
    [W,N] = ILDPoint(H,M);
    
    %% Generate estimator
    estimator = @(W,X,Y) sim(newrbe(X',Y'),W')';
%     I = ones(1,M);
%     estimator = @(W,X,Y) predictor(W, ...
%         dacefit(X,Y,'regpoly0','corrgauss',I,1e-3*I,1e3*I));

    %% Load solution data
    Dec = load("DTLZ2_M3_D12.dat");
    Dec = Dec(:,1:D);
    Obj = DTLZ2(Dec,M);
    
    %% Generate model values
    Y = vecnorm(Obj,1,2); % L1 norm set
    X = Obj./Y;           % L1 unit vector set
            
    %% Search representative vector set
    Objhat = W.*estimator(W,X,Y);
    Select = SubsetSelection(Obj,Objhat,FE);
    W = W(Select,:);
            
    %% Generate decision variables
    decs = zeros(length(W),D);
    for i = 1 : D
        decs(:,i) = estimator(W,X,Dec(:,i));
    end
    decs = min(max(decs,0),1);
    
    %% Generate population
    Obj = [Obj;DTLZ2(decs,M)];
    SaveImage(Obj);
end
