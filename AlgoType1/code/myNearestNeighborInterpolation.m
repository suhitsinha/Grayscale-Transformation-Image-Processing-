function myNearestNeighborInterpolation()

ip_pic2 = imread('./../data/barbaraSmall.png');
[m,n] = size(ip_pic2);
opm = 3*m - 2;
opn = 2*n - 1;

scale_row = m / opm;
scale_col = n/opn;

row_frac_loc = zeros(1, opm);
col_frac_loc = zeros(1, opn);

int_row_frac_loc = zeros(1, opm, 'int8');
int_col_frac_loc = zeros(1, opn, 'int8');

del_row_frac_loc = zeros(1, opm);
del_col_frac_loc = zeros(1, opn);

op_pic2 = zeros(opm,opn, 'uint8');


for i = 1:opm
    row_frac_loc(1, i) = i * scale_row;
    int_row_frac_loc(1,i) = floor(row_frac_loc(1, i));
    del_row_frac_loc(1,i) = row_frac_loc(1, i) - floor(row_frac_loc(1, i));

end

for i = 1:opn
    col_frac_loc(1, i) = i * scale_col;
    int_col_frac_loc(1,i) = floor(col_frac_loc(1, i));
    del_col_frac_loc(1,i) = col_frac_loc(1, i) - floor(col_frac_loc(1, i));
end

for i = 1: opm
    for j = 1 : opn
        
        r = int_row_frac_loc(1,i);
        c = int_col_frac_loc(1,j);
        
        if r == 0 && c == 0
            op_pic2(i,j) = ip_pic2(1,1); 
            
        elseif r == 0 && c > 0
            op_pic2(i,j) = ip_pic2(1,c);
        
        elseif r > 0 && c == 0
            op_pic2(i,j) = ip_pic2(r,1);
            
        elseif i == 1
            op_pic2(i,j) = ip_pic2(1,c);
        
        elseif i == opm
            op_pic2(i,j) = ip_pic2(m,c);
            
        elseif j == 1
            op_pic2(i,j) = ip_pic2(r,1);
        
        elseif j == opn
            op_pic2(i,j) = ip_pic2(r,n);
            
        else
            op_pic2(i,j) = ip_pic2(r,c);
        end
    end
end

    figure
    subplot(1, 2, 1);
    imshow(ip_pic2), colorbar;
    axis([0 n 0 m]), axis on
    
    subplot(1, 2, 2);
    imshow(op_pic2), colorbar;
    axis([0 opn 0 opm]), axis on
    
    
end