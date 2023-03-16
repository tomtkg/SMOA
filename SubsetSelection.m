function Select = SubsetSelection(Obj,Objhat,N)
    Len = length(Obj);
    Obj = [Obj;Objhat];
    %% Select the representative objective vector set
    LpNormD = pdist2(Obj,Obj);
    Select = false(1,length(Obj));
    Select(1:Len) = true;
    % Greedy inclusion distance-based subset slection
    while sum(Select) < N
        Remain   = find(~Select);
        [~, rho] = max(min(LpNormD(Remain,Select),[],2));
        Select(Remain(rho)) = true;
    end
    Select = Select(Len+1:end);
end