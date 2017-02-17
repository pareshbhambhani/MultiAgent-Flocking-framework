function [ simulationObj ] = agentsStep( simObj, settings)

%AGENTSSTEP calculates 
%1. the new agent matrix after one time step with ode23 and the right hand side of the ODE of this model defined by odeRhs
%2. the new position of gamma agent

agents = simObj.agents;
%gamma_agent = simObj.gamma;
t = simObj.tSimulation;
dt = settings.dtPlot; %get 'dt'
NAgents = settings.NAgents;
TotAgents = cumsum(NAgents);
TotAgents = TotAgents(end);

%%----------------ode23 integration for agents step----------------------%%
odeVec = reshape(cell2mat(agents'),4*sum(NAgents),1); %create 'odeVec' initial state column vector
odeOptions = odeset('AbsTol',1e-1,'RelTol',1e-1);
tic;
[tVec, odeAgents] = ode23(@(t,y)odeRhs(t,y,settings,simObj),[t,t+dt],odeVec,odeOptions); %solve ODE with 'ode23'
t_ode = toc;
fprintf('\n ODE time = %f \n', t_ode);
fprintf('ODE internal steps = %d \n',length(odeAgents(:,1)));
odeAgents = reshape(odeAgents(end,:),TotAgents,4);
agents = mat2cell(odeAgents,NAgents)';

%Update simulation object
simulationObj.agents = agents;
simulationObj.tSimulation = tVec(end);

if strcmp(settings.SimMode, 'algorithm2') || strcmp(settings.SimMode, 'algorithm3')
    gamma_agent = simObj.gamma;
%%------------update Gamma Agent position and velocity-------------------%%    
if strcmp(settings.GammaTraj,'line')
    gamma_new = [gamma_agent(1)+gamma_agent(3)*dt,gamma_agent(2)+gamma_agent(4)*dt,gamma_agent(3:4)]; %velocity is constant. New pos will be prev pos + vel*time. New vel will be same as prev.

elseif strcmp(settings.GammaTraj,'circle')
    r = settings.GammaRad;
    w = settings.GammaAngular;
    center = settings.qd;
    gamma_new = [center(1)+r*cos(w*t),center(2)+r*sin(w*t),-r*w*sin(w*t),r*w*cos(w*t)]; %since x = rcos(wt),y = rsin(wt),vx = -rwsin(wt), vy = rwcos(wt);

elseif strcmp(settings.GammaTraj,'point')
    gamma_new = gamma_agent; %position stays constant if fixed point
end
%Update simulation object
simulationObj.gamma = gamma_new;
end

%Update simulation object
if strcmp(settings.SimMode, 'algorithm3')
    simulationObj.obstacles = simObj.obstacles;
end

end