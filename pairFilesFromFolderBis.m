function [pairs, commonX, diffY, commonZ, NbPaires] = pairFilesFromFolderBis(directory, Y_range, varargin)
    % pairFilesFromFolder : Identifie des paires de fichiers selon des contraintes.
    %
    % Syntaxe :
    %   [pairs, commonX, diffY, commonZ, NbPaires] = pairFilesFromFolder(directory, Y_range, Z_range)
    %   [pairs, commonX, diffY, NbPaires] = pairFilesFromFolder(directory, Y_range)
    %
    % Entrées :
    %   - directory : Dossier contenant les fichiers à analyser.
    %   - Y_range   : Plage de valeurs pour le paramètre Y (ex. [1500, 2000]).
    %   - varargin  : (optionnel) Plage de valeurs pour le paramètre Z (ex. [90, 480]).
    %
    % Sorties :
    %   - pairs     : Cellule contenant les paires de fichiers identifiées.
    %   - commonX   : Cellule avec les valeurs communes de X pour chaque paire.
    %   - diffY     : Cellule contenant les valeurs différentes de Y pour chaque paire.
    %   - commonZ   : Cellule avec les valeurs communes de Z pour chaque paire (vide si Z_range non fourni).
    %   - NbPaires  : Nombre total de paires trouvées.

    % Déterminer si Z_range est fourni
    if isempty(varargin)
        Z_range = []; % Si Z_range non fourni
        commonZ = {}; % Initialiser commonZ comme vide
    else
        Z_range = varargin{1};
        commonZ = {}; % Initialiser commonZ pour le cas où Z_range est utilisé
    end

    % Liste des fichiers .S2P dans le dossier
    files = dir(fullfile(directory, '*.S2P'));
    filesNames = {files.name};

    % Initialisation des variables de sortie
    pairs = {};
    commonX = {};
    diffY = {};
    NbPaires = 0;

    % Parcours des fichiers pour identifier les paires
    for i = 1:length(filesNames)
        fileName = filesNames{i};

        % Extraction des paramètres X, Y et Z
        [X, Y, Z] = extractFileParamsBis(fileName);

        % Vérification si Y est dans la plage spécifiée
        if isempty(Y) || ~ismember(Y, Y_range)
            continue; % Fichier hors plage
        end

        % Vérification si Z est dans la plage spécifiée, si Z_range est fourni
        if ~isempty(Z_range) && (isempty(Z) || ~ismember(Z, Z_range))
            continue; % Fichier hors plage pour Z
        end

        % Recherche de fichiers compatibles pour former une paire
        for j = i+1:length(filesNames)
            compareFileName = filesNames{j};
            [compareX, compareY, compareZ] = extractFileParamsBis(compareFileName);

            % Vérification des critères pour former une paire
            if strcmp(X, compareX) && ...
               (isempty(Z_range) || (Z == compareZ)) && ...
               (Y ~= compareY)
                % Ajouter la paire
                pairs{end+1} = {fileName, compareFileName};
                commonX{end+1} = X;
                diffY{end+1} = [Y, compareY];
                if ~isempty(Z_range)
                    commonZ{end+1} = Z;
                end
                NbPaires = NbPaires + 1;
                break; % Arrêt de la recherche pour ce fichier
            end
        end
    end

    % Si Z_range n'est pas fourni, supprimer commonZ de la sortie
    if isempty(Z_range)
        commonZ = [];
    end
end
