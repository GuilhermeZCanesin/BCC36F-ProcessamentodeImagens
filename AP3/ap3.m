pkg load image;

imagem = imread("imagem.jpg");
#imhist(imagem); #visualização do histograma da imagem original

[counts, bin]=imhist(imagem);

matriz = zeros(rows(imagem), columns(imagem), "uint8");

for i = 1:rows(counts)
    pr(i,1) = counts(i)/(rows(imagem)*columns(imagem));
endfor

for s = 1: rows(counts)
    sk(s) = 0;
    for j = 1:s
        sk(s) = sk(s) + (pr(j)*rows(counts));
    endfor
endfor


# plots pr e sk

#plot (pr)
#plot (sk)


for i = 1:rows(imagem)
    for j = 1:columns(imagem)
        matriz(i,j) = uint8(round(sk(imagem(i,j))));
    endfor
endfor

# Plot histograma equalizado
imhist(matriz);


#salvando a imagem
imwrite(matriz,"newImage.jpg");