pkg load image;

imagemBase = imread("pratica 6.png");

imdouble = im2double(imagemBase);

m = rows(imdouble);
n = columns(imdouble);
P = m*2;
Q = n*2;

imtransform = fft2(imdouble, P,Q);
imtransform = fftshift(imtransform);
figure, imshow(uint8(abs(imtransform)));
imwrite(uint8(abs(imtransform)), "transformada.png");

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

imfilter = lowPassGaussianFilter(imtransform, P, Q, 20);
figure, imshow(im2uint8(imfilter));
imwrite(im2uint8(imfilter), "lowpass.png");


imfilter = imtransform .*imfilter;
imfilter = ifftshift(imfilter);
imfilter = ifft2(imfilter);
imfilter = real(imfilter);
#figure, imshow(im2uint8(imfilter(1:m,1:n)));

matriz = zeros (m,n);
matriz = im2uint8(imfilter(1:m,1:n));
#matriz = imfilter(1:m,1:n);
imwrite(matriz, "final.png");
figure, imshow(matriz);