function [disim] = disimillerity(img1ch,img2ch,img1SD,img2SD)


% 
 disim=sqrt(power(img1ch(1)-img2ch(1),2)+power(img1ch(2)-img2ch(2),2)+power(img1ch(3)-img2ch(3),2)+power(img1SD(1)-img2SD(1),2)+power(img1SD(2)-img2SD(2),2)+power(img1SD(3)-img2SD(3),2));

 
end