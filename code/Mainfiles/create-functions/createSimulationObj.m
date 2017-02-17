function simulationObj = createSimulationObj( settings, simulationObj)

%CREATESIMULATIONOBJ generates agent matrix dependent on settings
%   agents: [x, y, vx, vy]
%In future will generate obstacle matrix too

%% generate Agents
    
if strcmp(settings.agentPositionStyle,'filename')
    if exist(settings.agentPositionFilename, 'file') == 2
        if sum(strcmp(who('-file', settings.agentPositionFilename), 'agents')) == 1
            load(settings.agentPositionFilename, 'agents');
            if validateAgents(agents)
            else
                agents = [];
                errorOpenFileGui('filename',settings.agentPositionFilename);
            end
            agents = mat2cell(agents,settings.NAgents,4)';
        else
            agents = [];
            errorOpenFileGui('filename',settings.agentPositionFilename);
        end
    else
        agents = [];
        errorOpenFileGui('filename',settings.agentPositionFilename);
    end

elseif strcmp(settings.agentPositionStyle,'random') || strcmp(settings.agentPositionStyle,'fixed_circle')
    agents = createAgents(settings); 
    
else
    agents = [];
end
%save to simulationObj
simulationObj.agents = agents;

%% Generate Obstacles
if strcmp(settings.SimMode, 'algorithm3')
    obstacles = createObstacles(settings);
    %save to simulationObj
    simulationObj.obstacles = obstacles;
end

%% Gamma Agent
if strcmp(settings.SimMode, 'algorithm2') || strcmp(settings.SimMode, 'algorithm3')
if (strcmp(settings.GammaTraj,'point') || strcmp(settings.GammaTraj,'line'))
    gamma_agent = settings.qd;
elseif strcmp(settings.GammaTraj,'circle')
    gamma_agent = [settings.GammaRad*cos(settings.GammaPhase),settings.GammaRad*cos(settings.GammaPhase)];
end
GammaAgent = [gamma_agent,settings.pd];
%save to simulationObj
simulationObj.gamma = GammaAgent;

end



