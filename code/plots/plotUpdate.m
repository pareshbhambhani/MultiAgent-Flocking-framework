function plotUpdate( plotObj,simulationObj, settings)
%PLOTUPDATE updates the position of the agent circles 
% hObj - handle to all agent circles
% agents - agent matrix
agents = simulationObj.agents;

r = settings.r;
height = settings.HeightAgents;
NSpecies = settings.NSpecies;
NAgents = settings.NAgents;
total_agents = cell2mat(agents');
x_lim = plotObj.LineLim;


%Update Agent position
for i = 1:NSpecies
    for j = 1:length(plotObj.hAgents{1,i})
        dir = [agents{1,i}(j,3),agents{1,i}(j,4)];
        dir = dir/norm(dir);
        vert = vertices(agents{1,i}(j,1),agents{1,i}(j,2),height,dir);
        set(plotObj.hAgents{1,i}(j), 'Vertices', vert);  
    end
end

%Update connecting lines
for l = 1:NSpecies
    for j = 1:NAgents(l)
      for i = 1:length(total_agents)
          if (norm([total_agents(i,1),total_agents(i,2)]-[agents{1,l}(j,1),agents{1,l}(j,2)]) < r(l))
              set(plotObj.hLines{1,l}(i,j), 'XData', [total_agents(i,1),agents{1,l}(j,1)],'YData',[total_agents(i,2),agents{1,l}(j,2)]);
          else
              set(plotObj.hLines{1,l}(i,j),'XData',[0,0],'YData',[0,0]);
          end
      end
    end
end

%Update Gamma Agent
if strcmp(settings.SimMode, 'algorithm2') || strcmp(settings.SimMode, 'algorithm3')
    gamma_agent = simulationObj.gamma;
set(plotObj.hGamma,'XData',gamma_agent(1),'YData',gamma_agent(2));

%Update Axes if Linear motion of Gamma
if strcmp(settings.GammaTraj,'line')
     set(plotObj.Axes,'XLim',(x_lim + gamma_agent(1)));
end
end

% %Update Obstacles
% if strcmp(settings.SimMode, 'algorithm3')
%     obstacles = simulationObj.obstacles;
%     set(plotObj.hObstalces,'Position',[obstacles(1) obstacles(2) 2*obstacles(3) 2*obstacles(3)]);
% end


end

