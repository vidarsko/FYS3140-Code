function  plot_function(sys,f)
%PLOT_FUNCTION Summary of this function goes here
%   Detailed explanation goes here

if strcmp(sys.type,'C2C')

    if isreal(f)
        surf(sys.X,sys.Y,f); shading interp
        colorbar
    else

%         norm = abs(f);
%         
%         f(norm.^2>1e1)=nan;
% 
        
%         theta = angle(f);
% 
%         
% 
%         dcolor(sys.x,sys.y,rho.*exp(1i*theta));
%         set(gca,'Color','w')

        sanePColor(sys.x,sys.y,angle(f));
        %     f_abs(f_abs>100)=nan;
        rho = abs(f);
        rho(isinf(rho))=1e3;
        %         max_rho = max(rho(:));

        mean_rho = mean(rho(:));

        poles = regionprops(rho>5*mean_rho, 'centroid');
        centroids = cat(1,poles.Centroid);
        hold on
        for n=1:size(centroids,1)
            plot(centroids(n,1)*sys.dx+sys.xmin,centroids(n,2)*sys.dy+sys.ymin,'ko','MarkerFaceColor','w');
        end

        zeros_of_f = regionprops(rho<0.05, 'centroid');
        centroids = cat(1,zeros_of_f.Centroid);
        hold on
        for n=1:size(centroids,1)
            plot(centroids(n,1)*sys.dx+sys.xmin,centroids(n,2)*sys.dy+sys.ymin,'ko','MarkerFaceColor','k');
        end

        colormap(circshift(hsv,128))
        colorbar('XTickLabel',{'-\pi','-\pi/2','0','\pi/2','\pi'},'XTick', [-pi,-pi/2,0,pi/2,pi])
        caxis([-pi,pi])

       
    end

    xlim([sys.xmin,sys.xmax])
    ylim([sys.ymin,sys.ymax])
    xlabel('$\Re(z)$','Interpreter','latex')
    ylabel('$\Im(z)$','Interpreter','latex')
    

else
    error('Function not configured for this system')
end

end

