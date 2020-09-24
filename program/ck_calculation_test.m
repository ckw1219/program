function [t,x,y,C,K]=ck_calculation_test(v_start,v_end,theta_end,amax)

theta_end = abs(theta_end);
%计算C,K数值
CK=atan((v_end*cos(theta_end)-v_start)/(v_end*sin(theta_end)));
C=v_start*cos(CK);
K=CK/C;

t=C/amax*(tan(theta_end+CK)-tan(CK));

%计算x，y路程
%x=int(C^2/amax*cos(theta)/(cos(theta+C*K))^3,theta)
%y=int(C^2/amax*sin(theta)/(cos(theta+C*K))^3,theta)
x=C^2/amax*(-(cos(2*theta_end)*sin(C*K) - sin(C*K) + 2*sin(2*theta_end)*cos(C*K))/(2*cos(2*theta_end)*cos(C*K)^2 - 4*cos(2*theta_end)*cos(C*K)^4 - 2*cos(C*K)^2 + 4*sin(2*theta_end)*cos(C*K)^3*sin(C*K))) ...
   -C^2/amax*(-(cos(2*0)*sin(C*K) - sin(C*K) + 2*sin(2*0)*cos(C*K))/(2*cos(2*0)*cos(C*K)^2 - 4*cos(2*0)*cos(C*K)^4 - 2*cos(C*K)^2 + 4*sin(2*0)*cos(C*K)^3*sin(C*K)));
y=C^2/amax*(-(4*(cos(2*theta_end)/4 - 1/4))/(2*cos(C*K) + cos(2*theta_end + C*K) + cos(2*theta_end + 3*C*K))) ...
   -C^2/amax*(-(4*(cos(2*0)/4 - 1/4))/(2*cos(C*K) + cos(2*0 + C*K) + cos(2*0 + 3*C*K)));   

end