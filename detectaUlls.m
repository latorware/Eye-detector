function [imatgeOut] = detectaUlls(imatgeIn, classificador,nomsVar)

imatgeInRes = imresize(imatgeIn,[NaN, 250]);
N= 48;
M = round(N*2/3);

%%configurem la mida dels blocs perquè la mida sigui M x N (48x32)

step = 15;

h = round((M-step)/2); %round(r(4)/2 - step/2);
w = round((N-step)/2); %round(r(3)/2 - step/2);

varNames2 = nomsVar(1:length(nomsVar)-1);

blk = [h,w];
R = blkproc(imatgeInRes, [step step], blk, @decideixSiUll, varNames2, classificador);
R = imresize(R,size(imatgeIn));
R = R > 0.1;
cc = bwconncomp(R);
imatgeOut = regionprops(cc,'BoundingBox');

% B = imoverlay(imatgeIn,R,'y');
% figure
% imshow(B);


end