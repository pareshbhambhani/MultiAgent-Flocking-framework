function h = plotAgentCircle(x,y,settings)
%PLOTAGENTCIRCLE plots a circle with center in [x,y] and radius r
rad = settings.RadAgents;
meanpos = settings.PosMeanAgentsIni;
var = settings.PosVarAgentsIni;
d = rad*2;
px = x-rad;
py = y-rad;
h = rectangle('Position',[px py d d],'Curvature',[1,1], 'FaceColor', 'y', 'edgeColor','k');
%h = plot(x,y,'o');
daspect([1,1,1])
axis auto;
grid on;
axis([(meanpos(1) - var),(meanpos(1) + var),(meanpos(2) - var),(meanpos(2) + var)]);
set(gcf,'Outerposition',[100, 250, 775, 700 ])

end