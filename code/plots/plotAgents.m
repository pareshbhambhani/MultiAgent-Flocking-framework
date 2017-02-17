function [hAgents,hLines] = plotAgents(agents,settings)
%PLOTAGENTS plots all agents and in future plot obstacles too
% returns the handle to all agent circles (hAgents

r = settings.r;
NSpecies = settings.NSpecies;
NAgents = settings.NAgents;
hAgents = cell(1,NSpecies);
hLines = cell(1,NSpecies);
total_agents = cell2mat(agents'); % List all the agents in one array

%Color for agents
color = hsv(NSpecies);

%Plot agents
for i = 1:NSpecies
    for k = 1:NAgents(i)   
        hAgents{1,i}(k) = plotAgentTriangle(agents{1,i}(k,:), settings,color(i,:));
    end
end

%Plot connecting lines
for l = 1:NSpecies
    for j = 1:NAgents(l)
      for i = 1:length(total_agents)
          if (norm([total_agents(i,1),total_agents(i,2)]-[agents{1,l}(j,1),agents{1,l}(j,2)]) < r(l))
              hLines{1,l}(i,j) = plotAgentLines([total_agents(i,1),total_agents(i,2)],[agents{1,l}(j,1),agents{1,l}(j,2)]);
              set(hLines{1,l}(i,j), 'UserData', [1,j]);
          else
              hLines{1,l}(i,j) = plotAgentLines([0,0],[0,0]);
              set(hLines{1,l}(i,j), 'UserData', [1,j]);
          end
      end
    end
end




end


