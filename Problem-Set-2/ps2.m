% ps2

%% 1-a
% Read images
L = im2double(imread(fullfile('input', 'pair0-L.png')));
R = im2double(imread(fullfile('input', 'pair0-R.png')));

% Compute disparity
%D_L = disparity_ssd(L, R);
%D_R = disparity_ssd(R, L);
%D_LC = disparity_ncorr(L,R);
%imagesc(D_LC)
%figure;
%imagesc(D_L)
%figure;
%imagesc(D_R)

% TODO: Rest of your code here
L1 = im2double(imread(fullfile('input', 'pair1-L.png')));
R1 = im2double(imread(fullfile('input', 'pair1-R.png')));
L1 = rgb2gray(L1);
R1 = rgb2gray(R1);
D_L1C =   disparity_ncorr(L1, R1);
%D_L1 =  disparity_ssd(L1, R1);
%D_R1 = disparity_ssd(R1, L1);
figure;
imagesc(D_L1C)
%figure;
%imagesc(D_L1)
%figure;
%imshow(D_R1)
