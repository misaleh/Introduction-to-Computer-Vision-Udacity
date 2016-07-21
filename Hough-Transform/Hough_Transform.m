%% Hough Transform
img = imread('shapes.jpg');
img = rgb2gray(img);
figure;
imshow(img)

img_edge = edge(img,'canny');
figure;
imshow(img_edge)
title('canny')

[accum , theta , rho ] = hough(img_edge); % accumlitave array(votes) , then vectors of theta and rho
figure;
imagesc(accum,'XData',theta,'YData',rho)
title('Houch accumulator')

img_peaks = houghpeaks(accum,100,'Threshold',ceil(0.25*max(accum(:))),'NHoodSize',[5 5]);
hold on; 
plot(theta(img_peaks(:,2)),rho(img_peaks(:,1)),'rs');
hold off;

img_lines= houghlines(img_edge,theta,rho,img_peaks);
figure;
imshow(img)
title('With lines')
hold on;
for i = 1:length(img_lines)
    endpoints = [img_lines(i).point1;  img_lines(i).point2];
    plot(endpoints(:,1),endpoints(:,2),'LineWidth',2,'Color','red');
end
hold off;