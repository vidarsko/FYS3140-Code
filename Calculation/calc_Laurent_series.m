function f = calc_Laurent_series(sys,a_expr,b_expr,n_amin,n_amax,n_bmin,n_bmax)
%CALC_LAURENT_SERIES Summary of this function goes here
%   Detailed explanation goes here
if nargin<4
   n_amin=0; 
end
if nargin<5
   n_amax=100; 
end
if nargin<6
    n_bmin = 1;
end
if nargin<7
    n_bmax = 100;
end

a_expr = strrep(a_expr,'zb','conj(sys.z)');
a_expr = strrep(a_expr,'z','sys.z');

b_expr = strrep(b_expr,'zb','conj(sys.z)');
b_expr = strrep(b_expr,'z','sys.z');

f = 0;
for n=n_amin:n_amax
   f = f+eval(a_expr).*z.^n;
end
for n=n_bmin:n_bmax
    f=f+eval(b_expr).*z.^(-n);
end



end

