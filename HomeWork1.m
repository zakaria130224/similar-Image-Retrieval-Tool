%Md. Ashiqur Rahman
%Student ID: 130223
%Similar Image Retrival

clc;
RedMean = zeros(15,1);
GreenMean = zeros(15,1);
BlueMean = zeros(15,1);
RedMode = zeros(15,1);
GreenMode = zeros(15,1);
BlueMode = zeros(15,1);
RedMidrange = zeros(15,1);
GreenMidrange = zeros(15,1);
BlueMidrange = zeros(15,1);

Euclidean = zeros(15,1);
Supermum = zeros(15,1);

%Taking Input Images and Their Features
for i = 1:15   
    ImageName = int2str(i);
    ImagePath = strcat(ImageName,'.jpg');
    im = imread(ImagePath);
    
    Red = double(im(:,:,1));
    Green = double(im(:,:,2));
    Blue = double(im(:,:,3));
    
    RedMean(i) = mean(Red(:));
    GreenMean(i) = mean(Green(:));
    BlueMean(i) = mean(Blue(:));
    
    RedMode(i) = mode(Red(:));
    GreenMode(i) = mode(Green(:));
    BlueMode(i) = mode(Blue(:));
    
    RedMidrange(i) = (max(Red(:))+min(Red(:)))/2;
    GreenMidrange(i) = (max(Green(:))+min(Green(:)))/2;
    BlueMidrange(i) = (max(Blue(:))+min(Blue(:)))/2;       
end

%Taking Query Image and Its Features
query = imread('Dinosur 2.jpg');

Red = double(query(:,:,1));
Green = double(query(:,:,2));
Blue = double(query(:,:,3));
    
RedMeanQ = mean(Red(:));
GreenMeanQ = mean(Green(:));
BlueMeanQ = mean(Blue(:));
    
RedModeQ = mode(Red(:));
GreenModeQ = mode(Green(:));
BlueModeQ = mode(Blue(:));
    
RedMidrangeQ = (max(Red(:))+min(Red(:)))/2;
GreenMidrangeQ = (max(Green(:))+min(Green(:)))/2;
BlueMidrangeQ = (max(Blue(:))+min(Blue(:)))/2;

%Distnace Measuring using Euclidean and Supermum Method
for i = 1:15   
    Euclidean(i) = sqrt((RedMean(i)-RedMeanQ)^2+(GreenMean(i)-GreenMeanQ)^2+(BlueMean(i)-BlueMeanQ)^2+(RedMode(i)-RedModeQ)^2+(GreenMode(i)-GreenModeQ)^2+(BlueMode(i)-BlueModeQ)^2+(RedMidrange(i)-RedMidrangeQ)^2+(GreenMidrange(i)-GreenMidrangeQ)^2+(BlueMidrange(i)-BlueMidrangeQ)^2);
    
    SupermumValues = [abs(RedMean(i)-RedMeanQ),abs(GreenMean(i)-GreenMeanQ),abs(BlueMean(i)-BlueMeanQ),abs(RedMode(i)-RedModeQ),abs(GreenMode(i)-GreenModeQ),abs(BlueMode(i)-BlueModeQ),abs(RedMidrange(i)-RedMidrangeQ),abs(GreenMidrange(i)-GreenMidrangeQ),abs(BlueMidrange(i)-BlueMidrangeQ)];
    
    Supermum(i) = max(SupermumValues);
end

SortedEuclidean = sort(Euclidean);
SortedSupermum = sort(Supermum);

indexEuclidean = zeros(5,1);
indexSupermum = zeros(5,1);

%Finding the similar images
for i = 1:5
    for j = 1:15
       if(SortedEuclidean(i) == Euclidean(j)) 
           indexEuclidean(i) = j;
       end
    end
    for j = 1:15
       if(SortedSupermum(i) == Supermum(j)) 
           indexSupermum(i) = j;
       end
    end
end

%Output Print
fprintf('Most similar 5 images with the query image:\n\n');
fprintf('Using Euclidean distance: ');
for i = 1:5
    fprintf('%d   ',indexEuclidean(i));
end
fprintf('\n\nUsing Supermum distance: ');
for i = 1:5
    fprintf('%d   ',indexSupermum(i));
end

subplot(2,3,1);
imshow(query);title('Query image');
for i = 1:5
    image = indexEuclidean(i);
    ImageName = int2str(image);
    ImagePath = strcat(ImageName,'.jpg');
    im = imread(ImagePath);
    subplot(2,3,i+1);
    imshow(im);title(image);
end

figure,subplot(2,3,1);
imshow(query);title('Query image');
for i = 1:5
    image = indexSupermum(i);
    ImageName = int2str(image);
    ImagePath = strcat(ImageName,'.jpg');
    im = imread(ImagePath);
    subplot(2,3,i+1);
    imshow(im);title(image);
end
fprintf('\n\n');

