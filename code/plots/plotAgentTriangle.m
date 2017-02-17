function h = plotAgentTriangle(agents,settings,color)
%PLOTAGENTTRIANGLE plots a golden isosceles triangle with centroid in [x,y]
%and height h
height = settings.HeightAgents;

dir = [agents(3),agents(4)];
dir = dir/norm(dir); %Unit vector of heading direction

x = agents(1); %Agent x pos
y = agents(2);%Agent y pos

vert = vertices(x,y,height,dir);

h = patch(vert(:,1),vert(:,2),color);





