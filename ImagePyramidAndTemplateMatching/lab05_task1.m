


% Part 1: Gaussian Pyramid & Laplacian Pyramid
% Gaussian_scale1.jpg ~ Gaussian_scale5.jpg
% Laplacian_scale1.jpg ~ Laplacian_scale5.jpg

img = im2double(imread('lena.jpg'));

sigma = 2.0;
hsize = 7;
scale = 5;

% Gaussian Pyramid
gaussImg = img;
for s = 1:scale
    % Gaussian filter
    gfpy = imfilter(gaussImg, fspecial('gaussian', hsize, sigma));

    % Save or show image
    imwrite(gaussImg, sprintf('Gaussian_scale%d.jpg', s));

    % Down-sampling
    gaussImg = imresize(gfpy, 1/2);
end




% Laplacian Pyramid
LapImg = img;
for s = 1:scale
    % Gaussian filtering
    gfpy2 = imfilter(LapImg, fspecial('gaussian', hsize, sigma));

    % Laplacian filtering
    Lapout = LapImg - gfpy2;

    % Save or show image
    imwrite(Lapout + 0.5, sprintf('Laplacian_scale%d.jpg', s));

    % Down-sampling
    LapImg = imresize(gfpy2, 1/2);
end


