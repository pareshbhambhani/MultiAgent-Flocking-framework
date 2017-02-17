function out = rho_h(z)
global  h_alpha ;

if ((z>=0) && (z<h_alpha))
    out = 1;
elseif ((z>=h_alpha) && (z<=1))
    out = 0.5*[1+cos(pi*(z-h_alpha)/(1-h_alpha))];
else
    out = 0;
end
end

