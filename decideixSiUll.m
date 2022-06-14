function [b] = decideixSiUll (I,nomVariables,classificador)
    %res = imresize(I,[32 48]);
    %imshow(I);
    DI = mydescriptor(I);
    Taula = array2table(DI); 
        Taula.Properties.VariableNames = nomVariables; 
        pred = classificador.predictFcn(Taula);
        if pred == "No-Ulls"
            b = 0;
        else
            b = 1;
        end
end