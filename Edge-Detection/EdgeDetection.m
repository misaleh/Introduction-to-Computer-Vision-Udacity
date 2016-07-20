%% Edge Detection
img = imread('hex.png'); %read image 
filt = fspecial('sobel'); % fspecial creates a filter, sobel is  a differentiation filter (in x(verical) or y(horiz) direction)
    %this filter is in y direction , to make in x just transpose filt (filt')
out = imfilter(double(img),filt); %by default correlation not conv
figure;
imagesc(out);
title('fspecial')
%% using gradient function
img1 = double(img)/255.0; %convert to double and scale to 1
[gx , gy] = imgradientxy(img(:,:,1) , 'sobel'); %uses sobel , return x and y direction gradient 
figure;
imshow((gy+4)/8) %output will range from -4 to 4 
title('imgradientxy y')
% obtain magnitude and direction
[gmag , gdir] = imgradient(gx,gy); % get the magnitude and direction from gx and gy
figure;
imshow(gmag/(4*sqrt(2))) %gmag = sqrt(gx^2 + gy^2), so range will change from -4 -> 4 to 0 to 4*sqrt(2) 
title('imgradientxy mag')
figure;
imshow( (gdir +180)/360.0); 
title('imgradientxy angle')

%% Using built in function
%canny filters the differentiation operator
%then threshold it
%edge thining (non-max superrsion)
%connect edges
img_gray = rgb2gray(img); %better than using one color
img_canny = edge(img_gray,'canny'); %output image is binary , canny operator
img_log = edge(img_gray,'log'); % laplacin of gauss more edges, may not be desired
figure;
imshow(img_canny)
title('edge canny')
figure;
imshow(img_log)
title('edge log')

