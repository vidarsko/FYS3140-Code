sys=sysC2C(-4,4);

f=1./sys.z.^2;

%plot_function(sys,f)
calc_square_contour_integral(sys,f,0,3)