S = imread('image.jpg');
S=rgb2gray(S);
figure,imhist(S);
% S=imcrop(S);
I=S;
% figure,imhist(S);title('Histogram');
figure,imshow(S);

[r,c]=size(S);
for i = 1:r
    for j = 1:c
        if S(i,j)>160 && S(i,j) <200
            S(i,j)=0;
        end
    end
end
I=imsubtract(I,S);
figure,imshow(I);
figure,imshow(S);
title('Segmented image');
