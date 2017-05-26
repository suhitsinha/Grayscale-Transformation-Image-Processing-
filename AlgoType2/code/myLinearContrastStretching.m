function myLinearContrastStretching()

ip_pic1 = imread('./../data/TEM.png');
[m,n] = size(ip_pic1);

figure
subplot(2,1,1);
imshow(ip_pic1), colorbar;
axis([0 n 0 m]), axis on
op_pic1 = zeros(m,n, 'uint8');
max_intensity = 0;
min_intensity = 255;

for i = 1: m
    for j = 1 : n
        
        if ip_pic1(i,j) > max_intensity
            max_intensity = ip_pic1(i,j);
        end
        
        if ip_pic1(i,j) < min_intensity
            min_intensity = ip_pic1(i,j);
        end
    end
end
span_intensity = max_intensity - min_intensity +1;
ratio_intensity = (255/double(span_intensity));



for i = 1: m
    for j = 1 : n
        op_pic1(i,j) = floor((double(ip_pic1(i,j)) - double(min_intensity)) * ratio_intensity);
    end
end

    subplot(2,1,2);
    imshow(op_pic1), colorbar;
    axis([0 n 0 m]), axis on

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

ip_pic1 = imread('./../data/barbara.png');
[m,n] = size(ip_pic1);

figure
subplot(2,1,1);
imshow(ip_pic1), colorbar;
axis([0 n 0 m]), axis on
op_pic1 = zeros(m,n, 'uint8');
max_intensity = 0;
min_intensity = 255;

for i = 1: m
    for j = 1 : n
        
        if ip_pic1(i,j) > max_intensity
            max_intensity = ip_pic1(i,j);
        end
        
        if ip_pic1(i,j) < min_intensity
            min_intensity = ip_pic1(i,j);
        end
        
    end
end
span_intensity = max_intensity - min_intensity +1;
ratio_intensity = (255/double(span_intensity));

for i = 1: m
    for j = 1 : n
        op_pic1(i,j) = floor((double(ip_pic1(i,j)) - double(min_intensity)) * ratio_intensity);
    end
end

    subplot(2,1,2);
    imshow(op_pic1), colorbar;
    axis([0 n 0 m]), axis on
    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%    color    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

ip_pic3 = imread('./../data/canyon.png');
[m,n,d] = size(ip_pic3);


figure
subplot(2,1,1);
imshow(ip_pic3), colorbar;
axis([0 n 0 m]), axis on
op_pic1 = zeros(m,n,d, 'uint8');

max_intensity_red = 0;
min_intensity_red = 255;

max_intensity_blue = 0;
min_intensity_blue = 255;

max_intensity_green = 0;
min_intensity_green = 255;

for i = 1: m
        for j = 1 : n
        
        if ip_pic3(i,j,1) > max_intensity_red
            max_intensity_red = ip_pic3(i,j,1);
        end
        
        if ip_pic3(i,j,1) < min_intensity_red
            min_intensity_red = ip_pic3(i,j,1);
        end

        if ip_pic3(i,j,2) > max_intensity_green
            max_intensity_green = ip_pic3(i,j,2);
        end
        
        if ip_pic3(i,j,2) < min_intensity_green
            min_intensity_green = ip_pic3(i,j,2);
        end
        
        if ip_pic3(i,j,3) > max_intensity_blue
            max_intensity_blue = ip_pic3(i,j,3);
        end
        
        if ip_pic3(i,j,3) < min_intensity_blue
            min_intensity_blue = ip_pic3(i,j,3);
        end
        end
end
span_intensity_red = max_intensity_red - min_intensity_red +1;
span_intensity_green = max_intensity_green - min_intensity_green +1;
span_intensity_blue = max_intensity_blue - min_intensity_blue +1;

ratio_intensity_red = (255/double(span_intensity_red));
ratio_intensity_green = (255/double(span_intensity_green));
ratio_intensity_blue = (255/double(span_intensity_blue));


for i = 1: m
    for j = 1 : n
        op_pic1(i,j,1) = floor((double(ip_pic3(i,j,1)) - double(min_intensity_red)) * ratio_intensity_red);
        op_pic1(i,j,2) = floor((double(ip_pic3(i,j,2)) - double(min_intensity_green)) * ratio_intensity_green);
        op_pic1(i,j,3) = floor((double(ip_pic3(i,j,3)) - double(min_intensity_blue)) * ratio_intensity_blue);
        
    end
end


    subplot(2,1,2);
    imshow(op_pic1), colorbar;
    axis([0 n 0 m]), axis on
    
    
end