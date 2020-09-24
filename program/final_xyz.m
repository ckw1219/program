function [xyz_1,xyz_2,xyz_total] = final_xyz(t_y,t_z,path1_xy,path2_xy)

path1xy = t_y*path1_xy;
path1xz = t_z*path1_xy;

path2xy = t_y*path2_xy;
path2xz = t_z*path2_xy;

xyz_1 = [path1xy;path1xz(2,:)];
xyz_2 = [path2xy;path2xz(2,:)];
xyz_total = [xyz_1 xyz_2];

end