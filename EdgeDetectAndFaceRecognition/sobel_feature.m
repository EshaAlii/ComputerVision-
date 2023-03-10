function [magnitude, orientation] = sobel_feature(img)
    
    % Horizontal Edge
    Hy = [1, 2, 1; 0, 0, 0; -1, -2, -1];

    % Vertical Edge
    Hx = [1, 0, -1; 2, 0, -2; 1, 0, -1];

    % Sobel filtering
     Hy_S = imfilter(img, Hy);
     Hx_S = imfilter(img, Hx);

    % Compute gradient Magnitude and Orientation
    magnitude = sqrt(Hy_S.^2 + Hx_S.^2);
    orientation = atan2(Hy_S, Hx_S);

end