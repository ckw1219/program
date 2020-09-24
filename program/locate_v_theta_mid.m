function [v_mid,theta_mid] = locate_v_theta_mid(v_start,v_end,theta_end,amax,x,y,z)
    
%     %在t_tinintial+1的时间呢，可以到达的终点位置
    data = compute_xy_v(v_start,v_end,theta_end,amax);
    
    %判断随机生成的点(x,y,z)是否在终点区域内
    x_input = x;
    y_input = sqrt(y^2+z^2);
    
    %j的范围是0-360，i的范围是1-100
    [k,k1,j,i] = compute_k(x_input,y_input,data);
    
    if length(k) == length(k1) & eq(k,k1)
        v_mid = data(3,j,i);
        theta_mid = data(4,j,i);
    else
        v_mid = 0;
        theta_mid = 0;
        
    end
    
    
end
