function p_img = project_point(p, f)
    %% Project a point from 3D to 2D
    %[x ;y ;z] =>  [x*f/z ; y*f/z] 
    p_img = f.*p(1:(end-1));
    p_img = (1/p(end)).*p_img;
end

