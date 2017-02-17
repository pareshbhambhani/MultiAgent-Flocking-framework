function out = phi_alpha(z,d,r)

r_alpha = sigma_norm(r);
d_alpha = sigma_norm(d);
out = rho_h(z/r_alpha)*phi(z - d_alpha);
end

function out1 = phi(z)
global a b;
% a = constants(6);
% b = constants(7);
c = abs(a-b)/sqrt(4*a*b);
out1 = 0.5*((a+b)*sigma1(z+c) + (a-b));
end

function out2 = sigma1(z)
out2 = z/sqrt(1+z^2);
end
