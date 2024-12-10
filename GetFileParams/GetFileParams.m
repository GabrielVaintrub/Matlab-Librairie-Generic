function [FileParams] = GetFileParams(FileName, SetUpFile, Delimiter)
    arguments
        FileName = '';
        SetUpFile = [FileParam];
        Delimiter = '_';
    end

    NbParamsSetUp = width(SetUpFile);
    NbFiles = width(FileName);
    
    % FileParams = repmat(FileParam, NbFiles, NbParamsSetUp); % Tableau d'objets de résultat
    
    for i = 1 : NbFiles
        Splited = split(FileName(i), Delimiter);
        NbParamsFile = length(Splited);
        NbParams = max(NbParamsSetUp, NbParamsFile);
        for j = 1 : NbParamsSetUp
            if j <= NbParamsFile
                FileParams(i, j).Name = SetUpFile(j).Name;
                FileParams(i, j).Prefix = SetUpFile(j).Prefix;
                FileParams(i, j).Sufix = SetUpFile(j).Sufix;
                Splited{j} = erase(Splited{j}, SetUpFile(j).Prefix);
                FileParams(i, j).Value = erase(Splited{j}, SetUpFile(j).Sufix);
            end
        end
        for j = NbParamsSetUp : NbParams
            if j <= NbParamsFile
                FileParams(i, j).Name = strcat('Param' , string(j));
                FileParams(i, j).Value = Splited{j};
            end
        end
    end
end
