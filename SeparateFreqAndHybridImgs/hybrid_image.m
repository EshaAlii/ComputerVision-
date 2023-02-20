function img_merged = hybrid_img(img1, img2, ratio)

    % Split img1 and img2 into low/high frequency maps
    [low1, high1] = separate_frequency(img1, ratio);
    [low2, high2] = separate_frequency(img2, ratio);

    % Combine the low-frequency map of img1 with high-frequncy map of img 2
    img_merged = low1 + high2;
end