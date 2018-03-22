fileName = '4.avi';   
obj = VideoReader(fileName);  
numFrames = obj.NumberOfFrames;% ????  
%??????????????  
if ~exist('ImageTest')  
     mkdir('ImageTest');  
end  
 for k = 1 : numFrames  
     frame = read(obj,k);% ????  
     %imshow(frame);%???  
     imwrite(frame,strcat('./ImageTest/',sprintf('%04d.jpg',k)),'jpg');% ???  
     %?????0001.jpg?0002.jpg?...  
end  