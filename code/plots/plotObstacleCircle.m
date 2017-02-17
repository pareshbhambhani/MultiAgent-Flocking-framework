function h = plotObstacleCircle(x,y,r)

d = r*2;
h = rectangle('Position',[x-r, y-r, d, d],'Curvature',[1,1], 'FaceColor', 'k', 'edgeColor','r','LineWidth',1);
end
