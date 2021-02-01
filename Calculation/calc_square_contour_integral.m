function integral = calc_square_contour_integral(sys,f,z0,side_length,dont_plot)
%CALC_SQUARE_CONTOUR_INTEGRAL Summary of this function goes here
%   Detailed explanation goes here

if nargin<5
   dont_plot=false; 
end



[dist_min,z0i]=min(abs(sys.z(:)-z0));

if dist_min>0.5
   error('No grid point sufficiently close to z0 was found.'); 
end

integral = 0;

x0i = sys.Xi(z0i);
dxi = round(side_length/(2*sys.dx));

y0i = sys.Yi(z0i);
dyi = round(side_length/(2*sys.dy));

if sys.X(z0i) + side_length/2>sys.xmax || sys.X(z0i) - side_length/2<sys.xmin ...
        || sys.Y(z0i)+side_length/2>sys.ymax || sys.Y(z0i)-side_length/2<sys.ymin
   error('Desired integration square outside bounds.'); 
end

integral=0;
%Integrate along bottom right
yi = y0i-dyi;
for xi=x0i-dxi:x0i+dxi-1
    integral = integral+f(yi,xi)*(sys.z(yi,xi+1)-sys.z(yi,xi));
end
%Integrate along right side
xi = x0i+dxi;
for yi=y0i-dyi:y0i+dyi-1    
    integral = integral+f(yi,xi)*(sys.z(yi+1,xi)-sys.z(yi,xi));
end
%Integrate along top
yi = y0i + dyi;
for xi=flip(x0i-dxi+1:x0i+dxi)
    integral = integral+f(yi,xi)*(sys.z(yi,xi-1)-sys.z(yi,xi));
end
%Integrate along left
xi = x0i - dxi;
for yi=flip(y0i-dyi+1:y0i+dyi)
    integral = integral+f(yi,xi)*(sys.z(yi-1,xi)-sys.z(yi,xi));
end

if not(dont_plot)
   figure
   plot_function(sys,f); 
   hold on
   plot3(sys.X(y0i-dyi,x0i-dxi:x0i+dxi),sys.Y(y0i-dyi,x0i-dxi:x0i+dxi),abs(f(y0i-dyi,x0i-dxi:x0i+dxi)),'r--','LineWidth',2);
   plot3(sys.X(y0i-dyi:y0i+dyi,x0i+dxi),sys.Y(y0i-dyi:y0i+dyi,x0i+dxi),abs(f(y0i-dyi:y0i+dyi,x0i+dxi)),'r--','LineWidth',2);
   plot3(sys.X(y0i+dyi,x0i-dxi:x0i+dxi),sys.Y(y0i+dyi,x0i-dxi:x0i+dxi),abs(f(y0i+dyi,x0i-dxi:x0i+dxi)),'r--','LineWidth',2);
   plot3(sys.X(y0i-dyi:y0i+dyi,x0i-dxi),sys.Y(y0i-dyi:y0i+dyi,x0i-dxi),abs(f(y0i-dyi:y0i+dyi,x0i-dxi)),'r--','LineWidth',2);
       
end

end



