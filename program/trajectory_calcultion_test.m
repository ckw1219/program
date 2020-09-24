
function [path1_data,path2_data,path2_data_trans,path_data_total,path1_xy,path2_xy]=trajectory_calcultion_test(v_start,v_mid,theta_mid,v_end,theta_end,amax)


[t1,x1,y1,C1,K1]=ck_calculation(v_start,v_mid,theta_mid,amax);
[t2,x2,y2,C2,K2]=ck_calculation(v_mid,v_end,theta_end-theta_mid,amax);

% t1 = abs(t11);
% t2 = abs(t22);

% path1_data=zeros(5,ceil(t1));
path1_data=zeros(5,ceil(t1));
% path2_data=zeros(5,ceil(t2));
path2_data=zeros(5,ceil(t2));


for i=1:1:ceil(t1*10)
    t=0.1*i;
    if i==ceil(t1*10)
        t=t1;
    end
    C=C1;
    K=K1;
    theta=atan(tan(C*K)+t*amax/C)-C*K;
    v=C/cos(theta+C*K);
    x=C^2/amax*(-(cos(2*theta)*sin(C*K) - sin(C*K) + 2*sin(2*theta)*cos(C*K))/(2*cos(2*theta)*cos(C*K)^2 - 4*cos(2*theta)*cos(C*K)^4 - 2*cos(C*K)^2 + 4*sin(2*theta)*cos(C*K)^3*sin(C*K))) ...
       -C^2/amax*(-(cos(2*0)*sin(C*K) - sin(C*K) + 2*sin(2*0)*cos(C*K))/(2*cos(2*0)*cos(C*K)^2 - 4*cos(2*0)*cos(C*K)^4 - 2*cos(C*K)^2 + 4*sin(2*0)*cos(C*K)^3*sin(C*K)));
    y=C^2/amax*(-(4*(cos(2*theta)/4 - 1/4))/(2*cos(C*K) + cos(2*theta + C*K) + cos(2*theta + 3*C*K))) ...
       -C^2/amax*(-(4*(cos(2*0)/4 - 1/4))/(2*cos(C*K) + cos(2*0 + C*K) + cos(2*0 + 3*C*K)));   
    path1_data(1,i)=t;
    path1_data(2,i)=x;
    path1_data(3,i)=y;
    path1_data(4,i)=v;
    path1_data(5,i)=theta;
    
end   
    
for i=1:1:ceil(t2*10)
    t=0.1*i;
    if i==ceil(t2*10)
        t=t2;
    end
    C=C2;
    K=K2;
    theta=atan(tan(C*K)+t*amax/C)-C*K;
    v=C/cos(theta+C*K);
    x=C^2/amax*(-(cos(2*theta)*sin(C*K) - sin(C*K) + 2*sin(2*theta)*cos(C*K))/(2*cos(2*theta)*cos(C*K)^2 - 4*cos(2*theta)*cos(C*K)^4 - 2*cos(C*K)^2 + 4*sin(2*theta)*cos(C*K)^3*sin(C*K))) ...
       -C^2/amax*(-(cos(2*0)*sin(C*K) - sin(C*K) + 2*sin(2*0)*cos(C*K))/(2*cos(2*0)*cos(C*K)^2 - 4*cos(2*0)*cos(C*K)^4 - 2*cos(C*K)^2 + 4*sin(2*0)*cos(C*K)^3*sin(C*K)));
    y=C^2/amax*(-(4*(cos(2*theta)/4 - 1/4))/(2*cos(C*K) + cos(2*theta + C*K) + cos(2*theta + 3*C*K))) ...
       -C^2/amax*(-(4*(cos(2*0)/4 - 1/4))/(2*cos(C*K) + cos(2*0 + C*K) + cos(2*0 + 3*C*K)));  
    path2_data(1,i)=t;
    path2_data(2,i)=x;
    path2_data(3,i)=-y;
    path2_data(4,i)=v;
    path2_data(5,i)=-theta;
    
end       
    
% M(1,1)=cos(theta_mid);
% M(1,2)=-sin(theta_mid);
% M(1,3)=path1_data(2,ceil(t1*10));
% M(2,1)=sin(theta_mid);
% M(2,2)=cos(theta_mid);
% M(2,3)=path1_data(3,ceil(t1*10));
% M(3,1)=0;
% M(3,2)=0;
% M(3,3)=1;

M(1,1)=cos(theta_mid);
M(1,2)=-sin(theta_mid);
M(1,3)=path1_data(2,end);
M(2,1)=sin(theta_mid);
M(2,2)=cos(theta_mid);
M(2,3)=path1_data(3,end);
M(3,1)=0;
M(3,2)=0;
M(3,3)=1;

% M = inv(M);

path2_data_temp=zeros(3,ceil(t2*10));
path2_data_temp(1,:)=path2_data(2,:);
path2_data_temp(2,:)=path2_data(3,:);
path2_data_temp(3,:)=1;
trajectory_temp=M*path2_data_temp;
path2_data_trans(1,:)=path2_data(1,:)+t1;
path2_data_trans(2,:)=trajectory_temp(1,:);
path2_data_trans(3,:)=trajectory_temp(2,:);
path2_data_trans(4,:)=path2_data(4,:);
path2_data_trans(5,:)=path2_data(5,:)+theta_mid;

path_data_total=[path1_data path2_data_trans];

path1_xy = path1_data(2:3,:);
path2_xy = path2_data_trans(2:3,:);
end

