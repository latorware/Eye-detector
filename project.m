close all
clear
clc

%% carregar imatges cares
ImatgesCaresDir = dir('./Cares/*.jpg');
numFilesCares = length(ImatgesCaresDir);
ImatgesCares = cell(1,numFilesCares);
% mydata = zeros(numFiles);
for k = 1:numFilesCares
    ImatgesCares{k} = imread(strcat('./Cares/', ImatgesCaresDir(k).name));
    ImatgesCares{k} = rgb2gray(ImatgesCares{k}); 
end
for k = 1:numFilesCares
%     subplot(4,5,k);
    %figure;
    %imshow(ImatgesCares{k});
end

%% carregar imatges no ulls
%% i fer el crop en 48x32 píxels
ImatgesNoUllsDir = dir('./No_ulls/*.jpg');
numFilesNoUlls = length(ImatgesNoUllsDir);
ImatgesNoUlls = cell(1,numFilesNoUlls);
% mydata = zeros(numFiles);
for k = 1:numFilesNoUlls
    ImatgesNoUlls{k} = imread(strcat('./No_ulls/', ImatgesNoUllsDir(k).name));
    ImatgesNoUlls{k} = rgb2gray(ImatgesNoUlls{k}); 
    ImatgesNoUlls{k} = imresize(ImatgesNoUlls{k}, [NaN, 48]); 
end
for k = 1:numFilesNoUlls
%     subplot(4,5,k);
    %figure;
    %imshow(ImatgesNoUlls{k});
end

%% Retallar imatges cares, perque nomes hi hagi ull esquerre
%% I fer el crop en 48x32 píxels
YUllEsquerre = 481; 
XUllEsquerre = 385; 

for k = 1:length(ImatgesCares)
    ImatgesCares{k} = ImatgesCares{k}(YUllEsquerre - 40 : YUllEsquerre + 39, ...
        XUllEsquerre - 60 : XUllEsquerre + 59, :);
    ImatgesCares{k} = imresize(ImatgesCares{k}, [NaN 48]); 
end



%variable namees cas descriptors imatge original sense subdivisions
%varNames = {'Mitjana Total', 'Variancia Total', 'Skew Total', 'Kurtosis Total', 'Etiqueta'}; 

% variable names cas descriptors immatge original 9 subdivisions

varNames = {'Mitjana subimatge 1', 'Variancia subimatge 1', 'Skew subimatge 1', 'Kurtosis subimatge 1',...
    'Mitjana subimatge 2', 'Variancia subimatge 2', 'Skew subimatge 2', 'Kurtosis subimatge 2',...
    'Mitjana subimatge 3', 'Variancia subimatge 3', 'Skew subimatge 3', 'Kurtosis subimatge 3',...
    'Mitjana subimatge 4', 'Variancia subimatge 4', 'Skew subimatge 4', 'Kurtosis subimatge 4',...
    'Mitjana subimatge 5', 'Variancia subimatge 5', 'Skew subimatge 5', 'Kurtosis subimatge 5',...
    'Mitjana subimatge 6', 'Variancia subimatge 6', 'Skew subimatge 6', 'Kurtosis subimatge 6',...
    'Mitjana subimatge 7', 'Variancia subimatge 7', 'Skew subimatge 7', 'Kurtosis subimatge 7',...
    'Mitjana subimatge 8', 'Variancia subimatge 8', 'Skew subimatge 8', 'Kurtosis subimatge 8',...
    'Mitjana subimatge 9', 'Variancia subimatge 9', 'Skew subimatge 9', 'Kurtosis subimatge 9', 'Etiqueta'}; 


% variable names cas imatge laplacia-gauss sense subdivisions
%varNames = {'Mitjana Total laplacia', 'Variancia Total laplacia', 'Skew Total laplacia', 'Kurtosis Total laplacia', 'Etiqueta'};

% variable names cas imatge laplacia-gauss 9 subdivisions
%{
varNames = {'Mitjana laplacia subimatge 1', 'Variancia laplacia subimatge 1', 'Skew laplacia subimatge 1', 'Kurtosis laplacia subimatge 1',...
    'Mitjana laplacia subimatge 2', 'Variancia laplacia subimatge 2', 'Skew laplacia subimatge 2', 'Kurtosis laplacia subimatge 2',...
    'Mitjana laplacia subimatge 3', 'Variancia laplacia subimatge 3', 'Skew laplacia subimatge 3', 'Kurtosis laplacia subimatge 3',...
    'Mitjana laplacia subimatge 4', 'Variancia laplacia subimatge 4', 'Skew laplacia subimatge 4', 'Kurtosis laplacia subimatge 4',...
    'Mitjana laplacia subimatge 5', 'Variancia laplacia subimatge 5', 'Skew laplacia subimatge 5', 'Kurtosis laplacia subimatge 5',...
    'Mitjana laplacia subimatge 6', 'Variancia laplacia subimatge 6', 'Skew laplacia subimatge 6', 'Kurtosis laplacia subimatge 6',...
    'Mitjana laplacia subimatge 7', 'Variancia laplacia subimatge 7', 'Skew laplacia subimatge 7', 'Kurtosis laplacia subimatge 7',...
    'Mitjana laplacia subimatge 8', 'Variancia laplacia subimatge 8', 'Skew laplacia subimatge 8', 'Kurtosis laplacia subimatge 8',...
    'Mitjana laplacia subimatge 9', 'Variancia laplacia subimatge 9', 'Skew laplacia subimatge 9', 'Kurtosis laplacia subimatge 9', 'Etiqueta'}; 
%}

%% Calcular taula descriptors
T = array2table(mydescriptor(ImatgesNoUlls{1})); 
T.Etiqueta = categorical({'No-Ulls'});
T.Properties.VariableNames = varNames; 

for k = 2:length(ImatgesNoUlls)
    temp = array2table(mydescriptor(ImatgesNoUlls{k})); 
    temp.Etiqueta = categorical({'No-Ulls'});
    temp.Properties.VariableNames = varNames; 
    T = [T;temp]; 
end
    

for k = 1:length(ImatgesCares)
    temp = array2table(mydescriptor(ImatgesCares{k})); 
    temp.Etiqueta = categorical({'Ulls'});
    temp.Properties.VariableNames = varNames; 
    T = [T;temp]; 
end


%% Training
[trainedClassifier, validationAccuracy] = trainClassifier(T); 
validationAccuracy


%% Computar video

% Create a cascade detector object.
Detector = vision.CascadeObjectDetector('FrontalFaceLBP');
 
% Read a video frame and run the face detector.
videoReader = VideoReader('video.webm');
 
while hasFrame(videoReader) 
    % get the next frame
    videoFrame = readFrame(videoReader);
    bbox = step(Detector, videoFrame);
 
    for k = 1:size(bbox)
        subimage = imcrop(videoFrame, bbox(k,:));
        imshow(subimage); 
    end
 
   


    % Draw the returned bounding box around the detected face.
    videoFrame = insertShape(videoFrame, 'Rectangle', bbox);
    %imshow(videoFrame);
end


