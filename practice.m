clc;
clear;

imagefiles = dir('images\*.jpg');      
nfiles = length(imagefiles);    % Number of files found
for ii=1:nfiles
   currentfilename = imagefiles(ii).name;
   currentimage = imread(strcat('images\',currentfilename));
   images{ii} = currentimage;
end

% for k = 1:nfiles
%     subplot(30,10,k);
%     %figure;
%     imshow(images{k});
% end

imgred=images{1}(:,:,1)

