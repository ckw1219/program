
function [k,k1,j_360,i_100] = compute_k(x,y,data)

    data_t  = ones(3,4);
    
    for n = 1:1:4
        data_t(1,n) = (x-data(1,n,1))^2+(y-data(2,n,1))^2;
    end
    j_360 = 0;
    i_100 = 0;
    
    for i = 1:1:100
        for j =1:1:360
            x_t = data(1,j,i);
            y_t = data(2,j,i);

            total = (x_t-x)^2+(y_t-y)^2;

            if total < data_t(1,1) ;
               data_t(1,4) = data_t(1,3);
               data_t(2,4) = data_t(2,3);
               data_t(3,4) = data_t(3,3);

               data_t(1,3) = data_t(1,2);
               data_t(2,3) = data_t(2,2);
               data_t(3,3) = data_t(3,2);

               data_t(1,2) = data_t(1,1);
               data_t(2,2) = data_t(2,1);
               data_t(3,2) = data_t(3,1);

               data_t(1,1) = total;
               data_t(2,1) = j;
               data_t(3,1) = i;

           elseif total < data_t(1,2);

               data_t(1,4) = data_t(1,3);
               data_t(2,4) = data_t(2,3);
               data_t(3,4) = data_t(3,3);

               data_t(1,3) = data_t(1,2);
               data_t(2,3) = data_t(2,2);
               data_t(3,3) = data_t(3,2);

               data_t(1,2) = total;
               data_t(2,2) = j;
               data_t(3,2) = i;

           elseif total < data_t(1,3);

               data_t(1,4) = data_t(1,3);
               data_t(2,4) = data_t(2,3);
               data_t(3,4) = data_t(3,3);

               data_t(1,3) = total;
               data_t(2,3) = j;
               data_t(3,3) = i;

           elseif total < data_t(1,4);

               data_t(1,4) = total;
               data_t(2,4) = j;
               data_t(3,4) = i;
            end
        end
    end

    data_x = zeros(5,2);
    data_x(1,1) = data(1,data_t(2,1),data_t(3,1));
    data_x(1,2) = data(2,data_t(2,1),data_t(3,1));
    data_x(2,1) = data(1,data_t(2,2),data_t(3,2));
    data_x(2,2) = data(2,data_t(2,2),data_t(3,2));
    data_x(3,1) = data(1,data_t(2,3),data_t(3,3));
    data_x(3,2) = data(2,data_t(2,3),data_t(3,3));
    data_x(4,1) = data(1,data_t(2,4),data_t(3,4));
    data_x(4,2) = data(2,data_t(2,4),data_t(3,4));

    [k,av] = convhull(data_x(1:4,:));

    data_x(5,1) = x;
    data_x(5,2) = y;
    [k1,av1] = convhull(data_x);
    
    j_360 = data_t(2,1);
    i_100 = data_t(3,1);
    
end