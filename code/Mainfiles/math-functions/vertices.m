function vert = vertices(x,y,height,dir)
% vertices functions generates the vertices of a golden isosceles triangle
% given the centroid, the height and the heading direction of the triangle

theta = pi/10; %Angle between the height and one side of a golden triangle (angles of golden tri are 72,72,36)
Rot_pos = [cos(theta),-sin(theta);sin(theta),cos(theta)];
Rot_neg = [cos(theta),sin(theta);-sin(theta),cos(theta)];

vert1 = [x,y] + (2/3)*height*dir; %Heading vertice of the triangle
vert2 = vert1' + Rot_pos*3/2*([x,y]-vert1)'; %vector pointing from top vertice to centroid extended by *3/2 rotated by 18 degrees
vert3 = vert1' + Rot_neg*3/2*([x,y]-vert1)'; %vector pointing from top vertice to centroid extended by *3/2 rotated by -18 degrees

vert(1,:) = vert1;
vert(2,:) = vert2';
vert(3,:) = vert3';