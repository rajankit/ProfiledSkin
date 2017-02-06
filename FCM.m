I=imread('image.jpg');
I=imcrop(I);
I=double(I);

I=I(:,:,1);
c1=25;
k=1;
c2=200;
m=2;
[r,c]=size(I);
I1=zeros(r,c);
I2=zeros(r,c);

for i=1:r
    
    for j=1:c
        u1(k)=1./(((I(i,j)-c1)./(I(i,j)-c1)).^2+((I(i,j)-c1)./(I(i,j)-c2)).^2);
        if(isnan(u1(k)))
            u1(k)=1;
        end
        u2(k)=1./(((I(i,j)-c2)./(I(i,j)-c1)).^2+((I(i,j)-c2)./(I(i,j)-c2)).^2);
        if(isnan(u2(k)))
            u2(k)=1;
        end
        k=k+1;
        
    end
end
U=[u1;u2;u1+u2]';
k=1;sum1=0;sum2=0;sum3=0;sum4=0;
for i=1:r
    for j=1:c
sum1=sum1+((u1(k).^2).*I(i,j));sum2=sum2+(u1(k).^2);
sum3=sum3+((u2(k).^2).*I(i,j));sum4=sum4+(u2(k).^2);
k=k+1;
    end
end

cc1=sum1/sum2;
cc2=sum3/sum4;
c1=cc1;
c2=cc2;

k=1;
for i=1:r
    for j=1:c
        if u1(k)>=0.005 && u1(k)<=0.1
            I1(i,j)=I(i,j);
        else
            I2(i,j)=I(i,j);
        end
       k=k+1;
    end
end
% end
z=imadd(I1,I2);
figure,imshow(I1,[]);
title('Segmented Image 1');
figure,imshow(I2,[]);
title('Segmented Image 2');

figure,imshow(z,[]);
title('original image');

        
        
        