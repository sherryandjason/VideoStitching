clear all;close all;clc;

img1=imread('1.jpg');
img1=rgb2gray(img1);
[h1 w1]=size(img1);
mask=uint8(ones(h1,w1));    %????????????
imshow(img1);
p1=ginput();

img2=imread('45623.jpg');
%img2=rgb2gray(img2);
[h2 w2]=size(img2);


figure;imshow(img2);


p2=ginput();        %??????????????????

T1=calc_homography(p1,p2);   %???????
T=maketform('projective',T1);   %????

[imgn X Y]=imtransform(img1,T);     %??
mask=imtransform(mask,T);

T2=eye(3);
if X(1)<0, T2(3,1)= X(1); end
if Y(1)<0, T2(3,2)= Y(1); end
T2=maketform('affine',T2);      %????

imgn=imtransform(imgn,T2,'XData',[1 w2],'YData',[1 h2]);    %??
mask=imtransform(mask,T2,'XData',[1 w2],'YData',[1 h2]);

img=img2.*(1-mask)+imgn.*mask;  %??
% tempy=150;
% tempx=20;
% result(1+tempy:480+tempy,1:640-tempx+1)=imgn(:,tempx:640);
% result(481:960,:)=img2;
% figure;imshow(result);

figure;imshow(img,[])