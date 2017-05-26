function myShrinkImageByFactorD()

ip_pic= imread('./../data/circles_concentric.png');
op_row = 1;
[m,n] = size(ip_pic);

figure
subplot(2, 2, 1);
imshow(ip_pic), colorbar;
axis([0 m 0 n]), axis on
d=2;
op_pic1 = zeros(floor((m)/d), floor((n)/d),'uint8');
for i = 1:d:m
    op_column = 1;
    for j = 1:d:n
        op_pic1(op_row,op_column) = ip_pic(i,j);
        op_column = op_column + 1;
    end
    op_row = op_row + 1;
end

subplot(2, 2, 2);
imshow(op_pic1), colorbar;
axis([0 floor((m)/2) 0 floor((n)/2)]), axis on


d=3;
op_pic2 = zeros(floor((m)/d), floor((n)/d),'uint8');
op_row=1;
for i = 1:d:m
    op_column = 1;
    for j = 1:d:n
        op_pic2(op_row,op_column) = ip_pic(i,j);
        op_column = op_column + 1;
    end
    op_row = op_row + 1;
end

subplot(2,2, 3);
imshow(op_pic2), colorbar;
axis([0 floor(m/3) 0 floor(n/3)]), axis on
end