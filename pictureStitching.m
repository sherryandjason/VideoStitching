clear all;close all;clc;
img4=imread('4.jpg');
img4=rgb2gray(img4);
img5=imread('5.jpg');
img5=rgb2gray(img5);
img45=wrap45(img4,img5);
img6=imread('6.jpg');
img6=rgb2gray(img6);
img645=wrap645(img6,img45);
img2=imread('2.jpg');
img2=rgb2gray(img2);
img2645=wrap2645(img2,img645);
img3=imread('3.jpg');
img3=rgb2gray(img3);
img32645=wrap32645(img3,img2645);
img1=imread('1.jpg');
img1=rgb2gray(img1);
img132645=wrap132645(img1,img32645);