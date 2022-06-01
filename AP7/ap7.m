pkg load image;

#demora um pouco para executar

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


function img = highPassGaussianFilter(img, P, Q, D0)
  for i = 0:P-1
    for j = 0:Q-1
      img(i+1,j+1) = 1 - e^(-((euclidianDistance(i,j,P,Q))^2)/(2*(D0)^2));
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

#figure, imshow(uint8(abs(imtransform)));
imwrite (uint8(abs(imtransform)), "espectro.png");


imfilter = lowPassGaussianFilter(imdouble, P, Q, 85);
imfilter2 = highPassGaussianFilter(imdouble, P, Q, 100);
#figure, imshow(im2uint8(imfilter));
imwrite(im2uint8(imfilter), "filtro.png");

imfilter = imtransform .*imfilter;
imfilter = ifftshift(imfilter);
imfilter = ifft2(imfilter);
imfilter = real(imfilter);

imfilter2 = imtransform .*imfilter;
imfilter2 = ifftshift(imfilter);
imfilter2 = ifft2(imfilter);
imfilter2 = real(imfilter);

final = zeros (m,n);
final = im2uint8(imfilter(1:m,1:n));
final2 = im2uint8(imfilter2(1:m,1:n));

title("Resultado");
#figure, imshow(final);
imwrite(final, "resultado.png");
imwrite(final2, "resultado2.png");
