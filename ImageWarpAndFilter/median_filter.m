function output = median_filter(img, patch)
    output = zeros(size(img));
    shift = round(patch/3);
    for i = 1+shift:size(img, 2) - shift
        for j = 1+shift: size(img, 1) - shift
            patch = img(j-shift:j+shift, i-shift:i+shift);
            output(j,i) = median(patch(:));
        end
    end
end