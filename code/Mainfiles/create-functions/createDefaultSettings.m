function [ settings ] = createDefaultSettings(  )
% Function to produce a default setting for execution


%% Species settings
settings.NSpecies = 3;
settings.NAgents = [30,1,1];


%% Agent settings

settings.mass = [1,1,1]; %mass of each agent
settings.HeightAgents = 2; %Height of agents represented as triangles

settings.PosMeanAgentsIni = [[0,0];[0,0];[0,0]]; % Initial mean position for agent distribution
settings.PosVarAgentsIni = [[50,50];[50,50];[50,50]]; % Variance for intial distribution of agents
settings.VelIntervAgentsIni = [[-1,1];[-1,1];[-1,1]]; % Initial velocity of agents is uniformly chosen at random between the limits

settings.d = [5,10,15]; %target inter-agent distance
settings.r = [1.2*settings.d(1),1.2*settings.d(2),1.2*settings.d(3)]; %interaction range alpha_agent - alpha_agent

settings.Gamma_c1 = [0.01,0.01,0.01]; %c1 in ui_gamma (navigational feedback) positional weight
settings.Gamma_c2 = [0.5,0.5,0.5]; %c2 in ui_gamma (navigational feedback) velocity weight
settings.Species_c1 = [1.5,0.5,0.5;0.5,1.5,0.5;0.5,0.5,1.5]; %Define the interspecies c1 weights. Matrix is NSpecies x NSpecies
settings.Species_c2 = [0.5,0.5,0.5;0.5,0.5,0.5;0.5,0.5,0.5]; %Define the interspecies c2 weights. Matrix is NSpecies x NSpecies

settings.d_prime = [0.6*settings.d(1),0.6*settings.d(2),0.6*settings.d(3)]; %target alpha_agent - beta_agent distance. Paper uses 0.6*r
settings.r_prime = [1.2*settings.d_prime(1),1.2*settings.d_prime(2),1.2*settings.d_prime(3)]; %%interaction range alpha_agent - beta_agent
settings.Beta_c1 = [1.5,1.5,1.5]; %c1 in ui_beta positional weight
settings.Beta_c2 = [1,1,1]; %c2 in ui_beta positional weight

settings.randomBool = 0; %Random small force on agent if stuck (0: No, 1: Yes)

settings.agentPositionStyle = 'random'; %options: 'random','filename','fixed_circle'
settings.agentPositionFilename = ''; % full filename to file containing at least the variable agents
settings.agentPositionFixedDist = [30,30,30];


%% Gamma agent settings
settings.GammaTraj = 'line'; %Options: point, line, circle
settings.qd = [-5,0]; %initial position for fixed point and line. Center for circle
settings.pd = [0.5,0]; %initial velocity
%Circular Traj
settings.GammaRad = 20; %Radius of Gamma agent circular trajectory
settings.GammaAngular = pi/20; %Angular velocity in rads/sec for Gamma agent circular trajectory
settings.GammaPhase = 0; %Initial phase angle for starting point for cicular traj


%% Obstacles Settings
%Only circular obstacles included for now
settings.ObstacleCenter = [0,0;30,3;80,0];
settings.ObstacleRadii = [10,4,5];

%% Graph settings
settings.AxisMode = 'auto'; %Options: 'auto', 'fixed'
settings.axis = [-75,75,-75,75];

%% Timer Settings                                    
%settings.dt = 0.01; %[s] simulated time step
settings.dtPlot = 0.5; %[s] frame shown in these time steps
settings.period = 0.001; %Time between calls for timerfunc. Min is 0.001
settings.iteration = 800; %Number of iterations for timerfunc


%% Simulation Settings
settings.SimMode = 'algorithm3'; %Options: algorithm1, algorithm2, algorithm3 as in paper.
settings.captureBool = 0; %Capture Video (Yes: 1, No: 0);


end