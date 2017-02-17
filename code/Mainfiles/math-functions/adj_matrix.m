function aij = adj_matrix(z,r)
r_alpha = sigma_norm(r);
aij = rho_h(sigma_norm(z)/r_alpha);
end
