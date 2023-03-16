function SaveImage(Obj)
    figure('Position',[100 100 500 500],'Visible','on');
    set(gca,'Fontname','Times New Roman','FontSize',13,'NextPlot','add', ...
        'Color','none','Box','on','View',[135 30]);
    plot3(Obj(:,1),Obj(:,2),Obj(:,3),'o','MarkerSize',8, ...
        'Markerfacecolor','r','Markeredgecolor','r');
    xlim([-0.05 1.05]); xlabel('\it f\rm_1','position',[0.4,1.2,-0.15]);
    ylim([-0.05 1.05]); ylabel('\it f\rm_2','position',[1.2,0.4,-0.15]);
    zlim([-0.05 1.05]); zlabel('\it f\rm_3','position',[0.4,-0.77,0.5],'Rotation',0);
    zticks([0 0.5 1]); axis square; 
    savefig('SaveImage.fig'); close;
end
