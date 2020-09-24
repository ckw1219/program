
function [t,x,y,v,theta]=xy_calcultion(v_start,v_mid,theta_mid,v_end,theta_end,amax)


[t1,x1,y1,C1,K1]=ck_calculation(v_start,v_mid,theta_mid,amax);
[t2,x2,y2,C2,K2]=ck_calculation(v_mid,v_end,theta_end-theta_mid,amax);
 
M(1,1)=cos(theta_mid);
M(1,2)=-sin(theta_mid);
M(1,3)=x1;
M(2,1)=sin(theta_mid);
M(2,2)=cos(theta_mid);
M(2,3)=y1;
M(3,1)=0;
M(3,2)=0;
M(3,3)=1;
if theta_mid <0
    y1 = -y1;
end

if theta_end-theta_mid < 0
    y2 = -y2;
end

xy_temp=M*[x2;y2;1];
t=t1+t2;
x=xy_temp(1);
y=xy_temp(2);
v=v_end;
theta=theta_end;

end

