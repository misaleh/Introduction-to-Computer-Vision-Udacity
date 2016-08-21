function D = disparity_ssd(L, R)
    % Compute disparity map D(y, x) such that: L(y, x) = R(y, x + D(y, x))
    %
    % L: Grayscale left image
    % R: Grayscale right image, same size as L
    % D: Output disparity map, same size as L, R

    % TODO: Your code here
    % the epiploar line is horizontal as the cameras are horizontal
    %(x and y are switched)
    window_x =15;
    window_y = 15;
    hw = window_x/2;
    hy = window_y/2;
    [x ,y] = size(L);
    sum1 = zeros(x,y) ;
    MIN = 65535;
    s = 0 ;
    for l = 1+hw :(x  - hw)
        for k = 1+hy:(y - hy)
            area1 = L(l  - hw:l+hw ,k - hy:k+hy );
            for j  = 1:y-window_y% the epipoler line 
                area2 = R(l - hw:l+hw ,j:j+window_y );
                sq = (area1 - area2).^2;
                s = sum(sq(:));
                if(s < MIN)
                    MIN  = s ;
                    sum1(l-hw,k-hy) = j-k;
                end
            end
            MIN =65553;
        end
    end
    D = sum1;
     
end
