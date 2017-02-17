function [ agents ] = createAgents( settings )
%CREATEAGENTS generates agent matrix randomly with the position and
%velocities as specified in the settings

%copy settings to local variables
NSpecies = settings.NSpecies;
NAgents = settings.NAgents;
PosMean = settings.PosMeanAgentsIni;
PosVar = settings.PosVarAgentsIni;
VelInterv = settings.VelIntervAgentsIni;
distance = settings.agentPositionFixedDist;



% build agents matrix
agents = cell(1,NSpecies);

if strcmp(settings.agentPositionStyle,'random')

for i = 1:NSpecies
    % Agent positions
    agents{1,i}(:,1) = normrnd(PosMean(i,1),PosVar(i,1),[NAgents(i),1]); % Normal distribution with specified mean and variance for x position of all N agents
    agents{1,i}(:,2) = normrnd(PosMean(i,2),PosVar(i,2),[NAgents(i),1]); % Normal distribution with specified mean and variance for y position of all N agents

    % Agent Velocities
    agents{1,i}(:,3) = (VelInterv(i,2)-VelInterv(i,1)).*rand(NAgents(i),1) + VelInterv(i,1); % Uniform distribution of vel_x values between the Velocity interval specified in settings
    agents{1,i}(:,4) = (VelInterv(i,2)-VelInterv(i,1)).*rand(NAgents(i),1) + VelInterv(i,1); % Uniform distribution of vel_y values between the Velocity interval specified in settings
end

elseif strcmp(settings.agentPositionStyle,'fixed_circle')
    %gamma agent%
    if (strcmp(settings.GammaTraj,'point') || strcmp(settings.GammaTraj,'line'))
        gamma_agent = settings.qd;
    elseif strcmp(settings.GammaTraj,'circle')
        gamma_agent = [settings.GammaRad*cos(settings.GammaPhase),settings.GammaRad*cos(settings.GammaPhase)];
    end
    
    for i = 1:NSpecies
        N = NAgents(i);
        angle = 2*pi/N;
        radius = distance(i);
        pos = zeros(N,4);
        for j = 1:N
            pos(j,1) = gamma_agent(1) + radius * sin(j * angle);
            pos(j,2) = gamma_agent(2) + radius * cos(j * angle);
        end
        agents{1,i} = pos;
    end
end