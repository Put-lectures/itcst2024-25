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

%1. Thresholding to create a binary mask
threshold = 100
##binary_mask = TODO: Create a binary mask
##% Set a threshold value
##
##% Display the binary mask
##subplot(2, 2, 3);
##imshow(binary_mask);
##title('Binary Mask (Thresholding)');

%2.  Modify a subset of the image using the binary mask
img_modified = img_gray; % Copy the original image
##TODO: Set thresholded regions to white - assing 255 to every pixel < threshold

##subplot(2, 2, 4);;
##imshow(img_modified);
##title('Modified Image');

%3. Define a gradient mask (Sobel operator)
sobel_mask = [-1 0 1; -2 0 2; -1 0 1]';

%4. Perform convolution with the gradient mask
##img_gradient = TODO: apply convolution here

##% Display the gradient image
##figure;
##imshow(img_gradient, []);
##title('Image After Convolution with Gradient Mask');

