function  plot_function(sys,f)
%PLOT_FUNCTION Summary of this function goes here
%   Detailed explanation goes here

if strcmp(sys.type,'C2C')
    f_abs =  abs(f);
    f_ang = angle(f);
    
%     f_abs(f_abs>100)=nan;
    
    surf(sys.X,sys.Y,f_abs,f_ang); shading flat;
    colormap(circshift(hsv,128))
    colorbar('XTickLabel',{'-\pi','-\pi/2','0','\pi/2','\pi'},'XTick', [-pi,-pi/2,0,pi/2,pi])
    caxis([-pi,pi])
    xlim([sys.xmin,sys.xmax])
    ylim([sys.ymin,sys.ymax])
    xlabel('x')
    ylabel('y')
    view(2)

    
    patch([sys.xmax sys.xmin sys.xmin sys.xmax], [sys.ymax sys.ymax sys.ymin sys.ymin], [0 0 0 0], [0 0 0 0],...
        'FaceColor','black','FaceAlpha',0.2) ;
    
else
    error('Function not configured for this system')
end

end

