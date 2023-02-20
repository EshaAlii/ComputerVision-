function output = gaussian_filter(img, hsize, sigma)
    H = fspecial('gaussian', hsize, sigma);
    output = zeros(size(img));
    shift = sigma;
    for i = 1+shift:size(img, 2) - shift
        for j = 1+shift: size(img, 1) - shift
            patch = img(j-shift:j+shift, i-shift:i+shift);
            patch = patch .* H;
            patch = patch(:);
            gauss = sum(patch);
            output(j,i) = gauss;
        end
    end
end
