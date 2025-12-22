% MATLAB program on Point processing
close all;
clear all;
clc
%% Read and display Image
I0=imread('Maulik.png');%Read image information
I=rgb2gray(I0);%Convert Color image to Grayscale image
% I=imread('Cameraman.tif');
montage({I0, I}, 'Size', [1 2]);
title('Color Image                        Grayscale Image');
%% Image thresholding
figure
Ib = imbinarize( I ); 
montage({I, Ib}, 'Size', [1 2]);
title('Original Image                     Binary(Threshold) Image');
%% Adding intensity levels
%Id=double(I);
%Id1 = Id+100;
%montage({I, (uint8(Id1))}, 'Size', [1 2]);
%title('Original Image                        Intensity added Image');
Id1 = imadd(I,100);
montage({I, Id1}, 'Size', [1 2]);
title('Original Image                        Intensity added Image');
%% Subtracting intensity levels
%Id2 = Id-50;
%montage({I, (uint8(Id2))}, 'Size', [1 2]);
%title('Original Image                     Intensity subtracted Image');
Id2 = imsubtract(I,255);
montage({I, Id2}, 'Size', [1 2]);
title('Original Image                     Intensity subtracted Image');
%% Multiply intensity levels
Id3 = immultiply(I,0.1);
montage({I, Id3}, 'Size', [1 2]);
title('Original Image                   Intensity multiplied Image');
%% Divide intensity levels
Id4 = imdivide(I,0.10);
montage({I, Id4}, 'Size', [1 2]);
title('Original Image                   Intensity divided Image');

% MATLAB program for contrast streching 
 
close all;
clear all;
clc;
I = imread('Maulik.png'); %read the image
I = rgb2gray(I);
I = imadd(I,100);
J = imadjust(I,stretchlim(I),[0.01 0.99]);
%figure
%imshow(J)
montage({I, J}, 'Size', [1 2]);
title('Original Image                               Contrast stretched Image');