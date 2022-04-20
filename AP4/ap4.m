pkg load image;

imagem = imread("pratica4.jpg");

doubleImg = im2double(imagem);
mn=9;
filtro = zeros(mn,mn, "double")+1;

for i=1:mn
  for j=1:mn
          filtro(i,j) = filtro(i,j)/mn*mn;
  endfor
endfor

imgMedia = filter2(filtro, doubleImg,"valid");


#imshow(imgMedia)

imwrite(imgMedia, "imgMedia.jpg");

#a imagem ficou suavizada porem a borda da imagem ficou preta pois foi feito calculo com espaços vazios adjacentes fora da imagem

imgPadded = padarray(doubleImg, [3 3], "replicate");

imgMediaPad = filter2(filtro, imgPadded, "valid");

imshow(imgMediaPad)
imwrite(imgMediaPad, "imgMediaPadded.jpg");

#sobel

operadorSobel1 = [-1, -2, -1; 0, 0, 0; 1, 2, 1];
operadorSobel2 = [-1, 0, 1; -2, 0, 2; -1, 0, 1];

imgPadded = padarray(doubleImg, [1 1], "replicate");

gx = filter2(operadorSobel1, imgPadded, "valid");
gy = filter2(operadorSobel2, imgPadded, "valid");

sobel = abs(gx) + abs(gy);

imshow(sobel)
imwrite(sobel, "sobel.jpg");