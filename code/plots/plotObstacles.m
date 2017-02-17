function [hObstacles] = plotObstacles(obstacles)

for i = 1:length(obstacles(:,1))
    hObstacles(i) = plotObstacleCircle(obstacles(i,1),obstacles(i,2),obstacles(i,3));
end