function f = calc_series(sys,expr,nmin,nmax)
%CALC_SERIES Summary of this function goes here
%   Detailed explanation goes here

if nargin<3
   nmin=0; 
end

if nargin<4
   nmax=100; 
end

expr = strrep(expr,'zb','conj(sys.z)');
expr = strrep(expr,'z','sys.z');


f = 0;
for n=nmin:nmax
   f = f+eval(expr);
end

f(abs(f)>10)=nan;

end

