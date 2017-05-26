function pix_value = myAHE_compute(ip_pic)

[m,n] = size(ip_pic);

intensity_arr= zeros(1,256);
density_arr = zeros(1,256);
no_of_pixel = 0;

for i = 1: m
    for j = 1 : n
        if ip_pic(i,j) > -1
            x= ip_pic(i,j)+1;
            intensity_arr(x) = intensity_arr(x) + 1;
            no_of_pixel = no_of_pixel+1;
        end
    end
end

density_arr(1)= intensity_arr(1) / no_of_pixel;

for i = 2:256
     density_arr(i) = density_arr(i-1) + intensity_arr(i) / no_of_pixel;
end

x = ip_pic(ceil((m+1)/2),ceil((n+1)/2)) + 1;
pix_value = round(density_arr(x) * 255);
end