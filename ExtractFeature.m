function [feature]= ExtractFeature (im)
%feature=zeros(1,9); 
red_channel=im(:,:,1);
green_channel=im(:,:,2);
blue_channel=im(:,:,3);

redSD =double( std2(red_channel));
greenSD = double(std2(green_channel));
blueSD = double(std2(blue_channel));

RMedian = double(median(red_channel(:)));
GMedian =double(median(green_channel(:)));
BMedian = double(median(blue_channel(:)));

RRange=double((max(red_channel(:))-min(red_channel(:))));
GRange=double((max(green_channel(:))-min(green_channel(:))));
BRange=double((max(blue_channel(:))-min(blue_channel(:))));
feature = [redSD greenSD blueSD RMedian GMedian BMedian RRange GRange  BRange ];
end