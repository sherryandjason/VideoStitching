function[result]=wrap45(img1,img2)
%clear all;close all;clc;%for function disable it
% img1=imread('4.jpg');
% img1=rgb2gray(img1);
[h1 w1 d1]=size(img1);
mask=uint8(ones(h1,w1));
% img2=imread('5.jpg');%for function disable it
% img2=rgb2gray(img2);
[h2 w2 d2]=size(img2);

%T1=[0.931905678341774,0.00506822432424480,8.78225742400340e-07;-0.0999644467059860,0.937340527224746,-0.000201774731941455;48.4950233369571,-339.839059545540,1];
T1=[1.04085528403691,0.00156674158819451,1.41243602906551e-06;0.0703271107680670,1.02515134978738,7.14399948498437e-05;-17.8535755530234,-368.664584770141,1];
T=maketform('projective',T1);   %????

[imgn X Y]=imtransform(img1,T);     %??
mask=imtransform(mask,T);

T2=eye(3);
if X(1)>0, T2(3,1)= X(1); end
if Y(1)>0, T2(3,2)= Y(1); end
T2=maketform('affine',T2);      %????

imgn=imtransform(imgn,T2,'XData',[1 w2],'YData',[1 h2]);    %??
mask=imtransform(mask,T2,'XData',[1 w2],'YData',[1 h2]);
tempy=115;
tempx=18;
result(1+tempy:480+tempy,1:640-tempx+1,:)=imgn(:,tempx:640,:);
result(1:tempy,640-tempx+2:640,:)=0;
result(481:960,:,:)=img2;
%figure;imshow(result);%for function disable it

%mwrite(result,'45.jpg');
end
