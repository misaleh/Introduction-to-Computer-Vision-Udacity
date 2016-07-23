%% Part of Problem Set 0 , it is not following the name convention, it also do not store images, just displayes them
house = imread('house.tiff');
pepper = imread('pepper.tiff');

%% swap red and blue in first image
house_1(:,:,[1 3]) = house(:,:,[3 1]);
figure;
imshow(house_1)
%% create a green monochromatic image
house_2 = house;
house_2(:,:,[1 3]) = zeros(size(house,1),size(house,2),2);
figure;
imshow(house_2)
%% similary but red
house_3 = house;
house_3(:,:,[2 3]) = zeros(size(house,1),size(house,2),2);
figure;
imshow(house_3)
%% Blue , will be used later
house_4 = house;
house_4(:,:,[1 2]) = zeros(size(house,1),size(house,2),2);
%% Take the inner center square region of 100x100 pixels of monochrome version of image 1 
%and insert them into the center of monochrome version of image 2
pepper_2 = pepper;
pepper_2(:,:,[1 3]) = zeros(size(pepper,1),size(pepper,2),2);
house_2_mid = house_2( ((size(house_2,1)/2)-50):((size(house_2,1)/2)+49),((size(house_2,1)/2)-50:(size(house_2,1)/2)+49) , : );
pepper_2( ((size(pepper_2,1)/2)-50):((size(pepper_2,1)/2)+49),((size(pepper_2,1)/2)-50:(size(pepper_2,1)/2)+49) , :) = house_2_mid;
figure;
imshow(pepper_2)
%% min and max in green image one
disp(max(max(house_2(:,:,2))));
disp(min(min(house_2(:,:,2))));
%% Shift img1_green to the left by 2 pixels.
pepper1 = pepper;
pepper1 = pepper1(:,3:size(pepper1,2),:);
imshow(pepper1)
%% add gaussion noise to the green image
noise = randn(size(house_2,1),size(house_2,2)).*40 ; 
house_2_noise = house_2;
house_2_noise(:,:,2) = double(house_2(:,:,2)) + noise ;
figure;
imshow(house_2_noise)
%% add gaussion noise to the blue image
noise = randn(size(house_4,1),size(house_4,2)).*40 ; 
house_4_noise = house_4;
house_4_noise(:,:,2) = double(house_4(:,:,2)) + noise ;
figure;
imshow(house_4_noise)