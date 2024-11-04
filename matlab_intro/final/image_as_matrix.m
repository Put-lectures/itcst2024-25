% Load an image
img = imread('image.jpeg'); % You can use any image file
figure;
subplot(2, 2, 1)
imshow(img);
title('Original Image');


img_gray = rgb2gray(img); % Convert to grayscale

% Display the original image

subplot(2, 2, 2);
imshow(img_gray);
title('Original Grayscale Image');

% Thresholding to create a binary mask
threshold = 100
binary_mask = img_gray > threshold; % Create a binary mask
% Set a threshold value

% Display the binary mask
subplot(2, 2, 3);
imshow(binary_mask);
title('Binary Mask (Thresholding)');

% Modify a subset of the image using the binary mask
img_modified = img_gray; % Copy the original image
img_modified(binary_mask) = 255; % Set thresholded regions to white

subplot(2, 2, 4);;
imshow(img_modified);
title('Modified Image');

% Define a gradient mask (Sobel operator)
sobel_mask = [-1 0 1; -2 0 2; -1 0 1]';

% Perform convolution with the gradient mask
img_gradient = conv2(double(img_gray), sobel_mask, 'same');

% Display the gradient image
figure;
imshow(img_gradient, []);
title('Image After Convolution with Gradient Mask');

