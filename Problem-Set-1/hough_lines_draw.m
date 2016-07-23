function hough_lines_draw(img, outfile, peaks, rho, theta)
    % Draw lines found in an image using Hough transform.
    %
    % img: Image on top of which to draw lines
    % outfile: Output image filename to save plot as
    % peaks: Qx2 matrix containing row, column indices of the Q peaks found in accumulator
    % rho: Vector of rho values, in pixels
    % theta: Vector of theta values, in degrees

    % TODO: Your code here
img_edges = edge(img,'canny');    
img_lines= houghlines(img_edges,theta,rho,peaks);
figure;
imshow(img)
hold on;
for i = 1:length(img_lines)
    endpoints = [img_lines(i).point1;  img_lines(i).point2];
    plot(endpoints(:,1),endpoints(:,2),'LineWidth',2,'Color','red');
end
hold off;
end
