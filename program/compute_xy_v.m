% 
%input:输入的初始速度，末状态的速度和角度，加速度
%
%output:终点坐标和中间拐点的速度和角度
%
%
function data = compute_xy_v(v_start,v_end,theta_end,amax)

[t_initial,~,~,C_initial,K_initial] = ck_calculation(v_start,v_end,theta_end,amax);

theta_rotate = pi/2-C_initial*K_initial;
x_m = C_initial/cos(C_initial*K_initial)+t_initial/2*cos(pi/2-C_initial*K_initial);
y_m = t_initial/2*sin(pi/2-C_initial*K_initial);

M_R = zeros(3,3);
M_R(1,1) = cos(theta_rotate);%旋转平移矩阵
M_R(1,2) = -sin(theta_rotate);
M_R(1,3) = x_m;
M_R(2,1) = sin(theta_rotate);
M_R(2,2) = cos(theta_rotate);
M_R(2,3) = y_m;
M_R(3,1) = 0;
M_R(3,2) = 0;
M_R(3,3) = 1;



% data = ones(4,360,100);
data = ones(36000,4);
 for t = 1:1:100
    
        t_total = t_initial+t/10;
    
        data_xy = ones(3,360);
        for i = 1:1:360
             theta = 2*pi/360*i;
             data_xy(1,i) = t_total/2 * cos(theta);
             data_xy(2,i)= sqrt(t_total^2/4-t_initial^2/4)* sin(theta);

        end

        data_xy_tran = M_R*data_xy;

    
        for i = 1:1:360
       
             v_mid = sqrt(data_xy_tran(1,i)^2+data_xy_tran(2,i)^2);
             theta_mid = atan(data_xy_tran(2,i)/data_xy_tran(1,i));
        
             [~,x,y,~,~]=xy_calcultion(v_start,v_mid,theta_mid,v_end,theta_end,amax);
             
%              data(1,i,t) = x;
%              data(2,i,t) = y;
%              data(3,i,t) = v_mid;
%              data(4,i,t) = theta_mid;
             
             data(i+(t-1)*360,1) = x;
             data(i+(t-1)*360,2) = y;
             data(i+(t-1)*360,3) = v_mid;
             data(i+(t-1)*360,4) = theta_mid;

       end    
 end
   
 
end

