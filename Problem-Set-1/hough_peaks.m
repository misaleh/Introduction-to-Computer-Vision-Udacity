function peaks = hough_peaks(H, varargin)
    % Find peaks in a Hough accumulator array.
    %
    % Threshold (optional): Threshold at which values of H are considered to be peaks
    % NHoodSize (optional): Size of the suppression neighborhood, [M N]
    %
    % Please see the Matlab documentation for houghpeaks():
    % http://www.mathworks.com/help/images/ref/houghpeaks.html
    % Your code should imitate the matlab implementation.

    %% Parse input arguments
    p = inputParser;
    addOptional(p, 'numpeaks', 1, @isnumeric);
    addParameter(p, 'Threshold', 0.5 * max(H(:)));
    addParameter(p, 'NHoodSize', floor(size(H) / 100.0) * 2 + 1);  % odd values >= size(H)/50
    parse(p, varargin{:});

    numpeaks = p.Results.numpeaks;
    threshold = p.Results.Threshold;
    nHoodSize = p.Results.NHoodSize;

    % TODO: Your code here
    
   [row , col , val] = find(H > 0);
   peaks = zeros(numpeaks,2);
   HN = H;
   R = [];
   C = [];
   Flag = 0 ;
   for i = 1:numpeaks
       [row , col ] = find(HN == max(HN(:)));
           row = row(1);
           col = col(1);
           R(end + 1) = row;
           C(end + 1) = col;
           HN(row, col) = -1;
           flag = 1;
       
   end
   peaks(:,1) = R;
   peaks(:,2) = C;
    
end

