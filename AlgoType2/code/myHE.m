function myHE()
ip_pic1 = imread('./../data/TEM.png');
[m,n] = size(ip_pic1);

figure
subplot(2,1,1);
imshow(ip_pic1), colorbar;
axis([0 n 0 m]), axis on
op_pic1 = zeros(m,n, 'uint8');
intensity_arr= zeros(1,256);
density_arr = zeros(1,256);
no_of_pixel = m*n;

for i = 1: m
    for j = 1 : n
        x= ip_pic1(i,j)+1;
        intensity_arr(x) = intensity_arr(x) + 1;
    end
end

density_arr(1)= intensity_arr(1) / no_of_pixel;

for i = 2:256
     density_arr(i) = density_arr(i-1) + intensity_arr(i) / no_of_pixel;
end

for i = 1: m
    for j = 1 : n
        x = ip_pic1(i,j) + 1;
        op_pic1(i,j) = round(density_arr(x) * 255);
    end
end

subplot(2,1,2);
imshow(op_pic1), colorbar;
axis([0 n 0 m]), axis on

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%5 grayscale 2%%%%%%%%%%%%%%%%%%%%%%%%%%%5

ip_pic2 = imread('./../data/barbara.png');
[m,n] = size(ip_pic2);

figure
subplot(2,1,1);
imshow(ip_pic2), colorbar;
axis([0 n 0 m]), axis on
op_pic2 = zeros(m,n, 'uint8');
intensity_arr= zeros(1,256);
density_arr = zeros(1,256);
no_of_pixel = m*n;

for i = 1: m
    for j = 1 : n
        x= ip_pic2(i,j)+1;
        intensity_arr(x) = intensity_arr(x) + 1;
    end
end

density_arr(1)= intensity_arr(1) / no_of_pixel;

for i = 2:256
     density_arr(i) = density_arr(i-1) + intensity_arr(i) / no_of_pixel;
end

for i = 1: m
    for j = 1 : n
        x = ip_pic2(i,j) + 1;
        op_pic2(i,j) = round(density_arr(x) * 255);
    end
end

subplot(2,1,2);
imshow(op_pic2), colorbar;
axis([0 n 0 m]), axis on

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% color image%%%%%%%%%%%%%%%%

ip_pic3 = imread('./../data/canyon.png');
[m,n,d] = size(ip_pic3);

figure
subplot(2,1,1);
imshow(ip_pic3), colorbar;
axis([0 n 0 m]), axis on
op_pic3 = zeros(m,n,d, 'uint8');

intensity_arr_red = zeros(1,256);
intensity_arr_green = zeros(1,256);
intensity_arr_blue = zeros(1,256);

density_arr_red = zeros(1,256);
density_arr_green = zeros(1,256);
density_arr_blue = zeros(1,256);

no_of_pixel = m*n;

for i = 1: m
    for j = 1 : n
        x_red = ip_pic3(i,j,1)+1;
        intensity_arr_red(x_red) = intensity_arr_red(x_red) + 1;
        
        x_green = ip_pic3(i,j,2)+1;
        intensity_arr_green(x_green) = intensity_arr_green(x_green) + 1;
        
        x_blue = ip_pic3(i,j,3)+1;
        intensity_arr_blue(x_blue) = intensity_arr_blue(x_blue) + 1;
    end
end

density_arr_red(1)= intensity_arr_red(1) / no_of_pixel;
density_arr_green(1)= intensity_arr_green(1) / no_of_pixel;
density_arr_blue(1)= intensity_arr_blue(1) / no_of_pixel;

for i = 2:256
     density_arr_red(i) = density_arr_red(i-1) + intensity_arr_red(i) / no_of_pixel;
     density_arr_green(i) = density_arr_green(i-1) + intensity_arr_green(i) / no_of_pixel;
     density_arr_blue(i) = density_arr_blue(i-1) + intensity_arr_blue(i) / no_of_pixel;
end

for i = 1: m
    for j = 1 : n
        x_red = ip_pic3(i,j,1) + 1;
        op_pic3(i,j,1) = round(density_arr_red(x_red) * 255);
        
        x_green = ip_pic3(i,j,2) + 1;
        op_pic3(i,j,2) = round(density_arr_green(x_green) * 255);
        
        x_blue = ip_pic3(i,j,3) + 1;
        op_pic3(i,j,3) = round(density_arr_blue(x_blue) * 255);
    end
end

subplot(2,1,2);
imshow(op_pic3), colorbar;
axis([0 n 0 m]), axis on


end


