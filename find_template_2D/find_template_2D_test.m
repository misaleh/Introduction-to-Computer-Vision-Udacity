lenna = imread('Lenna.png');
lenna1 = imread('Lenna_part.png');
figure;
imshow(lenna);
figure;
imshow(lenna1);
[y ,x] = find_template_2D(double(lenna1) , double(lenna));
disp([y x]); 

%draw a black square on the point 
for i = x-5:x+5
    for j = y-5:y+5
        lenna(j,i,:)= 0;
    end
end

figure;
imshow(lenna);