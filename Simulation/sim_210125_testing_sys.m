sys = sysC2C(-10,10);


%f = (sys.z-1).*(sys.z+1);

% plot_function(sys,f)
% zlim([0,1])

f = calc_series(sys,'2^n*(z+1i-5).^(2*n)',1);

plot_function(sys,f)
%zlim([0,5])