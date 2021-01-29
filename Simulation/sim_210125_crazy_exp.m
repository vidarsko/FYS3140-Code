sys = sysC2C(-0.01,0.011);

f = exp(1./sys.z);

plot_function(sys,f)
