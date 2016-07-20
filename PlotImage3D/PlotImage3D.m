% plot image as 3d 
function  output = PlotImage3D(img)
[x y z] = size(img);   
x = 1:x;
y = 1:y;
[x , y ] = meshgrid(x,y);
mesh(x,y,img(:,:,1))
end 
