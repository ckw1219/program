clear all

 v_start = 5;
 v_end = 10;
 theta_end = 1/6;
 amax = 1;

 x_first = 37;
 y_first = 5;
 z_first = 5.5;
 initial_theta = atan(z_first/y_first); 
 
 [v_mid,theta_mid,data,xxxx,yyyy] = locate_v_t_mid(v_start,v_end,theta_end,amax,x_first,y_first,z_first);
 [path1_data,path2_data,path2_data_trans,path_data_total,path1_xy,path2_xy] = trajectory_calcultion_test(v_start,v_mid,theta_mid,v_end,theta_end,amax);
%  [t_y,t_z] = two_to_three_yz(initial_theta);
%  [xyz_1,xyz_2,xyz_total] = final_xyz(t_y,t_z,path1_xy,path2_xy);
 
%  [path1_data,path2_data,path2_data_trans,path_data_total,path1_xy,path2_xy]=trajectory_calcultion(v_start,v_mid,theta_mid,v_end,theta_end,amax);
% [t,x,y,c,k] = ck_calculation_test(7.0326,10,-0.1667+0.2010,1)