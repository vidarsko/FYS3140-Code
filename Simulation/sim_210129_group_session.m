sys = sysC2C(-4,4);
%f = calc_series(sys,'2^n*(z+i-5).^(2*n)',1)
%f = 1./((sys.z-1).*(sys.z-2));
f=log(sys.z)
plot_function(sys,f)
zlim([0,5])