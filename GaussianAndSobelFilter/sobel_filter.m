function output = sobel_filter(img, kernel)
    output = zeros(size(img));
    shift = 1;
    for i = 1+shift:size(img, 2) - shift
        for j = 1+shift: size(img, 1) - shift
            patch = img(j-shift:j+shift, i-shift:i+shift);
            patch = patch .* kernel;
            patch = patch(:);
            sobel = sum(patch);
            output(j,i) = sobel;
        end
    end
end
