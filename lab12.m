imagefiles = dir('images/*.jpg'); 
nfiles = length(imagefiles); 
features = zeros(15,10);
Qfeatures=zeros(1,9);
for i=1:nfiles
   currentfilename = imagefiles(i).name;
   imgName = strsplit(currentfilename,'.');
   
   currentImagePath = strcat('images/',currentfilename);
   
   I = imread(currentImagePath);
   
   name = str2num(imgName{1});
   Red=double(I(:,:,1));
   Green=double(I(:,:,2));
   Blue=double(I(:,:,3));
   redmedian = (median(Red(:)));
   greenmedian = (median(Green(:)));
   bluemedian = (median(Blue(:)));
   
   redrange = range(Red(:));
   greenrange =range(Green(:));
   bluerange = range(Blue(:));
   
   redstd = std(Red(:));
   greenstd =std(Green(:));
   bluestd = std(Blue(:));
 
   features(i,:) = [redmedian greenmedian bluemedian redrange greenrange bluerange redstd greenstd  bluestd  name]; 
end

imgNames = features(:, end);
features(:, end) = [];

q = imread('images/495.jpg');
R=double(q(:,:,1));
G=double(q(:,:,2));
B=double(q(:,:,3));
 redmedian = (median(R(:)));
 greenmedian = (median(G(:)));
 bluemedian = (median(B(:)));
   
 redrange = (range(R(:)));
 greenrange =(range(G(:)));
 bluerange = (range(B(:)));
   
 redstd = (std(R(:)));
 greenstd =(std(G(:)));
 bluestd = (std(B(:)));

Qfeatures = [redmedian greenmedian bluemedian redrange greenrange bluerange redstd greenstd  bluestd ];
manhattan = zeros(15,1);
for k = 1:15
    manhattan(k) = sum(abs(features(k,:)- Qfeatures));
end
cosine= zeros(15,1);
value2=sqrt(sum(Qfeatures.*Qfeatures));
for k = 1:15
     value=sum(features(k,:).*Qfeatures);
     value1=sqrt(sum(features(k,:).*features(k,:)));
     cosine(k)=1-(value/(value1*value2));
     %disp(cosine);
end
manhattan = [manhattan imgNames];
cosine=[cosine imgNames];
%disp(manhattan);
[sortmanhattanDist] = sortrows(manhattan);
[sortCosineDist ] = sortrows(cosine);
%disp(index);
disp(sortmanhattanDist);
sortmanhattanDist = sortmanhattanDist(:, 2);
sortCosineDist = sortCosineDist(:, 2);

fprintf('using Manhattan distance\n');
for m = 15:-1:11
    img_name = sortmanhattanDist(m);
    img_name = int2str(img_name);
    fprintf(img_name);
    fprintf('.jpg\n');
end
fprintf('using Cosine distance\n');
for m = 15:-1:11
    img_name = sortCosineDist(m);
    img_name = int2str(img_name);
    fprintf(img_name);
    fprintf('.jpg\n');
end

