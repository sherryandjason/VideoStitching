function[img]=wrap32645(img1,img2)
% clear all;close all;clc;
% clear;
% load result65.mat;
% img1=imread('3.jpg');
% img1=rgb2gray(img1);
% img1=img3;
% img2=img2645;
[h1 w1 d1]=size(img1);
mask=uint8(ones(h1,w1));
%img2=imread('4562.jpg');
%img2=rgb2gray(img2);
[h2 w2 d2]=size(img2);
result=img2;

T1=[1.05389637324903,-0.00375560745800996,4.44202504821145e-05;0.147231859698760,1.27628903505572,0.000233100344934244;407.226327933799,833.120252759856,1];
T=maketform('projective',T1);   %????

[imgn X Y]=imtransform(img1,T);     %??
mask=imtransform(mask,T);

T2=eye(3);
if X(1)<0, T2(3,1)= X(1); end
if Y(1)<0, T2(3,2)= Y(1); end
T2=maketform('affine',T2);      %????

imgn=imtransform(imgn,T2,'XData',[1 w2],'YData',[1 h2]);    %??
mask=imtransform(mask,T2,'XData',[1 w2],'YData',[1 h2]);

tempy=807;
tempx=408;

result(1:h2+50,1:w2,:)=0;%Generate the canavas
rmask=result(1:h2+50,1:w2);
rimgn=result;
result(1:h2,1:w2,:)=img2(:,:,:);%Put the existed img
rmask(1+tempy:480+tempy,1+tempx:640+tempx)=mask(1:480,1:640);%Generate the new mask
rimgn(1+tempy:480+tempy,1+tempx:640+tempx,:)=imgn(1:480,1:640,:);%Generate the new imgn
img=result.*(1-rmask)+rimgn.*rmask;  %add the picture
% figure;imshow(img);
% imwrite(img,'45623.jpg');
end
