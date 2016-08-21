function D = disparity_ncorr(L, R)
    % Compute disparity map D(y, x) such that: L(y, x) = R(y, x + D(y, x))
    %
    % L: Grayscale left image
    % R: Grayscale right image, same size as L
    % D: Output disparity map, same size as L, R

    % TODO: Your code here
    window_x =15;
    window_y = 15;
    hw = window_x/2;
    hy = window_y/2;
    [x ,y] = size(L);
    sum1 = zeros(x,y) ;
    s = 0 ;
    for l = 1+hw :(x  - hw)
        for k = 1+hy:(y - hy)
            area1 = L(l  - hw:l+hw ,k - hy:k+hy );
            area2 = R(l - hw:l+hw ,1:y );
            s = normxcorr2(area1, area2);
            [ypeak, xpeak] = find(s==max(s(:)));
            sum1(l-hw,k-hy) = xpeak-k;
        end
    end
    D = sum1;
end
