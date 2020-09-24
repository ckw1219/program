function [v_mid,theta_mid] = locate_v_theta_mid(v_start,v_end,theta_end,amax,x,y,z)
    
%     %��t_tinintial+1��ʱ���أ����Ե�����յ�λ��
    data = compute_xy_v(v_start,v_end,theta_end,amax);
    
    %�ж�������ɵĵ�(x,y,z)�Ƿ����յ�������
    x_input = x;
    y_input = sqrt(y^2+z^2);
    
    %j�ķ�Χ��0-360��i�ķ�Χ��1-100
    [k,k1,j,i] = compute_k(x_input,y_input,data);
    
    if length(k) == length(k1) & eq(k,k1)
        v_mid = data(3,j,i);
        theta_mid = data(4,j,i);
    else
        v_mid = 0;
        theta_mid = 0;
        
    end
    
    
end
