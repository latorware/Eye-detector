%% input imatge escala grisos 48x32
function [D] = mydescriptor(I)
%A = fspecial('sobel');
%figure
%imshow(imfilter(I, A)); 
%B = fspecial('log', [5 5], 0.35); 
%figure
%imshow(imfilter(I, B)); 
%% possibles features
    % laplatian of gaussian per a 6 subdivisions
        % de cada una,
        % mitjana nivells gris
        % tambe variancia
        % tambe skewImatgeness
        % tambe kurtosisImatge
    
   % fer aixo tambe per a la imatge original?


% prova mitjana nivells gris, variancia, skew i kurtsosis
% sense subdivisions imatge origianl
    %{
    D = []; 
    % histograma
    [valorsHist, nivellsGris] = imhist(I);
    nombrePixels = sum(valorsHist);
    % Mitjana nivells de gris
    mitjanaImatge = sum(nivellsGris .* valorsHist) / nombrePixels;
    D(end+1) = mitjanaImatge; 
    % Variancia imatge
    varianciaImatge = sum((nivellsGris - mitjanaImatge) .^ 2 .* valorsHist) / (nombrePixels-1);
    D(end+1) = varianciaImatge; 
    % Desviacio estandard imatge
    desEstandardImatge = sqrt(varianciaImatge);
    % skewImatge image. 
    skewImatge = sum((nivellsGris - mitjanaImatge) .^ 3 .* valorsHist) / ((nombrePixels - 1) * desEstandardImatge^3);
    D(end+1) = skewImatge; 
    % kurtosisImatge image. 
    kurtosisImatge = sum((nivellsGris - mitjanaImatge) .^ 4 .* valorsHist) / ((nombrePixels - 1) * desEstandardImatge^4);
    D(end+1) = kurtosisImatge; 
    %}


%prova prova mitjana nivells gris, variancia, skew i kurtsosis
% amb 6 subdivisions imatge original
   
   D = []; 
   for i = 1:3
       for j = 1:3
           subimage = I(((i-1)*(32/3))+1:(i*(32/3)), ((j-1)*(48/3))+1:(j*(48/3))); 
            % histograma
            [valorsHist, nivellsGris] = imhist(subimage);
            nombrePixels = sum(valorsHist);
            % Mitjana nivells de gris
            mitjanaImatge = sum(nivellsGris .* valorsHist) / nombrePixels;
            D(end+1) = mitjanaImatge; 
            % Variancia imatge
            varianciaImatge = sum((nivellsGris - mitjanaImatge) .^ 2 .* valorsHist) / (nombrePixels-1);
            D(end+1) = varianciaImatge; 
            % Desviacio estandard imatge
            desEstandardImatge = sqrt(varianciaImatge);
            % skewImatge image. 
            skewImatge = sum((nivellsGris - mitjanaImatge) .^ 3 .* valorsHist) / ((nombrePixels - 1) * desEstandardImatge^3);
            D(end+1) = skewImatge; 
            % kurtosisImatge image. 
            kurtosisImatge = sum((nivellsGris - mitjanaImatge) .^ 4 .* valorsHist) / ((nombrePixels - 1) * desEstandardImatge^4);
            D(end+1) = kurtosisImatge; 
       end
   end
   


%prova prova mitjana nivells gris, variancia, skew i kurtsosis
% imatge laplatian of gaussian sense subdivisions
    %{
    filtreLaplatianOfGaussian = fspecial('log', [5 5], 0.50); 
    ImageLaplatian = imfilter(I, filtreLaplatianOfGaussian); 
    %figure
    %imshow(ImageLaplatian); 

    D = []; 
    % histograma
    [valorsHist, nivellsGris] = imhist(ImageLaplatian);
    nombrePixels = sum(valorsHist);
    % Mitjana nivells de gris
    mitjanaImatge = sum(nivellsGris .* valorsHist) / nombrePixels;
    D(end+1) = mitjanaImatge; 
    % Variancia imatge
    varianciaImatge = sum((nivellsGris - mitjanaImatge) .^ 2 .* valorsHist) / (nombrePixels-1);
    D(end+1) = varianciaImatge; 
    % Desviacio estandard imatge
    desEstandardImatge = sqrt(varianciaImatge);
    % skewImatge image. 
    skewImatge = sum((nivellsGris - mitjanaImatge) .^ 3 .* valorsHist) / ((nombrePixels - 1) * desEstandardImatge^3);
    D(end+1) = skewImatge; 
    % kurtosisImatge image. 
    kurtosisImatge = sum((nivellsGris - mitjanaImatge) .^ 4 .* valorsHist) / ((nombrePixels - 1) * desEstandardImatge^4);
    D(end+1) = kurtosisImatge; 
    %}

%prova prova mitjana nivells gris, variancia, skew i kurtsosis
% imatge laplatian of gaussian 6 subdivisions
    %{
    filtreLaplatianOfGaussian = fspecial('log', [5 5], 0.50); 
    ImageLaplatian = imfilter(I, filtreLaplatianOfGaussian); 
    %figure
    %imshow(ImageLaplatian); 

   D = []; 
   for i = 1:3
       for j = 1:3
           subimage = ImageLaplatian(((i-1)*(32/3))+1:(i*(32/3)), ((j-1)*(48/3))+1:(j*(48/3))); 
            % histograma
            [valorsHist, nivellsGris] = imhist(subimage);
            nombrePixels = sum(valorsHist);
            % Mitjana nivells de gris
            mitjanaImatge = sum(nivellsGris .* valorsHist) / nombrePixels;
            D(end+1) = mitjanaImatge; 
            % Variancia imatge
            varianciaImatge = sum((nivellsGris - mitjanaImatge) .^ 2 .* valorsHist) / (nombrePixels-1);
            D(end+1) = varianciaImatge; 
            % Desviacio estandard imatge
            desEstandardImatge = sqrt(varianciaImatge);
            % skewImatge image. 
            skewImatge = sum((nivellsGris - mitjanaImatge) .^ 3 .* valorsHist) / ((nombrePixels - 1) * desEstandardImatge^3);
            D(end+1) = skewImatge; 
            % kurtosisImatge image. 
            kurtosisImatge = sum((nivellsGris - mitjanaImatge) .^ 4 .* valorsHist) / ((nombrePixels - 1) * desEstandardImatge^4);
            D(end+1) = kurtosisImatge; 
       end
   end
    %}

end

