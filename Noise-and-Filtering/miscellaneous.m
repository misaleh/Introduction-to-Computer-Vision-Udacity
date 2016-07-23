%miscellaneous operations on images
%% read 
img  = imread('lenna.png');

subplot(2,2,1)
imshow(img)
title('Original')

%% Add noise to image 
noise = randn(size(img)).* 40 ; 
img_noise = uint8(noise) + img;
subplot(2,2,2)
imshow(img_noise)
title('Noisy')

%% gaussian filter 
gauss =  fspecial('gaussian', 10, 1); % filter , size , sigma(varianve)   sigma is the most important in adding blur
%img_gauss = imfilter(img_noise,gauss);  
 img_gauss =  imfilter(img_noise,gauss,'symmetric'); % black boundries 
%  imfilter(img_noise,gauss,'circular');  %wrap around
%  imfilter(img_noise,gauss, 'replicate'); %copy edge
%  imfilter(img_noise,gauss,'symmetric');  %reflect
subplot(2,2,3)
imshow(img_gauss)
title('After guass')
%% filtering
%unsharp
z = zeros(90,90);
z(45,45)
unsharp =  + 0.01.*ones(9,9); % unsharp filter
img_unsharp =  imfilter(img,unsharp,'symmetric'); % black boundries
figure;
subplot(2,2,1)
imshow(img)
title('Unsharp filter')
%% median 
salt_pepper = imnoise(img,'salt & pepper',0.02);
subplot(2,2,2)
imshow(salt_pepper)
title('Salt and pepper')
medila_filterd(:,:,1) = medfilt2(salt_pepper(:,:,1)) ;
medila_filterd(:,:,2) = medfilt2(salt_pepper(:,:,2)) ;
medila_filterd(:,:,3) = medfilt2(salt_pepper(:,:,3)) ;

subplot(2,2,3)
imshow(medila_filterd)
title('Median')


