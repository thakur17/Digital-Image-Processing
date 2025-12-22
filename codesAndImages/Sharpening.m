% Matlab program for HPF (Sharpening)
clc;
clear all;
close all;
warning off;
a = imread('Maulik.png');
%a = imread('moon.tif');
a=rgb2gray(a);
a = im2double(a);
subplot(231); 
imshow(a); title('Original Image');
w = [0  1  0 ; 1  -4  1 ; 0  1  0]; %Laplacian filter
I = imfilter(a,w);
%sigma = 0.4; alpha = 0.5; I = locallapfilt(a, sigma, alpha);
subplot(232); 
imshow(I); title('Laplacian filtered Image');
I1 = a + I;
subplot(233); 
imshow(I1);title('Sharpened Image (Laplacian+Original)');
folder = fileparts(which('moon.tif'))