function constants()
% Assign constant parameters values

global epsilon a b h_alpha h_beta c1_alpha c2_alpha c1_beta c2_beta c1_gamma c2_gamma;
epsilon = 0.1; %epsilon for bump function
a = 5; %a for action function
b = 5;%b for action function
h_alpha = 0.2; %h for bump function for phi_alpha
h_beta = 0.9; %h for bump function for phi_beta
c1_alpha = 1; % cn_nu where n=1,2 and nu = alpha,beta,gamma in flocking with obstacle algorithm. c1_alpha < c1_gamma < c1_beta
c2_alpha = 2*sqrt(c1_alpha);
c1_beta = 3;
c2_beta = 2*sqrt(c1_beta);
c1_gamma = 2;
c2_gamma = 2*sqrt(c1_gamma);
end