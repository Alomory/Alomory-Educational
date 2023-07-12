function [BW,maskedRGBImage] = createMask(RGB)
% Convert RGB image to chosen color space
I = rgb2hsv(RGB);

% Define thresholds for channel 1 based on histogram settings
channel1Min = 0.177;
channel1Max = 0.545;

% Define thresholds for channel 2 based on histogram settings
channel2Min = 0.000;
channel2Max = 1.000;

% Define thresholds for channel 3 based on histogram settings
channel3Min = 0.000;
channel3Max = 1.000;

% Create mask based on chosen histogram thresholds
sliderBW = (I(:,:,1) >= channel1Min ) & (I(:,:,1) <= channel1Max) & ...
    (I(:,:,2) >= channel2Min ) & (I(:,:,2) <= channel2Max) & ...
    (I(:,:,3) >= channel3Min ) & (I(:,:,3) <= channel3Max);

% Create mask based on selected regions of interest on point cloud projection
I = double(I);
[m,n,~] = size(I);
polyBW = false([m,n]);
I = reshape(I,[m*n 3]);

% Convert HSV color space to canonical coordinates
Xcoord = I(:,2).*I(:,3).*cos(2*pi*I(:,1));
Ycoord = I(:,2).*I(:,3).*sin(2*pi*I(:,1));
I(:,1) = Xcoord;
I(:,2) = Ycoord;
clear Xcoord Ycoord

% Project 3D data into 2D projected view from current camera view point within app
J = rotateColorSpace(I);

% Apply polygons drawn on point cloud in app
polyBW = applyPolygons(J,polyBW);

% Combine both masks
BW = sliderBW & polyBW;

% Initialize output masked image based on input image.
maskedRGBImage = RGB;

% Set background pixels where BW is false to zero.
maskedRGBImage(repmat(~BW,[1 1 3])) = 0;

end

function J = rotateColorSpace(I)

% Translate the data to the mean of the current image within app
shiftVec = [-0.136443 0.210149 0.484446];
I = I - shiftVec;
I = [I ones(size(I,1),1)]';

% Apply transformation matrix
tMat = [0.979680 0.567803 0.000000 -0.697328;
    -0.697767 0.797208 0.000000 -0.117194;
    0.000000 0.000000 -0.969638 9.160254;
    0.000000 0.000000 0.000000 1.000000];

J = (tMat*I)';
end

function polyBW = applyPolygons(J,polyBW)

% Define each manually generated ROI
hPoints(1).data = [-1.312016 -0.120245;
    -1.094739 -0.108038;
    -0.918318 -0.236212;
    -0.873749 -0.001227;
    -0.788324 0.041498;
    -0.760468 0.111689;
    -0.424339 0.261225;
    -0.060355 0.068964;
    -0.123495 -0.230109;
    -0.948031 -0.428473;
    -1.280446 -0.306403];

% Iteratively apply each ROI
for ii = 1:length(hPoints)
    if size(hPoints(ii).data,1) > 2
        in = inpolygon(J(:,1),J(:,2),hPoints(ii).data(:,1),hPoints(ii).data(:,2));
        in = reshape(in,size(polyBW));
        polyBW = polyBW | in;
    end
end

end
