function plotObj = plotInit(simulationObj, settings,hFigure)
%PLOTINIT plots agents (Obstacles in future)
% returns the handle array to the plotted agents in plotObj

NSpecies = settings.NSpecies;
agents = simulationObj.agents;
meanpos = max(settings.PosMeanAgentsIni);
var = max(settings.PosVarAgentsIni);



figure(hFigure);

if strcmp(settings.SimMode, 'algorithm2') || strcmp(settings.SimMode, 'algorithm3')
%Plot Gamma Agent
if (strcmp(settings.GammaTraj,'point') || strcmp(settings.GammaTraj,'line'))
    gamma_agent = settings.qd;
elseif strcmp(settings.GammaTraj,'circle')
    gamma_agent = [settings.GammaRad*cos(settings.GammaPhase),settings.GammaRad*cos(settings.GammaPhase)];
end
hGamma = plot(gamma_agent(1),gamma_agent(2),'rx');
plotObj.hGamma = hGamma;
end

%Plot Obstacles
if strcmp(settings.SimMode, 'algorithm3')
    [hObstacles] = plotObstacles(simulationObj.obstacles);
    plotObj.hObstacles = hObstacles;
end

% plot agents and Lines
[hAgents,hLines] = plotAgents(agents, settings);
%daspect([1,1,1]);

daspect([1,1,1])
%axis auto;
grid on;

if strcmp(settings.AxisMode,'auto')
    axis([(meanpos(1) - var(1)),(meanpos(1) + var(1)),(meanpos(2) - var(2)),(meanpos(2) + var(2))]);
end

if strcmp(settings.AxisMode,'fixed')
    axis(settings.axis);
end

set(gcf,'Outerposition',[100, 250, 775, 700 ]);


plotObj.hAgents = hAgents;
plotObj.hLines = hLines;


plotObj.Axes = gca;
plotObj.LineLim = get(gca,'XLim');
end

