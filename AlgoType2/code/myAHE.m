function myAHE(dim)

ip_pic = imread('./../data/barbara.png');

[m,n] = size(ip_pic);
op_pic = zeros(m,n, 'uint8');
figure
subplot(1,2,1);
imshow(ip_pic), colorbar;
axis([0 n 0 m]), axis on

dim_size = floor(dim/2);

for i = 1: m
    for j = 1 : n
        local_data = zeros(dim,dim, 'uint8');
        for k = 1: dim
            for l = 1 : dim
                if (i-dim_size + k -1 < 1) || (j-dim_size + l -1) < 1
                    local_data(k,l) = -1;
                elseif (i-dim_size + k -1 > m) || (j-dim_size + l -1) > n
                    local_data(k,l) = -1;   
                else
                    local_data(k,l) = ip_pic(i-dim_size + k -1, j-dim_size + l -1);
                end
            end
        end
        op_pic(i,j) = myAHE_compute(local_data);
    end
end

subplot(1,2,2);
imshow(op_pic), colorbar;
axis([0 n 0 m]), axis on

%%%%%%%%%%%%%%%%%%%%%% TEM %%%%%%%%%%%%%%%%%%%%%%%%%

ip_pic = imread('./../data/TEM.png');

[m,n] = size(ip_pic);
op_pic = zeros(m,n, 'uint8');
figure
subplot(1,2,1);
imshow(ip_pic), colorbar;
axis([0 n 0 m]), axis on

dim_size = floor(dim/2);

for i = 1: m
    for j = 1 : n
        local_data = zeros(dim,dim, 'uint8');
        for k = 1: dim
            for l = 1 : dim
                if (i-dim_size + k -1 < 1) || (j-dim_size + l -1) < 1
                    local_data(k,l) = -1;
                elseif (i-dim_size + k -1 > m) || (j-dim_size + l -1) > n
                    local_data(k,l) = -1;   
                else
                    local_data(k,l) = ip_pic(i-dim_size + k -1, j-dim_size + l -1);
                end
            end
        end
        op_pic(i,j) = myAHE_compute(local_data);
    end
end

subplot(1,2,2);
imshow(op_pic), colorbar;
axis([0 n 0 m]), axis on


%%%%%%%%%%%%%%%%%%%%%%%%%% COLOR %%%%%%%%%%%%%%%%%%%%%%%%%%%

ip_pic = imread('./../data/canyon.png');

[m,n,d] = size(ip_pic);
op_pic = zeros(m,n,d, 'uint8');
figure
subplot(1,2,1);
imshow(ip_pic), colorbar;
axis([0 n 0 m]), axis on

dim_size = floor(dim/2);

for i = 1: m
    for j = 1 : n
        local_data_red = zeros(dim,dim, 'uint8');
        local_data_green = zeros(dim,dim, 'uint8');
        local_data_blue = zeros(dim,dim, 'uint8');
        
        for k = 1: dim
            for l = 1 : dim
                if (i-dim_size + k -1 < 1) || (j-dim_size + l -1) < 1
                    local_data_red(k,l) = -1;
                    local_data_green(k,l) = -1;
                    local_data_blue(k,l) = -1;
                elseif (i-dim_size + k -1 > m) || (j-dim_size + l -1) > n
                    local_data_red(k,l) = -1;
                    local_data_green(k,l) = -1;
                    local_data_blue(k,l) = -1;  
                else
                    local_data_red(k,l) = ip_pic(i-dim_size + k -1, j-dim_size + l -1,1);
                    local_data_green(k,l) = ip_pic(i-dim_size + k -1, j-dim_size + l -1,2);
                    local_data_blue(k,l) = ip_pic(i-dim_size + k -1, j-dim_size + l -1,3);
                end
            end
        end
        op_pic(i,j,1) = myAHE_compute(local_data_red);
        op_pic(i,j,2) = myAHE_compute(local_data_green);
        op_pic(i,j,3) = myAHE_compute(local_data_blue);
    end
end


subplot(1,2,2);
imshow(op_pic), colorbar;
axis([0 n 0 m]), axis on


end