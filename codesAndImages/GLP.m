%Matlab program for Gaussian low pass filter in the frequency domain
clc;
clear;
close all;
%a = imread('Maulik.png');
%a = rgb2gray(a);
a = imread('Cameraman.tif'); % Input image
a = im2double(a); 
subplot(2,3,1);
imshow(a);
title('Input Image');

[m,n] = size(a);  % size of input image
D0 = 50; % Assigning Cut-off Frequency  

A = fft2(a);   %fourier transform of input image
subplot(2,3,2);
imshow(uint8(abs(A)));
title('F.T. of i/p without shift');

A_shift = fftshift(A);  %shifting origin
A_real = abs(A_shift);  %Real part of A_shift (Freq domain repres of image)

subplot(2,3,3);
imshow(uint8(A_real));
title('F.T. of i/p after shift');

D = zeros(m,n);
H = zeros(m,n);
order=1;
for u=1:m
    for v=1:n
        d=sqrt((u-(m/2))^2+(v-(n/2))^2);
        H(u,v)=exp(-(d^2)/(2*D0.^2));
     end
end

subplot(2,3,4);
imshow(H)
title('Gaussian Low pass filter')

subplot(2,3,5);
mesh(H)
title('surface plot GLPF')
B = A_shift.*H;  %multiplying F(u,v) with H(u,v)
shift_B=fftshift(B);
B_inverse = ifft2(shift_B); %Taking inverse fourier transform
B_real = abs(B_inverse);%Taking real part(Low pass output image)

subplot(2,3,6);
imshow(B_real);
title('Low pass image');