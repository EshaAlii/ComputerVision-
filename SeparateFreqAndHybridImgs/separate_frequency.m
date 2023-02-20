function [low_pass_img, high_pass_img] = separate_frequency(img, ratio)
    
    % Apply FFT
    frequency_map = fft2(img);

    % Shift the frequency map
    frequency_map_shifted = fftshift(frequency_map);

    % Compute low-frequency mask
    mask = zeros(size(img));
    width = size(img, 2);
    height = size(img, 1);
    y1 = (width/2) - (width * ratio/2);
    y2 = (width/2) + (width * ratio/2);
    x1 = (height/2) - (height * ratio/2);
    x2 = (height/2) + (height * ratio/2);
    mask(y1:y2, x1:x2, :) = 1;

    % Separate low-frequency and high-frequency maps
    low_frequency_map_shifted = frequency_map_shifted .* mask;
    high_frequency_map_shifted = frequency_map_shifted .* (1 - mask);

    % Shift frequency maps back
    low_frequency_map = ifftshift(low_frequency_map_shifted);
    high_frequency_map = ifftshift(high_frequency_map_shifted);
        
    % Apply Inverse FFT
    low_pass_img = real(ifft2(low_frequency_map));
    high_pass_img = real(ifft2(high_frequency_map));
end