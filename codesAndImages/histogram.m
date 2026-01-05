%% Matlab program for Histogram showing and Histogram equilization
close all;
clear all;
clc
warning off;
%I=imread('Maulik.png');
%I=imread('pout.tif');
I=imread('Cameraman.tif');
%I=rgb2gray(I);
figure
subplot(1,2,1); 
imshow(I);title('Original image');
subplot(1,2,2)
imhist(I); title('Histogram');
J = histeq(I);
figure
subplot(1,2,1); 
imshow(J); title('Histogram equalized image');
subplot(1,2,2);
imhist(J); title('Histogram');

%% MATLAB Program for histogram equilization without histeq
close all;
clear all;
clc
warning off;
% Read the image 
a=imread('Maulik.png');
%a=imread('pout.tif');
% Convert to grayscale incase it is color
a = rgb2gray(a);
b=size(a);
a=double(a);

% Loop for Getting the Histogram of the Original image
freq_counts = zeros(1,256);
for i=1:b(1)
    for j=1:b(2)
        for k=0:255
            if a(i,j)==k
                freq_counts(k+1)=freq_counts(k+1)+1;
            end
        end
    end
end

%Generating PDF out of histogram by diving by total no. of pixels
pdf=(1/(b(1)*b(2)))*freq_counts;

%Generating CDF out of PDF
cdf = zeros(1,256);
cdf(1)=pdf(1);
for i=2:256
    cdf(i)=cdf(i-1)+pdf(i);
end
cdf = round(255*cdf);
% histogram equilized image
ep = zeros(b);
for i=1:b(1)                 %loop tracing the rows of image
    for j=1:b(2)             %loop tracing thes columns of image
        t=(a(i,j)+1);        %pixel values in image
        ep(i,j)=cdf(t);      %Making the ouput image using cdf as the transformation function
    end                                             
end

% Loop for Getting the Histogram of the Equalized image
hist2 = zeros(1,256);
for i=1:b(1)
    for j=1:b(2)
        for k=0:255
            if ep(i,j)==k
                hist2(k+1)=hist2(k+1)+1;
            end
        end
    end
end

subplot(2,2,1);
imshow(uint8(a));title('Original image');
subplot(2,2,3);
imshow(uint8(ep));title('Histogram equilized image');
subplot(2,2,2);
stem(freq_counts);title('Histogram of original image');
subplot(2,2,4);
stem(hist2);title('Histogram of equilized image');