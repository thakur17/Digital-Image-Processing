% Matlab program for Gaussian Band Reject Filter(GBRF)
clc;
clear all;
close all;
% Read the image 
% a = imread('Maulik.png');
% a = rgb2gray(a);
a=imread('Cameraman.tif');
a = im2double(a);%convert the range of colors from 0-255 to 0-1
[m,n]=size(a);
for i=1:m
for j=1:n
a_1(i,j)=a(i,j)+sin(5*i)+sin(5*j);
end
end
subplot(2,3,1);
imshow(a_1);
title('Image with noise');

A = fft2(a_1);    %fourier transform of image
subplot(2,3,2);
imshow(uint8(abs(A)));
title('F.T. of i/p without shift');

A_shift = fftshift(A); %shifting origin
A_real = abs(A_shift); %Magnitude of A_shift(Freq. domain repre.)
subplot(2,3,3)
imshow(uint8(A_real));
title('Frequency domain image');

D0 = 52; %Cut-Off frequency OR Standard deviation sigma
W = 10; %Width of rejection
for u=1:m
    for v=1:n
        D = sqrt((u-m/2).^2+(v-n/2).^2);
        H(u,v) = 1 - exp(-(1/2)*((D^2-D0^2)/(D*W))^2);
    end
end
H_high = H.*A_shift;
H_high_real = H.*A_real;
H_high_shift = ifftshift(H_high);
H_high_image = ifft2(H_high_shift);

subplot(2,3,4)
imshow(H)
title('Gaussian Band Reject Filter');

subplot(2,3,5);
mesh(H)
title('Surface plot GBRF')


subplot(2,3,6)
imshow(abs(H_high_image));
title('Gaussian Band Reject Filtered image');