function feature = multiscale_sobel_feature(img, scale)
    
    % Initialize feature vector
    feature = [];

    for i = 1:scale

        % Compute sobel feature
        [magnitude, orientation] = sobel_feature(img);

        % Concatenate feature vector (choose depending which is tested)
        %feature = cat(1, feature, magnitude(:));
        feature = cat(1, feature, orientation(:));

        % Down-Sample image by 2
        img = imresize(img, 1/2);
    end
end