% Fonction pour extraire X, Y, Z à partir du nom de fichier
function [X, Y, Z] = extractFileParams(fileName)
    % Exemple de nom de fichier : '4_Sij_Deembed_1500_L1500um_350_P350um.S2P'
    
    % Extraction de X (Deembed ou NoDeembed)
    exprX = 'Deembed|NoDeembed'; % Pour X qui peut être 'Deembed' ou 'NoDeembed'
    X = regexp(fileName, exprX, 'match', 'once');
    
    % Extraction de Y (avant "_L" et après "_um_")
    exprY = '(?<=_L)\d+(?=um_)'; % Extraction des nombres entre "_L" et "um_"
    Y = str2double(regexp(fileName, exprY, 'match', 'once'));
    
    % Extraction de Z (avant "_P" et après "_um")
    exprZ = '(?<=_P)\d+(?=um)'; % Extraction des nombres entre "_P" et "um"
    Z = str2double(regexp(fileName, exprZ, 'match', 'once'));
end