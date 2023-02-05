


% Part 1: rotate_0.jpg

% read img file into img1
img1 = imread("01.jpg");

% create dimensions
y1 = 300;
x1 = 400;

% create origin point
y0 = 150;
x0 = 200;

% create imgForwardWarp canvas
imgForwardWarp = zeros(y1, x1, 3, 'uint8');

% until we reach dimensions of image...
for i = 1:y1
    for j = 1:x1

        % rotate x2 and y2
        x2 = cosd(45)*(j-x0) + sind(45) * (i-y0) + x0;
        y2 = -1*sind(45) * (j-x0) + cosd(45) * (i-y0) + y0;
        
        % round the values accordingly
        y2 = round(y2);
        x2 = round(x2);

        % And until we reach the acutal image dimension
        if 1 <= y2 && y2 <= 300 && 1<= x2 && x2 <= 400

            % we set the following equal to the image
            imgForwardWarp(y2, x2,:) = img1(i,j,:);
        end 

    end

end

% Show the img in the figure to confirm
figure, imshow(imgForwardWarp)

% Write the image into a new jpg
imwrite(imgForwardWarp, 'rotate_0.jpg')






% Part 2: rotate_1.jpg

% create imgBackwardWarp canvas
imgBackwardWarp = zeros(y1, x1, 3, 'uint8');

% until we reach dimensions of image...
for y2 = 1:300
    for x2 = 1:400

        % rotate x1 and y1
        x1 = cosd(45)*(x2-x0) - sind(45) * (y2-y0) + x0;
        y1 = sind(45) * (x2-x0) + cosd(45) * (y2-y0) + y0;

        % round the values accordingly
        x1 = round(x1);
        y1 = round(y1);

        % And until we reach the acutal image dimension
        if 1 <= y1 && y1 <= 300 && 1<= x1 && x1 <= 400

            % we set the following equal to the image
            imgBackwardWarp(y2, x2,:) = img1(y1,x1,:);
        end 

        
    end
end

% Show the img in the figure to confirm
figure, imshow(imgBackwardWarp)

% Write the image into a new jpg
imwrite(imgBackwardWarp, 'rotate_1.jpg')






% Part 3: median_0.jpg

% Define the size of our patch
patch = 3;

% Read our lena_noisy image and save it to img2
img2 = im2double(imread('lena_noisy.jpg'));

% Set median0 equal to our median_filter function
median0 = median_filter(img2, patch);

% Show the img in the figure to confirm
figure, imshow(median0)

% Write the image into a new jpg
imwrite(median0, 'median_0.jpg')






% Part 4: median_1.jpg

% Redefine the size of our patch
patch2 = 5;

% Set median1 equal to our median_filter function
median1 = median_filter(img2, patch2);

% Show the img in the figure to confirm
figure, imshow(median1)

% Write the image into a new jpg
imwrite(median1, 'median_1.jpg')


