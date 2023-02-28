function [output, match] = template_matching_normcorr(img, template, threshold)

    % Make our ouput equal to the size of our image
    output = zeros(size(img));

    % Define our shift values
    shift_u = floor(size(template,2)/2);
    shift_v = floor(size(template, 1)/2);

    for u = 1 + shift_u : size(img, 2) - shift_u
        for v = 1 + shift_v : size(img, 1) - shift_v
            
            % Define x1, x2, y1, y2 values + patch
            x1 = u - shift_u;
            x2 = u + shift_u;
            y1 = v - shift_v;
            y2 = v + shift_v;
            patch = img(y1:y2, x1:x2);

            % Convert patch and template to vectors
            patch = patch(:);
            template = template(:);

            % Subtract mean
            patch = patch - mean(patch);
            template = template - mean(template);

            % Normalize length to 1
            patch = patch/norm(patch);
            template = template/norm(template);

            % Normcorr
            value = dot(patch, template);
            output(v,u) = value;

        end
    end
    
    % Define our match
    match = (output > threshold);

end