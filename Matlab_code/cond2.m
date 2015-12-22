% check if the circumcenter is outside the delaunay triangle
function y = cond2(dt, cc, l, rs)

    x1 = dt.X(dt.Triangulation(l,1), 1);
    y1 = dt.X(dt.Triangulation(l,1), 2);
    
    x2 = dt.X(dt.Triangulation(l,2), 1);
    y2 = dt.X(dt.Triangulation(l,2), 2);
    
    x3 = dt.X(dt.Triangulation(l,3), 1);
    y3 = dt.X(dt.Triangulation(l,3), 2);
    
    x4 = cc(l,1);
    y4 = cc(l,2);
    
    area1 = area(x1, y1, x2, y2, x4, y4);
    area2 = area(x3, y3, x2, y2, x4, y4);
    area3 = area(x1, y1, x3, y3, x4, y4);
    area4 = area(x1, y1, x2, y2, x3, y3);
    
    if area1 + area2 + area3 > area4 
        if cond3(x1, y1, x2, y2, x3, y3, rs) == 1
            y = 1;
        else y = 2;
        end;
    else y = 0;
    end;
    
end
        
        
        