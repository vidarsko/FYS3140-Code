function [D,J] = calc_Jacobian_determinant(sys,f,J)
%CALC_JACOBIAN_DETERMINANT Summary of this function goes here
%   Detailed explanation goes here
if nargin<3
   J = calc_Jacobian(sys,f);
end

D = J(:,:,1,1).*J(:,:,2,2)-J(:,:,2,1).*J(:,:,1,2);

end

