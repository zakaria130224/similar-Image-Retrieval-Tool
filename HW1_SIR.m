%Farhana Tazmim Pinki
%Similar Image Retrival
%im = zeros(1,15);
%disp(size(im));
imagefiles = dir('images/*.jpg');      
nfiles = length(imagefiles);    % Number of files found
features = zeros(15,10);
Qfeatures=zeros(15,9);
for ii=1:nfiles
   currentfilename = imagefiles(ii).name;
   imgName = strsplit(currentfilename,'.');
   currentImagePath = strcat('images/',currentfilename);
   I = imread(currentImagePath);
   %disp(imgName(1));
   name = str2num(imgName{1});
   Red=I(:,:,1);
   Green=I(:,:,2);
   Blue=I(:,:,3);
   redMean = double(std2(Red));
   greenMean = double(std2(Green));
   blueMean = double(std2(Blue));
   
 redMode = double(mode(Red(:)));
 greenMode =double(mode(Green(:)));
 bluemode = double(mode(Blue(:)));
 
redMr=double((max(Red(:))+min(Red(:)))/2);
greenMr=double((max(Green(:))+min(Green(:)))/2);
blueMr=double((max(Blue(:))+min(Blue(:)))/2);
   
   features(ii,:) = [redMean greenMean blueMean redMr greenMr blueMr  redMode greenMode  bluemode  name]; 
end

imgNames = features(:, end);
features(:, end) = [];
%disp(size(imgNames));
q = imread('images/595.jpg');
R=q(:,:,1);
G=q(:,:,2);
B=q(:,:,3);
redMean =double( mean2(R));
greenMean = double(mean2(G));
blueMean = double(mean2(B));

redMode = double(mode(R(:)));
greenMode =double( mode(G(:)));
bluemode = double(mode(B(:)));

redMr=double((max(R(:))+min(R(:)))/2);
greenMr=double((max(G(:))+min(G(:)))/2);
blueMr=double((max(B(:))+min(B(:)))/2);

Qfeatures = [redMean greenMean blueMean redMr greenMr blueMr redMode greenMode  bluemode ];
euclidean = zeros(15,1);
for k = 1:15
   % euclidean(k) = sqrt( sum( power( features(k, :) - Qfeatures, 2 ) ) ); 
     euclidean(k) = sum( abs(features(k, :) - Qfeatures));  
end
% supremum= zeros(15,1);
% for k = 1:15
%     supremum(k) = max(features(k, :) - Qfeatures ) ;  
% end
%disp(euclidean);
euclidean = [euclidean imgNames];
% supremum = [supremum imgNames];
%disp(euclidean);
% sort them according to smallest distance
[sortEuclidDist index] = sortrows(euclidean);
% [sortSupreDist index] = sortrows(supremum);
%disp(sortEuclidDist);
sortedEuclidImgs = sortEuclidDist(:, 2);
 %sortedSupreImgs = sortSupreDist(:, 2);
% dispaly images returned by query
fprintf('using Eucledian distance\n');
for m = 1:5
    img_name = sortedEuclidImgs(m);
    img_name = int2str(img_name);
    disp(img_name);
end
% fprintf('using supremum distance\n');
% for m = 1:5
%     img_name = sortedEuclidImgs(m);
%     img_name = int2str(img_name);
%     disp(img_name);
% end
% 
% im(1) = imread('images\300.jpg');
% im(2) = imread('images\301.jpg');
% im(3) = imread('images\302.jpg');
% im(4) = imread('images\303.jpg');
% im(5) = imread('images\304.jpg');
% im(6) = imread('images\400.jpg');
% im(7) = imread('images\401.jpg');
% im(8) = imread('images\402.jpg');
% im(9) = imread('images\403.jpg');
% im(10) = imread('images\404.jpg');
% im(11) = imread('images\500.jpg');
% im(12) = imread('images\501.jpg');
% im(13) = imread('images\502.jpg');
% im(14) = imread('images\503.jpg');
% im(15) = imread('images\504.jpg');
% 

% Rim1=im1(:,:,1);
% Gim1=im1(:,:,2);
% Bim1=im1(:,:,3);
% 
% Rim2=im2(:,:,1);
% Gim2=im2(:,:,2);
% Bim2=im2(:,:,3);
% 
% Rim3=im3(:,:,1);
% Gim3=im3(:,:,2);
% Bim3=im3(:,:,3);
% 
% Rim4=im4(:,:,1);
% Gim4=im4(:,:,2);
% Bim4=im4(:,:,3);
% 
% Rim5=im5(:,:,1);
% Gim5=im5(:,:,2);
% Bim5=im5(:,:,3);
% 
% Rim6=im6(:,:,1);
% Gim6=im6(:,:,2);
% Bim6=im6(:,:,3);
% 
% Rim7=im7(:,:,1);
% Gim7=im7(:,:,2);
% Bim7=im7(:,:,3);
% 
% Rim8=im8(:,:,1);
% Gim8=im8(:,:,2);
% Bim8=im8(:,:,3);
% 
% Rim9=im9(:,:,1);
% Gim9=im9(:,:,2);
% Bim9=im9(:,:,3);
% 
% Rim10=im10(:,:,1);
% Gim10=im10(:,:,2);
% Bim10=im10(:,:,3);
% 
% Rim11=im11(:,:,1);
% Gim12=im12(:,:,2);
% Bim12=im12(:,:,3);
% 
% Rim13=im13(:,:,1);
% Gim13=im13(:,:,2);
% Bim13=im13(:,:,3);
% 
% Rim14=im14(:,:,1);
% Gim14=im14(:,:,2);
% Bim14=im14(:,:,3);
% 
% Rim15=im15(:,:,1);
% Gim15=im15(:,:,2);
% Bim15=im15(:,:,3);
% 
% RMeanim1=mean2(Rim1);
% GMeanim1=mean2(Gim1);
% BMeanim1=mean2(Bim1);
% 
% RMeanim1=mean2(Rim1);
% GMeanim1=mean2(Gim1);
% BMeanim1=mean2(Bim1);
% 
% 
% 
