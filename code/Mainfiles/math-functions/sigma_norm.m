function out = sigma_norm(z)
global  epsilon ;

%epsilon = constants(5);
out = (1/epsilon)*(sqrt(1+epsilon*norm(z))-1);
end