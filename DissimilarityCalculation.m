function DissimilarityCalculation (folderDr,imgDr)
% folderDr='D:\Projects\DataMining\HomeTask_1\images';
% imgDr='D:\Projects\DataMining\HomeTask_1\images\498.jpg';
im = imread(imgDr);
T_feature = zeros(15,9);
%Q_feature=zeros(1,9); 
M_dis = zeros(15,1);
C_dis= zeros(15,1);
image_names = zeros(15,1);
% %calculation for input image
% red_channel=im(:,:,1);
% green_channel=im(:,:,2);
% blue_channel=im(:,:,3);
% 
% redSD =double( std2(red_channel));
% greenSD = double(std2(green_channel));
% blueSD = double(std2(blue_channel));
% 
% RMedian = double(median(red_channel(:)));
% GMedian =double(median(green_channel(:)));
% BMedian = double(median(blue_channel(:)));
% 
% RRange=double((max(red_channel(:))-min(red_channel(:))));
% GRange=double((max(green_channel(:))-min(green_channel(:))));
% BRange=double((max(blue_channel(:))-min(blue_channel(:))));
Q_feature=ExtractFeature(im);
% Q_feature = [redSD greenSD blueSD RMedian GMedian BMedian RRange GRange  BRange ];
%end calculation for input image
%input 15 images from folder
     
 
imagefiles = dir(strcat(folderDr,'\*.jpg'));
nfiles = length(imagefiles);    % Number of files found
for ii=1:nfiles
   currentfilename = imagefiles(ii).name;
   image_name_str = strsplit(currentfilename,'.');
   currentimage = imread(strcat(folderDr,'\',currentfilename));
   image = currentimage;
   image_name = str2num(image_name_str{1});
   image_names(ii) = image_name;
   
%    Red=image(:,:,1);
%    Green=image(:,:,2);
%    Blue=image(:,:,3);
%    
%    redSD = double(std2(Red));
%    greenSD = double(std2(Green));
%    blueSD = double(std2(Blue));
%    
%    RMedian = double(median(Red(:)));
%    GMedian =double(median(Green(:)));
%    BMedian = double(median(Blue(:)));
%  
%    RRange=double((max(Red(:))-min(Red(:))));
%    GRange=double((max(Green(:))-min(Green(:))));
%    BRange=double((max(Blue(:))-min(Blue(:))));
   T_feature(ii,:)=ExtractFeature(image);
   %T_feature(ii,:) = [redSD greenSD blueSD RMedian GMedian BMedian  RRange GRange  BRange]; 
   %distance calculation
   M_dis(ii) =sum(abs( T_feature(ii, :) - Q_feature));
   %C_dis(ii) =sum(abs( T_feature(ii, :) .* Q_feature))/(sqrt(sum(power(T_feature,2)))*sqrt(sum(power(Q_feature,2))));
   C_dis(ii)=dot(T_feature(ii, :),Q_feature)/(norm(T_feature(ii, :))*norm(Q_feature));
end
M_dis = [M_dis image_names];
C_dis = [C_dis image_names];
[sorted_M_dis index] = sortrows(M_dis,-1);
[sorted_C_dis index] = sortrows(C_dis);
figure('Name','Using Manhattan Distance','NumberTitle','off')
for k = 1:5
    subplot(1,5,k);
    %figure;
    imshow(strcat(folderDr,'\',int2str(sorted_M_dis(k,2)),'.jpg'));title(int2str(sorted_M_dis(k,2)));
end
figure('Name','Using Cosine Distance','NumberTitle','off')
for k = 1:5
    subplot(1,5,k);
    %figure;
    imshow(strcat(folderDr,'\',int2str(sorted_C_dis(k,2)),'.jpg'));title(int2str(sorted_C_dis(k,2)));
end

end
