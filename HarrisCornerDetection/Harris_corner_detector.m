function [corner_x, corner_y] = Harris_corner_detector(I, sigma1, sigma2, alpha, R_threshold)
    
	%% Gaussian kernels
    hsize1 = 1 + 2 * ceil(sigma1 * 2);
    hsize2 = 1 + 2 * ceil(sigma2 * 2);

    gaussian_kernel1 = fspecial('gaussian', hsize1, sigma1);
    gaussian_kernel2 = fspecial('gaussian', hsize2, sigma2);

    
    %% derivative filter
    Dx = [1, 0, -1];
    Dy = [1; 0; -1];

    
    
    %% Use derivative of Gaussian to compute x-gradient (Ix) and y-gradient (Iy)
    Ix = imfilter(imfilter(I, gaussian_kernel1, 'replicate'), Dx, 'replicate');
    Iy = imfilter(imfilter(I, gaussian_kernel1, 'replicate'), Dy, 'replicate');

    %figure, imshow(Ix + 0.5);
    %figure, imshow(Iy + 0.5);

    %baboon.png
    %imwrite(Ix+0.5, 'baboon_Ix.png');
    %imwrite(Iy+0.5, 'baboon_Iy.png');

    %cameraman.png
    %imwrite(Ix+0.5, 'cameraman_Ix.png');
    %imwrite(Iy+0.5, 'cameraman_Iy.png');

    %checkerboard.png
    imwrite(Ix+0.5, 'checkerboard_Ix.png');
    imwrite(Iy+0.5, 'checkerboard_Iy.png');


    %% compute Ixx, Iyy, Ixy
    Ixx = Ix .* Ix;
    Iyy = Iy .* Iy;
    Ixy = Ix .* Iy;
    
    %% compute Sxx, Syy, Sxy
    Sxx = imfilter(Ixx, gaussian_kernel2, 'replicate');
    Syy = imfilter(Iyy, gaussian_kernel2, 'replicate');
    Sxy = imfilter(Ixy, gaussian_kernel2, 'replicate');
    
    %% compute corner response from determine and trace
    R = ((Sxx.*Syy) - (Sxy.*Sxy)) - alpha*((Sxx+Syy).^2);

    figure, imagesc(R); colormap jet; colorbar; axis image;

    %baboon.png
    %saveas(gcf, 'baboon_R.png');

    %cameraman.png
    %saveas(gcf, 'cameraman_R.png');

    %checkerboard.png
    saveas(gcf, 'checkerboard_R.png');
    
    %% find corner map with R > R_threshold
    corner_map = R > R_threshold;
    
    %figure, imshow(corner_map);

    %baboon.png
    %imwrite(corner_map, 'baboon_corner_map.png');

    %cameraman.png
    %imwrite(corner_map, 'cameraman_corner_map.png');

    %checkerboard.png
    imwrite(corner_map, 'checkerboard_corner_map.png');

    %% find local maxima of R
    local_maxima = imregionalmax(R);
    
    %figure, imshow(local_maxima);
    
    %baboon.png
    %imwrite(local_maxima, 'baboon_local_maxima.png');

    %cameraman.png
    %imwrite(local_maxima, 'cameraman_local_maxima.png');

    %checkerboard.png
    imwrite(local_maxima, 'checkerboard_local_maxima.png');
    
    
    %% final corner map and corner x, y coordinates
    final_corner_map = (corner_map & local_maxima);
    
    %figure, imshow(final_corner_map);

    %baboon.png
    %imwrite(final_corner_map, 'baboon_final_corner_map.png');

    %cameraman.png
    %imwrite(final_corner_map, 'cameraman_final_corner_map.png');

    %checkerboard.png
    imwrite(final_corner_map, 'checkerboard_final_corner_map.png');
    
    [corner_y, corner_x] = find(final_corner_map);

end

