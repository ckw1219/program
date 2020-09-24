
coordinates_now = [x,y,z,v,theta];

coordinates_last = [x,y,z,v,theta];


%坐标系旋转的角度为theta_last,平移的距离为x_last,y_last
%平面旋转和平移
theta_rotate = theta_last;
x_move = x_last;
y_move = y_last

surface_R = zeros(3,3);
surface_R(1,1) = cos(theta_rotate);%旋转平移矩阵
surface_R(1,2) = -sin(theta_rotate);
surface_R(1,3) = x_move;
surface_R(2,1) = sin(theta_rotate);
surface_R(2,2) = cos(theta_rotate);
surface_R(2,3) = y_move;
surface_R(3,1) = 0;
surface_R(3,2) = 0;
surface_R(3,3) = 1;

coordinates_compuate = surface_R*[x,y,z]

%计算完成之后，将坐标乘以Move_R的逆矩阵
%然后通过初始平面的角来反算x,y,z.

%空间旋转和平移，空间叫theta,theta1
ones_diag = ones(1,4);
%以z轴为旋转轴
space_R = zeros(ones_diag);
space_R(1,1) = cos(theta);
space_R(1,2) = -sin(theta);
space_R(2,1) = sin(theta);
space_R(2,2) = cos(theta);
%以x轴为旋转轴
space_R1 = zeros(ones_diag);
space_R1(2,2) = cos(theta1);
space_R1(2,3) = -sin(theta1);
space_R1(3,2) = sin(theta);
space_R1(3,3) = cos(theta);
%空间平移矩阵
space_M = diag(ones_diag);
space_M(1,4) = x_move;
space_M(2,4) = y_move;
space_M(3,4) = z_move;


