%% crea el detector si no existeix
if exist('Detector','var') == 0
    project
end


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
