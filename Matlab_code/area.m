function y = area(x1, y1, x2, y2, x3, y3)

    y = 1/2 * abs( det([x1,y1,1;x2,y2,1;x3,y3,1]) );
    
end

