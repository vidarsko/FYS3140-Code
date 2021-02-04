function J = calc_Jacobian(sys,f)
%CALC_F_JACOBIAN Summary of this function goes here
%   Detailed explanation goes here


u = real(f);
v = imag(f);

[dxu,dyu] = gradient(u,sys.dx,sys.dy);
[dxv,dyv] = gradient(v,sys.dx,sys.dy);

J(:,:,1,1) = dxu;
J(:,:,1,2) = dyu;
J(:,:,2,1) = dxv;
J(:,:,2,2) = dyv;

end

