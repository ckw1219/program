
coordinates_now = [x,y,z,v,theta];

coordinates_last = [x,y,z,v,theta];


%����ϵ��ת�ĽǶ�Ϊtheta_last,ƽ�Ƶľ���Ϊx_last,y_last
%ƽ����ת��ƽ��
theta_rotate = theta_last;
x_move = x_last;
y_move = y_last

surface_R = zeros(3,3);
surface_R(1,1) = cos(theta_rotate);%��תƽ�ƾ���
surface_R(1,2) = -sin(theta_rotate);
surface_R(1,3) = x_move;
surface_R(2,1) = sin(theta_rotate);
surface_R(2,2) = cos(theta_rotate);
surface_R(2,3) = y_move;
surface_R(3,1) = 0;
surface_R(3,2) = 0;
surface_R(3,3) = 1;

coordinates_compuate = surface_R*[x,y,z]

%�������֮�󣬽��������Move_R�������
%Ȼ��ͨ����ʼƽ��Ľ�������x,y,z.

%�ռ���ת��ƽ�ƣ��ռ��theta,theta1
ones_diag = ones(1,4);
%��z��Ϊ��ת��
space_R = zeros(ones_diag);
space_R(1,1) = cos(theta);
space_R(1,2) = -sin(theta);
space_R(2,1) = sin(theta);
space_R(2,2) = cos(theta);
%��x��Ϊ��ת��
space_R1 = zeros(ones_diag);
space_R1(2,2) = cos(theta1);
space_R1(2,3) = -sin(theta1);
space_R1(3,2) = sin(theta);
space_R1(3,3) = cos(theta);
%�ռ�ƽ�ƾ���
space_M = diag(ones_diag);
space_M(1,4) = x_move;
space_M(2,4) = y_move;
space_M(3,4) = z_move;


