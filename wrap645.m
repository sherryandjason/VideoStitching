function[result]=wrap645(img1,img2)
% clear all;close all;clc;
% img1=imread('6.jpg');
% img1=rgb2gray(img1);
[h1 w1 d1]=size(img1);
mask=uint8(ones(h1,w1));
%img2=imread('45.jpg');
%img2=rgb2gray(img2);
[h2 w2 d2]=size(img2);

T1=[1.06883963712160,0.0369246621774583,6.52276249270212e-05;0.00822961876335268,1.10196119376293,0.000117998397597939;17.8710062603510,346.882759894053,1];
T=maketform('projective',T1);   %????

[imgn X Y]=imtransform(img1,T);     %??
mask=imtransform(mask,T);

T2=eye(3);
if X(1)<0, T2(3,1)= X(1); end
if Y(1)<0, T2(3,2)= Y(1); end
T2=maketform('affine',T2);      %????

imgn=imtransform(imgn,T2,'XData',[1 w2],'YData',[1 h2]);    %??
mask=imtransform(mask,T2,'XData',[1 w2],'YData',[1 h2]);

tempy=131;
tempx=19;
result(961-tempy:1440-tempy,tempx+1:tempx+640,:)=imgn(1:480,:,:);
result(1:960,1:640,:)=img2;
result65=result;
%figure;imshow(result);
%imwrite(result,'456.jpg');
end
