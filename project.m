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
end
for k = 1:numFilesCares
%     subplot(4,5,k);
    %figure;
    %imshow(ImatgesCares{k});
end

%% carregar imatges no ulls
ImatgesNoUllsDir = dir('./No_ulls/*.jpg');
numFilesNoUlls = length(ImatgesNoUllsDir);
ImatgesNoUlls = cell(1,numFilesNoUlls);
% mydata = zeros(numFiles);
for k = 1:numFilesNoUlls
    ImatgesNoUlls{k} = imread(strcat('./No_ulls/', ImatgesNoUllsDir(k).name));
end
for k = 1:numFilesNoUlls
%     subplot(4,5,k);
    %figure;
    %imshow(ImatgesNoUlls{k});
end

%% Retallar imatges cares, perque nomes hi hagi ull esquerre
YUllEsquerre = 481; 
XUllEsquerre = 385; 

for k = 1:length(ImatgesCares)
    ImatgesCares{k} = ImatgesCares{k}(YUllEsquerre - 40 : YUllEsquerre + 39, ...
        XUllEsquerre - 60 : XUllEsquerre + 59, :);
end
