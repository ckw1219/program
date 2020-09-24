 clear all
 

 tic
 
%  coordinates_now = ones(1,5);
%  coordinates_last = ones(1,5);
 %初始状态
 v_start = 5;
 v_end = 10;
 theta_end = 1/6;
 
 v_start2 = 10;
 theta_start2 = 1/6;
 v_end2 = 20;
 theta_end2 = 1/3;
 amax = 1;
 %由初始位置来确定初始平面已经夹角 -0.0682 0.8964
 x_first = 37;
 y_first = 5;
 z_first = 5.5;
 
 x_second = 200;
 y_second = 100;
 z_second = 100;
 
 initial_theta = atan(z_first/y_first);
 
 r_xyz = ones(4,1);
 r_xyz(1,1) = x_second;
 r_xyz(2,1) = y_second;
 r_xyz(3,1) = z_second;
 
 ones_diag = ones(1,4);
 x_move = x_first;
 y_move = y_first;
 z_move = z_first;
 space_M = diag(ones_diag);
 space_M(1,4) = x_move;
 space_M(2,4) = y_move;
 space_M(3,4) = z_move;
 

 theta = theta_end;
 %以z轴为旋转轴
 space_R = diag(ones_diag);
 space_R(1,1) = cos(theta);
 space_R(1,2) = sin(theta);
 space_R(2,1) = -sin(theta);
 space_R(2,2) = cos(theta);
 %以x轴为旋转轴
 theta1 = initial_theta;
 space_R1 = diag(ones_diag);
 space_R1(2,2) = cos(theta1);
 space_R1(2,3) = sin(theta1);
 space_R1(3,2) = -sin(theta1);
 space_R1(3,3) = cos(theta1);
 
 r_xyz = inv(space_R)*inv(space_R1)*inv(space_M)*r_xyz;
 
 initial_theta2 = atan(r_xyz(3,1)/r_xyz(2,1));
    
%  data = compute_xy_v(v_start,v_end,theta_end,amax);
 [v_mid,theta_mid,data] = locate_v_t_mid(v_start,v_end,theta_end,amax,x_first,y_first,z_first);
 [path1_data,path2_data,path2_data_trans,path_data_total,path1_xy,path2_xy] = trajectory_calcultion(v_start,v_mid,theta_mid,v_end,theta_end,amax);
 [t_y,t_z] = two_to_three_yz(initial_theta);
 [xyz_1,xyz_2,xyz_total] = final_xyz(t_y,t_z,path1_xy,path2_xy);
 
 x2 = r_xyz(1,1);
 y2 = r_xyz(2,1);
 z2 = r_xyz(3,1);
%  data2 = compute_xy_v(v_start2,v_end2,theta_end2-theta_start2,amax);
 [v_mid2,theta_mid2,data2] = locate_v_t_mid(v_start2,v_end2,theta_end2-theta_start2,amax,x2,y2,z2);
 [path1_data2,path2_data2,path2_data_trans2,path_data_total2,path1_xy2,path2_xy2] = trajectory_calcultion(v_start2,v_mid2,theta_mid2,v_end2,theta_end2-theta_start2,amax);
 [t_y2,t_z2] = two_to_three_yz(initial_theta2);
 [xyz_12,xyz_22,xyz_total2] = final_xyz(t_y2,t_z2,path1_xy2,path2_xy2);
 
 
 xyz_total2(4,:) = 1;
 xyz_total2 = space_M*space_R1*space_R*xyz_total2;
 
 toc
 
% 
% v_start2 = v_end;
% theta_start2 = theta_end;
% v_end2 = 20;
% theta_end2 = 1/3-theta_start2;
% amax2 = 1;
% 
% x2 = 150;
% y2 = 50;
% z2 = 50;
% 
% data2 = compute_xy_v(v_start2,v_end2,theta_end2,amax2);
% [v_mid2,theta_mid2] = locate_v_t_mid(v_start2,v_end2,theta_end2,amax2,x2,y2,z2);
% [path1_data2,path2_data2,path2_data_trans2,path_data_total2,path1_xy,path2_xy2] = trajectory_calcultion(v_start2,v_mid2,theta_mid2,v_end2,theta_end2,amax2);



%  
%  
%  data = compuate_xy_v(v_start,v_end,theta_end,amax);
%  
%  x = x1;
%  y = sqrt(y1^2+z1^2);
%  
%  [k,k1,j,i] = compuate_k(x,y,data);
%  
%  if length(k) == length(k1) & eq(k,k1) 
%      flag = 1;
%      v_mid = data(3,j,i);
%      theta_mid = data(4,j,i);
%  end
%  


%  ones_diag = ones(1,4);
%  x_move = -x_first;
%  y_move = -y_first;
%  z_move = -z_first;
%  space_M = diag(ones_diag);
%  space_M(1,4) = x_move;
%  space_M(2,4) = y_move;
%  space_M(3,4) = z_move;
%  
% 
%  theta = -theta_end;
%  %以z轴为旋转轴
%  space_R = diag(ones_diag);
%  space_R(1,1) = cos(theta);
%  space_R(1,2) = -sin(theta);
%  space_R(2,1) = sin(theta);
%  space_R(2,2) = cos(theta);
%  %以x轴为旋转轴
%  theta1 = -initial_theta;
%  space_R1 = diag(ones_diag);
%  space_R1(2,2) = cos(theta1);
%  space_R1(2,3) = -sin(theta1);
%  space_R1(3,2) = sin(theta1);
%  space_R1(3,3) = cos(theta1);

 
 

 
 
 
 
 
 
 
 
 