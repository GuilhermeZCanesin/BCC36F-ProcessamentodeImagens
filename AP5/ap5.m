pkg load image;

imagemBase = imread("pratica5.png");

#funcao para calculo do ruido

function ruido = noise(img, n)
    matriz = zeros(rows(img), columns(img));
    for i = 1:n
        nova = zeros(rows(img), columns(img));
        nova = imnoise(img, "gaussian", 0 , 0.25);
        nova = nova*(1/n);
        matriz += nova;
    endfor
    ruido = matriz;
endfunction

image8 = noise(imagemBase, 8);
image16 = noise(imagemBase, 16);
image64 = noise(imagemBase, 64);

figure, imshow(image8);
figure, imshow(image16);
figure, imshow(image64);

imwrite(image8, "image8.png")
imwrite(image16, "image16.png")
imwrite(image64, "image64.png")

# Quanto menor o N maior o tamanho dos grãos e quanto maior o N maior o Efeito gauseano

