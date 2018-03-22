function[img]=wrap2645(img1,img2)
% clear all;close all;clc;
% clear;
%load result65.mat;
% img1=imread('2.jpg');
% img1=rgb2gray(img1);
[h1 w1 d1]=size(img1);
mask=uint8(ones(h1,w1));
% img2=imread('456.jpg');
%img2=rgb2gray(img2);
[h2 w2 d2]=size(img2);
result=img2;

T1=[1.04165283237884,0.0376105884570507,8.21641963670027e-05;0.0475743846331662,0.999053287075397,8.73135424720936e-06;432.170557931443,495.755615701637,1];
T=maketform('projective',T1);   %????

[imgn X Y]=imtransform(img1,T);     %??
mask=imtransform(mask,T);

T2=eye(3);
if X(1)<0, T2(3,1)= X(1); end
if Y(1)<0, T2(3,2)= Y(1); end
T2=maketform('affine',T2);      %????

imgn=imtransform(imgn,T2,'XData',[1 w2],'YData',[1 h2]);    %??
mask=imtransform(mask,T2,'XData',[1 w2],'YData',[1 h2]);

tempy=14;
tempx=-206;
result(1:h2,1:w1+w2+tempx,:)=0;%Generate the canavas
rmask=result(1:h2,1:w2);
rimgn=result;
result(1:h2,1:w2,:)=img2(:,:,:);%Put the existed img
rmask(tempy+h1+1:tempy+h1+h1,641+tempx:640+w2+tempx)=mask(1:480,:);%Generate the new mask
rimgn(tempy+h1+1:tempy+h1+h1,641+tempx:640+w2+tempx,:)=imgn(1:480,:,:);%Generate the new imgn
img=result.*(1-rmask)+rimgn.*rmask;  %add the picture
% figure;imshow(img);
% imwrite(img,'4562.jpg');
end
