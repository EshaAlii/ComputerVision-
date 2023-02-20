% Part 1: sobel_h.jpg

% Read img file into img
img = im2double(imread("lena.jpg"));

% Define our horizontal kernel
H = [1, 2, 1; 0, 0, 0; -1, -2, -1];

% Call on our sobel_filter
sobel_h = sobel_filter(img, H);

% Output the horizontal sobel onto a figure
figure, imshow(sobel_h)

% Save it as a jpg
imwrite(sobel_h, 'sobel_h.jpg')



% Part 2: sobel_v.jpg

% Define our vertical kernel
V = [1, 0, -1; 2, 0, -2; 1, 0, -1];

% Call on our sobel filter 
sobel_v = sobel_filter(img, V);

% Output the vertical sobel onto a figure
figure, imshow(sobel_v)

% Save it as a jpg
imwrite(sobel_v, 'sobel_v.jpg')


% Part 3: gaussian_5.jpg

% Define our hsize and sigma
hsize = 5;
sigma = 2;

% Call on our gaussian filter
gauss_5 = gaussian_filter(img, hsize, sigma);

% Output our gaussian filter with an hsize of 5 onto a figure
figure, imshow(gauss_5);

% Save it as a jpg
imwrite(gauss_5, 'gaussian_5.jpg')


% Part 4: gaussian_9.jpg

% Define our hsize and sigma
hsize = 9;
sigma = 4;

% Call on our gaussian filter
gauss_9 = gaussian_filter(img, hsize, sigma);

% Output our gaussian filter with an hsize of 5 onto a figure
figure, imshow(gauss_9);

% Save it as a jpg
imwrite(gauss_9, 'gaussian_9.jpg')

