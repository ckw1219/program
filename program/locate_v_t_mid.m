
function [v_mid,theta_mid,data,xxxx,yyyy] = locate_v_t_mid(v_start,v_end,theta_end,amax,x1,y1,z1)
    x = x1;
    y = sqrt(y1^2+z1^2);

    data = compute_xy_v(v_start,v_end,theta_end,amax);

    [k,av] = convhull(data(:,1),data(:,2));
    data(36001,1) = x;
    data(36001,2) = y;
    [k1,av1] = convhull(data(:,1),data(:,2));

    total = (data(36001,1)-data(1,1))^2+(data(36001,2)-data(1,2))^2;
    if  length(k) == length(k1) 
        if eq(k,k1)
            for i = 1:1:36000
                total1 = (data(36001,1)-data(i,1))^2+(data(36001,2)-data(i,2))^2;
                if total1 < total
                    total = total1;
                    v_mid = data(i,3);
                    theta_mid = data(i,4);
                    xxxx = data(i,1);
                    yyyy = data(i,2);
                end
            end
        end    
    else 
        v_mid = 0;
        theta_mid = 0;
    end
