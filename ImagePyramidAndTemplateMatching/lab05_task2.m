


% Part 2: Template Matching SSD
% einsteing1_ssd_output.jpg, einstein1_ssd_match.jpg, 
% einsteing2_ssd_output.jpg, einsteing2_ssd_match.jpg




% einstein1_ssd
name = 'einstein1';

img = im2double(imread(sprintf('%s.jpg', name)));
template = im2double(imread('template.jpg'));

% SSD
threshold = 25;
[output, match] = template_matching_SSD(img, template, threshold);

figure, imshow(output ./ max(output(:))); title('SSD output');

figure, imshow(match); title('SSD match');

imwrite(output ./ max(output(:)), sprintf('%s_ssd_output.jpg', name));
imwrite(match, sprintf('%s_ssd_match.jpg', name));





% einstein2_ssd
name = 'einstein2';
img = im2double(imread(sprintf('%s.jpg', name)));
template = im2double(imread('template.jpg'));

% SSD
threshold = 36;
[output, match] = template_matching_SSD(img, template, threshold);

figure, imshow(output ./ max(output(:))); title('SSD output');

figure, imshow(match); title('SSD match');

imwrite(output ./ max(output(:)), sprintf('%s_ssd_output.jpg', name));
imwrite(match, sprintf('%s_ssd_match.jpg', name));






% Part 3: Template Matching Normcorr
% einstein1_normcorr_output.jpg, eintstein1_normcorr_match.jpg
% einstein2_normcorr_output.jpg, einstein2_normcorr_match.jpg




% einstein1_normcorr
name = 'einstein1';
threshold = 0.5;
[output, match] = template_matching_normcorr(img, template, threshold);

figure, imshow(output ./ max(output(:)));
title('NormCorr output');
figure, imshow(match); title('NormCorr match');

imwrite(output ./ max(output(:)), sprintf('%s_normcorr_output.jpg', name));
imwrite(match, sprintf('%s_normcorr_match.jpg', name));




% einstein2_nromcorr
name = 'einstein2';
threshold = 0.5;
[output, match] = template_matching_normcorr(img, template, threshold);

figure, imshow(output ./ max(output(:)));
title('NormCorr output');
figure, imshow(match); title('NormCorr match');

imwrite(output ./ max(output(:)), sprintf('%s_normcorr_output.jpg', name));
imwrite(match, sprintf('%s_normcorr_match.jpg', name));


