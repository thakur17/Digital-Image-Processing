%Matlab program for high boost filtering in the frequency domain
clc;
clear;
close all;

a = imread('moon.tif'); % Input image
a = im2double(a); 
subplot(2,2,1);
imshow(a);
title('Input Image');

[m,n] = size(a);  % size of input image
D0 = 50; % Assigning Cut-off Frequency  
A = fft2(a);   %fourier transform of input image
%subplot(2,2,2);
%imshow(uint8(abs(A)));
%title('F.T. of i/p without shift');

A_shift = fftshift(A);  %shifting origin
A_real = abs(A_shift);  %Real part of A_shift (Freq domain repres of image)

%subplot(2,3,3);
%imshow(uint8(A_real));
%title('F.T. of i/p after shift');

H = zeros(m,n);
D = zeros(m,n);
for u=1:m
    for v=1:n
        D(u,v)=sqrt((u-(m/2))^2+(v-(n/2))^2);
        if D(u,v)<=D0
            H(u,v)=0;
        else
            H(u,v)=1; 
   
        end
    end
end
AHB=2.5; %HB factor
H1=(AHB-1);
X=A_shift.*H; %Multiplication by HPF
X1=A_shift.*H1; %Multiplication by HBF
XA=abs(ifft2(X)); 
XB=abs(ifft2(X1)); 


subplot(2,2,2);
imshow(XA);
title('Highpass image');

subplot(2,2,3);
imshow(XB);
title('Highboost image');

subplot(2,2,4);
imshow(a+XA);
title('Input plus Highpass image');