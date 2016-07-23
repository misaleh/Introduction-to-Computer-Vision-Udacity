%% Part 1 , 2  and 4 ,( in 3 just add noise ) of problem set 2

%% 1-a
img = imread(fullfile('input', 'ps1-input0.png'));  % already grayscale
%% TODO: Compute edge image img_edges
img_edges = edge(img,'canny');
figure;
imshow(img_edges);
%imwrite(img_edges, fullfile('output', 'ps1-1-a-1.png'));  % save as output/ps1-1-a-1.png

%% 2-a
[H, theta, rho] = hough_lines_acc(img_edges);  % defined in hough_lines_acc.m
%[accum , theta1 , rho1 ] = hough(img_edges);  %for testing 
%% TODO: Plot/show accumulator array H, save as output/ps1-2-a-1.png
figure; 
imagesc(H)
%% 2-b
peaks = hough_peaks(H, 100);  % defined in hough_peaks.m
%peaks2 = houghpeaks(accum,10);

%% TODO: Highlight peak locations on accumulator array, save as output/ps1-2-b-1.png
%% TODO: Rest of your code here
hough_lines_draw(img, 'outfile', peaks, rho, theta)

%% 4

img1 = imread(fullfile('input', 'ps1-input1.png'));  % already grayscale
img1 = rgb2gray(img1);

gauss =  fspecial('gaussian', 30, 2.5); 
img_gauss =  imfilter(img1,gauss,'symmetric');

img1_edges = edge(img_gauss,'canny');
figure;
imshow(img1_edges);
title('edges')

[H1, theta1, rho1] = hough_lines_acc(img1_edges);  % defined in hough_lines_acc.m
[accum , theta2 , rho2 ] = hough(img1_edges); 
figure; 
imagesc(H1)
title('my')

figure; 
imagesc(accum)
title('matlab')

peaks1 = hough_peaks(H1, 15);  % defined in hough_peaks.m
hough_lines_draw(img1, 'outfile', peaks1, rho1, theta1)

peaks2 = houghpeaks(accum, 10);  % defined in hough_peaks.m
hough_lines_draw(img1, 'outfile', peaks2, rho2, theta2)
