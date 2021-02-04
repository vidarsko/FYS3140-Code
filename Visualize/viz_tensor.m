function  viz_tensor(sys,tensor)
%VIZ_TENSOR Summary of this function goes here
%   Detailed explanation goes here
figure;
subplot(2,2,1)
plot_function(sys,tensor(:,:,1,1));
title('11')

subplot(2,2,2)
plot_function(sys,tensor(:,:,1,2));
title('12')

subplot(2,2,3)
plot_function(sys,tensor(:,:,2,1));
title('21')

subplot(2,2,4)
plot_function(sys,tensor(:,:,2,2));
title('22')
end

