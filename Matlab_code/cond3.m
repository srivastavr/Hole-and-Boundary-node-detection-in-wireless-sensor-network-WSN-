% check if the delaunay triangle is fully covered by theorem 3
function y = cond3(x1, y1, x2, y2, x3, y3, rs)

    side = zeros(1, 3);
    side(1) = distance(x1, y1, x2, y2);
    side(2) = distance(x3, y3, x2, y2);
    side(3) = distance(x1, y1, x3, y3);
    
    if side(1) > side(2) 
        maxid = 0;
    else  maxid = 1;
    end;
    if side(3) > side(maxid+1) 
        maxid = 2;
    end;
    
    angle = zeros(1, 2);
    angle(1) = acos( (side(maxid+1)^2 + side(rem(maxid+1,3)+1)^2 - side(rem(maxid+2,3)+1)^2) / (2 * side(maxid+1) * side(rem(maxid+1,3)+1) ) );
    angle(2) = acos( (side(maxid+1)^2 + side(rem(maxid+2,3)+1)^2 - side(rem(maxid+1,3)+1)^2) / (2 * side(maxid+1) * side(rem(maxid+2,3)+1) ) );
    
    pbl = zeros(1, 2);
    pbl(1) = tan(angle(1)) * (side(rem(maxid+1,3)+1) / 2);
    pbl(2) = tan(angle(2)) * (side(rem(maxid+2,3)+1) / 2);
    
    length = zeros(1, 2);
    length(1) = sqrt( pbl(1)^2 + (side(rem(maxid+1,3)+1) / 2)^2 );
    length(2) = sqrt( pbl(2)^2 + (side(rem(maxid+2,3)+1) / 2)^2 );
    
    if length(1) > rs || length(2) > rs
        y = 1;
    else y = 0;
    end;
  
end
