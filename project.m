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




