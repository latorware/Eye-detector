close all
clear
clc


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


ImatgesNoUllsDir = dir('./No_ulls/*.jpg');
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