



% Part 1: lena_low_0.1.jpg and lena_high_0.1.jpg

% Read image file 
img = im2double(imread('lena.jpg'));

% Declare our ratio
ratio = 0.1;

% Use our separate frequency function
[lp, hp] = separate_frequency(img, ratio);

% Show low pass and high pass onto figures
figure, imshow(lp);
figure, imshow(hp + 0.5);

% Write the images into new jpg files
imwrite(lp, 'lena_low_0.1.jpg');
imwrite(hp + 0.5, 'lena_high_0.1.jpg');




% Part 2: lena_low_0.2.jpg and lena_high_0.2.jpg

% Declare our ratio
ratio = 0.2;

% Use our separate frequency function
[lp, hp] = separate_frequency(img, ratio);

% Show low pass and high pass onto figures
figure, imshow(lp);
figure, imshow(hp + 0.5);

% Write the images into new jpg files
imwrite(lp, 'lena_low_0.2.jpg');
imwrite(hp + 0.5, 'lena_high_0.2.jpg');




% Part 3: hybrid_1.jpg

% Read image files
mari_img = im2double(imread('marilyn.jpg'));
ein_img = im2double(imread('einstein.jpg'));

% Declare our ratio
ratio = 0.2;

% Use our hybrid image function
img_merged = hybrid_image(mari_img, ein_img, ratio);

% Show merged image onto figure
figure, imshow(img_merged);

% Write the image into a new jpg file
imwrite(img_merged, 'hybrid_1.jpg');




% Part4: hybrid_2.jpg

% Declare our ratio
ratio = 0.2;

% Use our hybrid image function
img_merged = hybrid_image(ein_img, mari_img, ratio);

% Show merged image onto figure
figure, imshow(img_merged);

% Write the image into a new jpg file
imwrite(img_merged, 'hybrid_2.jpg');



