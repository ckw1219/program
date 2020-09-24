function [t_y,t_z] = two_to_three_yz(initial_theta)

    two_to_three_y = zeros(2,2);
    two_to_three_y(1,1) = 1;
    two_to_three_y(2,2) = cos(initial_theta);

    two_to_three_z = zeros(2,2);
    two_to_three_z(1,1) = 1;
    two_to_three_z(2,2) = sin(initial_theta);
    
    t_y = two_to_three_y;    
    t_z = two_to_three_z;
    
end
