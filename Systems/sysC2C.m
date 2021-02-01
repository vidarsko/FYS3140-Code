function sys = sysC2C(xmin,xmax,ymin,ymax,xRes,yRes)
%SYSC2C Summary of this function goes here
%   Detailed explanation goes here

sys.type = 'C2C'

if nargin<2
   xmin=-2; 
   xmax= 2;
end

if nargin<4
   ymin=xmin;
   ymax=xmax;
end

if nargin<6
   xRes = 201;
   yRes = 201;
end

sys.x = linspace(xmin,xmax,xRes);
sys.xmax = xmax; sys.xmin = xmin;
sys.dx = sys.x(2)-sys.x(1);

sys.y = linspace(ymin,ymax,yRes);
sys.ymax = ymax; sys.ymin=ymin;
sys.dy = sys.y(2)-sys.y(1);

[sys.Xi,sys.Yi]=meshgrid(1:xRes,1:yRes);
[sys.X,sys.Y] = meshgrid(sys.x,sys.y);
sys.z = sys.X+1i*sys.Y;


sys.xmin=xmin; sys.xmax=xmax; sys.ymin=ymin; sys.ymax=ymax;
sys.xRes=xRes; sys.yRes=yRes;



end

