clc;
clear;
im300= imread('images\300.jpg');
im301= imread('images\301.jpg');
im401= imread('images\401.jpg');

im300red = (im300(:,:,1));
im300green = (im300(:,:,2));
im300blue = (im300(:,:,3));

im301red = (im301(:,:,1));
im301green = (im301(:,:,2));
im301blue = (im301(:,:,3));

im401red = (im401(:,:,1));
im401green = (im401(:,:,2));
im401blue = (im401(:,:,3));

%Calculatio of 300
%mean
im300redMean=mean2(im300red);
im300greenMean=mean2(im300green);
im300blueMean=mean2(im300blue);

img1ch=[im300redMean,im300greenMean,im300blueMean];

%SD
im300redSD=std2(im300red);
im300greenSD=std2(im300green);
im300blueSD=std2(im300blue);
img1SD=[im300redSD,im300greenSD,im300blueSD];



%Calculatio of 301
%mean
im301redMean=mean2(im301red);
im301greenMean=mean2(im301green);
im301blueMean=mean2(im301blue);
img2ch=[im301redMean,im301greenMean,im301blueMean];

%SD
im301redSD=std2(im301red);
im301greenSD=std2(im301green);
im301blueSD=std2(im301blue);
img2SD=[im301redSD,im301greenSD,im301blueSD];

%Calculatio of 401
%mean
im401redMean=mean2(im401red);
im401greenMean=mean2(im401green);
im401blueMean=mean2(im401blue);
img3ch=[im401redMean,im401greenMean,im401blueMean];
%SD
im401redSD=std2(im401red);
im401greenSD=std2(im401green);
im401blueSD=std2(im401blue);
img3SD=[im401redSD,im401greenSD,im401blueSD];

%dissimiler 
N=3;
 vec=zeros(1,N);
 A=zeros(3,3);
 D300v301=disimillerity(img1ch,img2ch,img1SD,img2SD);
 disp('300 vs 301');
disp(D300v301);
vec(1)=D300v301;
A(2,1)=D300v301;
A(1,2)=D300v301;

D300v401=disimillerity(img1ch,img3ch,img1SD,img3SD);
disp('300 vs 401');
vec(2)=D300v401;
disp(D300v401);
A(3,1)=D300v401;
A(1,3)=D300v401;

D301v401=disimillerity(img2ch,img3ch,img2SD,img3SD);
disp('301 vs 401');
vec(3)=D301v401;
disp(D301v401);
A(3,2)=D301v401;
A(2,3)=D301v401;

mind=min(vec);

disp(A);
m=0;
n=0;
min=A(2,1);
for c = 1:3
    for r = 1:3
            if(A(c,r)==mind)
                m=c;
                n=r;
            end
    end
end
 disp('Most Simmiler:')
fprintf('%d vs %d \n',m,n);




