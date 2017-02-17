function [ obstacles ]  = createObstacles(settings)
%CreateObstacles generates circular obstacles at given points and of given
%radii

%copy settings to local variables

centers = settings.ObstacleCenter;
radii = settings.ObstacleRadii;

obstacles = zeros(length(radii),3);

for i = 1:length(radii)
    obstacles(i,:) = [centers(i,:) radii(i)];
end
