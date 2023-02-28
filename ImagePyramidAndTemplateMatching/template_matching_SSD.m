function [output, match] = template_matching_SSD(img, template, threshold)

    % Make our ouput equal to the size of our image
    output = zeros(size(img));

    % Define our shift values
    shift_u = floor(size(template,2)/2);
    shift_v = floor(size(template, 1)/2);


    for u = 1 + shift_u : size(img, 2) - shift_u
        for v = 1 + shift_v : size(img, 1) - shift_v
            x1 = u - shift_u;
            x2 = u + shift_u;
            y1 = v - shift_v;
            y2 = v + shift_v;
            patch = img(y1:y2, x1:x2);

            % SSD
            value = sum((patch - template).^2);
            value = sum(value);
            output(v,u) = value;

        end
    end
    
    match = (output < threshold);

end