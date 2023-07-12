testImage = imread("2.jpg");
[coralBW,coralRGB] = seperationBetweenSandAndCoral(testImage);
% Convert the image to grayscale
grayImage = rgb2gray(testImage);
% Apply image enhancement techniques if needed
enhancedImage = imadjust(grayImage); % Example: using histogram stretching
% Apply image segmentation techniques to separate coral reefs and sand
% You can experiment with different segmentation algorithms here
thresholdValue = graythresh(enhancedImage); % Calculate the threshold value using Otsu's method
coralReefMask = coralBW; % Apply thresholding using the calculated value
sandMask = imcomplement(coralReefMask);
% Clean up the masks using morphological operations
se = strel('diamond', 5); % Adjust the structuring element size as needed
coralReefMask = imopen(coralReefMask, se);
sandMask = imopen(sandMask, se);
% Calculate the area of coverage for each type of coral reef
coralReefArea = sum(coralReefMask(:));
sandArea = sum(sandMask(:));
% Display the segmented masks with boundaries
figure;
subplot(1, 2, 1);
imshow(testImage);
title('Coral Reefs Mask');
hold on;
boundaries = bwboundaries(coralReefMask);
for k = 1:length(boundaries)
 boundary = boundaries{k};
 plot(boundary(:, 2), boundary(:, 1), 'r', 'LineWidth', 2);
end
hold off;
subplot(1, 2, 2);
imshow(testImage);
title('Sand Mask');
hold on;
boundaries = bwboundaries(sandMask);
for k = 1:length(boundaries)
 boundary = boundaries{k};
 plot(boundary(:, 2), boundary(:, 1), 'b', 'LineWidth', 2);
end
hold off;
% Display the area of coverage for each type of coral reef
fprintf('Area of Branching Coral Reef: %d pixels\n', coralReefArea);
fprintf('Area of Sand: %d pixels\n', sandArea);