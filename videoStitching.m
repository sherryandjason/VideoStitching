clear all;close all;clc;
fileName1='1.avi';
fileName2='2.avi';
fileName3='3.avi';
fileName4='4.avi';
fileName5='5.avi';
fileName6='6.avi';
obj1=VideoReader(fileName1);
obj2=VideoReader(fileName2);
obj3=VideoReader(fileName3);
obj4=VideoReader(fileName4);
obj5=VideoReader(fileName5);
obj6=VideoReader(fileName6);
numFrames = obj1.NumberOfFrames-20;
if ~exist('ImageStitching')  
     mkdir('ImageStitching');  
end
%%
%%video Create
framesPath = 'ImageStitching\';%????????????????????  
videoName = 'Stitching.avi';%??????????????  
fps = 10; %??  
startFrame = 1; %??????  
endFrame = 70; %?????  
  
if(exist('videoName','file'))  
    delete Stitching.avi 
end  
  
%?????????  
aviobj=VideoWriter(videoName);  %????avi?????????????  
aviobj.FrameRate=fps; 
open(aviobj);

%%
for k = 1 : numFrames
     img1 = read(obj1,k);
     img2 = read(obj2,k);
     img3 = read(obj3,k);
     img4 = read(obj4,k);
     img5 = read(obj5,k);
     img6 = read(obj6,k);
%      img1=rgb2gray(img1);
%      img2=rgb2gray(img2);
%      img3=rgb2gray(img3);
%      img4=rgb2gray(img4);
%      img5=rgb2gray(img5);
%      img6=rgb2gray(img6);
     img45=wrap45(img4,img5);
     img645=wrap645(img6,img45);
     img2645=wrap2645(img2,img645);
     img32645=wrap32645(img3,img2645);
     img132645=wrap132645(img1,img32645);     
     writeVideo(aviobj,img132645); 
     imwrite(img132645,strcat('./ImageStitching/',sprintf('%04d.jpg',k)),'jpg'); 
     %save as 0001.jpg?0002.jpg?...  
end  
close(aviobj);