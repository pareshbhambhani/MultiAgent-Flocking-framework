function out = gradient_sigma_norm(z)
global  epsilon ;

%epsilon = constants(5);
out = z/(sqrt(1+epsilon*norm(z)));
end