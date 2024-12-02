function [pairs, commonX, diffY, commonZ, NbPaires] = pairFilesFromFolder(directory, Y_range, Z_range)
    % pairFilesFromFolder : Identifie des paires de fichiers correspondant à certaines contraintes.
    %
    % Syntaxe :
    %   [pairs, commonX, diffY, commonZ, NbPaires] = pairFilesFromFolder(directory, Y_range, Z_range)
    %
    % Entrées :
    %   - directory : Dossier contenant les fichiers à analyser.
    %   - Y_range   : Plage de valeurs pour le paramètre Y (ex. [1500, 2000]).
    %   - Z_range   : Plage de valeurs pour le paramètre Z (ex. [90, 480]).
    %
    % Sorties :
    %   - pairs     : Cellule contenant les paires de fichiers identifiées.
    %   - commonX   : Cellule avec les valeurs communes de X pour chaque paire.
    %   - diffY     : Cellule contenant les valeurs différentes de Y pour chaque paire.
    %   - commonZ   : Cellule avec les valeurs communes de Z pour chaque paire.
    %   - NbPaires  : Nombre total de paires trouvées.

    % Liste des fichiers .S2P dans le dossier
    files = dir(fullfile(directory, '*.S2P'));
    filesNames = {files.name}; % Récupération des noms de fichiers

    % Initialisation des variables de sortie
    pairs = {};
    commonX = {};
    diffY = {};
    commonZ = {};
    NbPaires = 0;

    % Parcours des fichiers pour identifier les paires
    for i = 1:length(filesNames)
        fileName = filesNames{i};

        % Extraction des paramètres X, Y et Z
        [X, Y, Z] = extractFileParams(fileName);

        % Vérification si Y et Z sont dans les plages spécifiées
        if isempty(Y) || isempty(Z) || ~ismember(Y, Y_range) || ~ismember(Z, Z_range)
            continue; % Si le fichier est hors plage, on passe au suivant
        end

        % Recherche de fichiers compatibles pour former une paire
        for j = i+1:length(filesNames)
            compareFileName = filesNames{j};
            [compareX, compareY, compareZ] = extractFileParams(compareFileName);

            % Vérification des critères pour former une paire
            if strcmp(X, compareX) && Z == compareZ && Y ~= compareY
                pairs{end+1} = {fileName, compareFileName}; % Ajout de la paire
                commonX{end+1} = X; % Stockage de X commun
                diffY{end+1} = [Y, compareY]; % Stockage des Y différents
                commonZ{end+1} = Z; % Stockage de Z commun
                NbPaires = NbPaires + 1; % Incrémentation du compteur
                break; % Arrêt de la recherche pour ce fichier
            end
        end
    end
end
