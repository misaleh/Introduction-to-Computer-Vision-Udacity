function [H, theta, rho] = hough_lines_acc(BW, varargin)
    % Compute Hough accumulator array for finding lines.
    %
    % BW: Binary (black and white) image containing edge pixels
    % RhoResolution (optional): Difference between successive rho values, in pixels
    % Theta (optional): Vector of theta values to use, in degrees
    %
    % Please see the Matlab documentation for hough():
    % http://www.mathworks.com/help/images/ref/hough.html
    % Your code should imitate the Matlab implementation.
    %
    % Pay close attention to the coordinate system specified in the assignment.
    % Note: Rows of H should correspond to values of rho, columns those of theta.

    %% Parse input arguments
    p = inputParser();
    addParameter(p, 'RhoResolution', 1);
    addParameter(p, 'Theta', linspace(-90, 89, 180));
    parse(p, varargin{:});

    rhoStep = p.Results.RhoResolution;
    theta = p.Results.Theta;
  
    %% TODO: Your code here
    [row , col]  = find(BW == 1);
    ind_size = size(row,1);
    offset = row(end)*sind(45) + col(end)*cosd(45);
    H = zeros(ind_size,180);
    rho = 0;
    for i = 1:ind_size %6000 maslan, for every edge point 
        for thta = 1:180 % 180 degrees 
            d = row(i)*cosd(thta) - col(i)*sind(thta); %there should be duplicate , fa el array hatkon as3'ar mn 6000
            d = abs(ceil(d - offset)) + 1; % to remove negative values
            H(d,thta) =  H(d,thta)  + 1;      %increase the vote
        end
    end
   [mx, my]  =  find(H ~= 0); 
   H = H(1:max(mx),:); % the last element that is not equal to  zero
   rho = -max(mx)/2:max(mx)/2 -1; %roh
   theta = -90:89; %theta
end
