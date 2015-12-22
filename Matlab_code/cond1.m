% check if circumradius is greater than sensing radius
function y = cond1(rc, rs)

    if rc > rs
        y = 1;
    else y = 0;
    end;

end