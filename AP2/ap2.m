pkg load image;
pollen_uncontrasted = imread("pollen.jpg");

pollen_contrasted = zeros (889, 889, "uint8");
uncontrasted = im2uint8 (pollen_uncontrasted);


r1 = 94;
s1 = 30;
r2 = 136;
s2 = 150;

y1 = @(x) ((s1/r1) * x);
y2 = @(x) (s1 + ((s2-s1)/(r2-r1)) * (x - r1));
y3 = @(x) (s2 + (((256-s2)/(256-r2)) * (x - r2)));
map = zeros(1,256, "uint8");

for var = 1:256
  if(var < r1)
    temp = y1(var);
  elseif (var < r2)
    temp = y2(var);
  else
    temp = y3(var);
  endif
  map(var) = round(temp);
  
endfor

plot(map);

for i = 1:888
  for j = 1:888
       pollen_contrasted(i,j) = map(uncontrasted(i,j));
  endfor
endfor

imwrite(pollen_contrasted, "pollen_contrasted.jpg");

