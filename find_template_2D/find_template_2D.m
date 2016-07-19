function [yIndex , xIndex] = find_template_2D(template, img)
 C_C = normxcorr2( template(:,:,1) , img(:,:,1) );
 [yIndex ,xIndex]=  find(C_C == max(C_C(:)));
 yIndex =   yIndex - size(template,1)  + 1; 
 xIndex =  xIndex - size(template,2)  + 1; 
end
