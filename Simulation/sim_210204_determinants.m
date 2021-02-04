s = sysC2C(-3,3);
f = s.z.^2;

J = calc_Jacobian(s,f);
D = calc_Jacobian_determinant(s,f,J);

%viz_tensor(s,J)
plot_function(s,D)m