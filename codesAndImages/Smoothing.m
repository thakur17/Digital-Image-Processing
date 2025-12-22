% Matlab program for LPF (Averaging/Smoothing)
clc;
clear all;
close all;
warning off;
%a = imread('Maulik.png');
a = imread('Cameraman.tif');
%a=rgb2gray(a);
a = im2double(a);
%a = a + randn(512,512)*0.10;
a = imnoise(a,'gaussian',0.01);
%a = imnoise(a,'salt & pepper',0.02);
%w = [1 1 1 ; 1 1 1 ; 1 1 1]/9;
%w = [1 2 1 ; 2 4 2 ; 1 2 1]/16;%weighted average filter
w= fspecial('average',[5 5]);
I = imfilter(a,w);
montage({a, I}, 'Size', [1 2]);
title('Image with random Gaussian noise              LPF (Smoothed) Image');