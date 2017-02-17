function [ settings ] = createDefaultSettings(  )
% Function to produce a default setting for execution


%% Species settings
settings.NSpecies = 150;
settings.NAgents = ones(1,settings.NSpecies);


%% Agent settings
settings.mass = ones(1,settings.NSpecies); %mass of each agent (Put in for future use)
settings.PosMeanAgentsIni =  repmat([0,0],settings.NSpecies,1); % Initial mean position for agent distribution
settings.PosVarAgentsIni = repmat([50,50],settings.NSpecies,1); % Variance for intial distribution of agents
settings.VelIntervAgentsIni = repmat([-1,1],settings.NSpecies,1); % Initial velocity of agents is uniformly chosen at random between the limits
settings.HeightAgents = 2; %Height of agents represented as triangles
settings.d = linspace(5,20,settings.NSpecies); %target inter-agent distance
settings.r = 1.2*(settings.d); %interaction range alpha_agent - alpha_agent
settings.Gamma_c1 = 0.01*ones(1,settings.NSpecies); %c1 in ui_gamma (navigational feedback) positional weight
settings.Gamma_c2 = 0.95*ones(1,settings.NSpecies); %c2 in ui_gamma (navigational feedback) velocity weight
%settings.Species_c1 = repmat(0.5,settings.NSpecies); %Define the interspecies c1 weights. Matrix is NSpecies x NSpecies
%settings.Species_c2 = repmat(0.5,settings.NSpecies); %Define the interspecies c2 weights. Matrix is NSpecies x NSpecies
%Not needed right now. Uncomment for obst avoidance% 
%settings.d_prime = 0.6*d; %target alpha_agent - beta_agent distance
%settings.r_prime = 1.2*d_prime; %%interaction range alpha_agent - beta_agent

%% Default setting is random. Can update specific positions from file
settings.agentPositionStyle = 'random'; %options: 'random','filename'
settings.agentPositionFilename = ''; % full filename to file containing at
                                    % least the variable agents
 
%% Timer Settings                                    
%settings.dt = 0.01; %[s] simulated time step
settings.dtPlot = 0.5; %[s] frame shown in these time steps
settings.period = 0.001; %Time between calls for timerfunc. Min is 0.001
settings.iteration = 1500; %Number of iterations for timerfunc

%% Simulation Settings
settings.SimMode = 'algorithm2'; %Options: Alg1, Alg2, Alg3 as in paper
settings.captureBool = 1; %Capture Video (Yes: 1, No: 0);

%% Gamma agent settings
settings.qd = [0,0]; %Static gamma agent
settings.pd = [0,0];% static gamma agent


%% Graph settings
settings.AxisMode = 'fixed'; %Options: 'auto', 'fixed'
settings.axis = [-100,100,-100,100];
end