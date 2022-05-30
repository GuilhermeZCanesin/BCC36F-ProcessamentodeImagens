pkg load image;


function img = euclidianDistance(i,j,P,Q)
  img = sqrt((i-(P/2))^2 + (j-(Q/2))^2);
endfunction

function img = lowPassGaussianFilter(img, P, Q, D0)
  for i = 0:P-1
    for j = 0:Q-1
      img(i+1,j+1) = e^(-((euclidianDistance(i,j,P,Q))^2)/(2*(D0)^2));
    endfor
  endfor
endfunction

imagemBase = imread("pratica7.png");
imdouble = im2double(imagemBase);


m = rows(imdouble);
n = columns(imdouble);
P = m*2;
Q = n*2;

imtransform = fft2(imdouble, P,Q);
imtransform = fftshift(imtransform);
title("Transformada");
figure, imshow(uint8(abs(imtransform)));

# imwrite(uint8(abs(imtransform)), "transformada.png");

imfilter = lowPassGaussianFilter(imtransform, P, Q, 20);
title("Filtro");
figure, imshow(im2uint8(imfilter));
imwrite(im2uint8(imfilter), "filtro.png");

imfilter = imtransform .*imfilter;
imfilter = ifftshift(imfilter);
imfilter = ifft2(imfilter);
imfilter = real(imfilter);
title("Resultado");
figure, imshow(im2uint8(imfilter(1:m,1:n)));