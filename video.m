%% crea el detector si no existeix
if exist('trainedClassifier','var') == 0
    project
end


%% Computar video

% Create a cascade detector object.
Detector = vision.CascadeObjectDetector('FrontalFaceLBP');
 
% Read a video frame and run the face detector.
videoReader = VideoReader('video.webm');

videoOut = VideoWriter('video-out.avi'); %create the video object

open(videoOut); %open the file for writing

a=0;
 
while hasFrame(videoReader)
    % get the next frame
    videoFrame = readFrame(videoReader);
    bbox = step(Detector, videoFrame);
 
    for k = 1:size(bbox)
        subimage = imcrop(videoFrame, bbox(k,:));
        ulls = detectaUlls(rgb2gray(subimage),trainedModel4,varNames);
        quadrat=zeros(size(ulls,1),4);
        for u=1:size(ulls,1)
            quadrat(u,1) = round(ulls(u).BoundingBox(1) +bbox(k,1));
            quadrat(u,2) = round(ulls(u).BoundingBox(2) +bbox(k,2));
            quadrat(u,3) = ulls(u).BoundingBox(3);
            quadrat(u,4) = ulls(u).BoundingBox(4);
        end
            %quadrats
            videoFrame = insertShape(videoFrame, 'Rectangle', quadrat);
    end

    writeVideo(videoOut,videoFrame); %write the image to file

%     figure
%     imshow(videoFrame)
    a=a+1;
    a
    
end

close(videoOut); %close the file
