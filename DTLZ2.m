function Obj = DTLZ2(Dec,M)
    g   = sum((Dec(:,M:end)-0.5).^2,2);
    Obj = repmat(1+g,1,M)...
        .*fliplr(cumprod([ones(size(g,1),1),cos(Dec(:,1:M-1)*pi/2)],2))...
        .*[ones(size(g,1),1),sin(Dec(:,M-1:-1:1)*pi/2)];
end
