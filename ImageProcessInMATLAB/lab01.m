
%green.jpg
img1green = imread('01.jpg');
img1green(:,:,2) = 0;

figure, imshow(img1green)
imwrite(img1green, 'green.jpg')


%gray.jpg
img1gray = imread('01.jpg');

Y = 0.2989 * img1gray(:,:,1) + 0.5870 * img1gray(:,:,2) + 0.1140 * img1gray(:,:,3);


figure, imshow(Y)
imwrite(Y, 'grey.jpg')

%rotate.jpg
img1rotate = imread('01.jpg');

S = imrotate(img1rotate, 90);

figure, imshow(S)
imwrite(S, 'rotate.jpg')

%crop.jpg
img1crop = imread('01.jpg');

C = img1crop(100:300, 10:270, :);

figure, imshow(C)
imwrite(C, 'crop.jpg')

%flip.jpg
img1flip = imread('01.jpg');

F = flip(img1flip,2);

figure, imshow(F)
imwrite(F, 'flip.jpg')

%combine.jpg
img1combine = imread('01.jpg');
img2combine = imread('02.jpg');
img3combine = imread('03.jpg');
img4combine = imread('04.jpg');

canvas = zeros( (300*2 + 10), (400*2 + 10) , 3, 'uint8');
canvas(1:300, 1:400, :) = img1combine;
canvas(1:300, 411:810, :) = img2combine;
canvas(311:610, 1:400, :) = img3combine;
canvas(311:610, 411:810, :) = img4combine;

figure, imshow(canvas);
imwrite(canvas, 'combine.jpg')

%average.jpg
img5average = imread('05.jpg');
img6average = imread('06.jpg');

FifthAvg = img5average(:);
SixthAvg = img6average(:);

Avg = (FifthAvg + SixthAvg)/2;
Avg = reshape(Avg, 375, 1242, 3);
figure, imshow(Avg)
imwrite(Avg, 'average.jpg')

