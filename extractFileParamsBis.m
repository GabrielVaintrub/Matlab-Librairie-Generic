function [X, Y, Z] = extractFileParamsBis(fileName)
    % extractFileParams : Extrait les paramètres X, Y et Z d'un nom de fichier.
    %
    % Syntaxe :
    %   [X, Y, Z] = extractFileParams(fileName)
    %
    % Entrée :
    %   - fileName : Nom du fichier (chaîne de caractères).
    %                Exemple : '4_Sij_Deembed_1500_L1500um_350_P350um.S2P'.
    %
    % Sorties :
    %   - X : Indique si le fichier est 'Deembed' ou 'NoDeembed'.
    %   - Y : Longueur de la ligne extraite à partir du fichier (en microns).
    %   - Z : Largeur de l'interstice extraite à partir du fichier (en microns).

    % Extraction de X (Deembed ou NoDeembed)
    exprX = 'Deembed|NoDeembed'; % Expression régulière pour X
    X = regexp(fileName, exprX, 'match', 'once');

    % Extraction de Y (valeur entre "_L" et "um_")
    exprY = '(?<=_L)\d+(?=um)'; % Expression régulière pour Y
    Y = str2double(regexp(fileName, exprY, 'match', 'once'));

    % Extraction de Z (valeur entre "_P" et "um")
    exprZ = '(?<=_P)\d+(?=um)'; % Expression régulière pour Z
    Z = str2double(regexp(fileName, exprZ, 'match', 'once'));
end
