function [pairs, commonX, diffY, commonZ, NbPaires] = pairFilesFromFolder(directory, Y_range, Z_range)
    % directory : Dossier contenant les fichiers à analyser
    % Y_range : Plage de valeurs de Y (ex: [1500, 2000])
    % Z_range : Plage de valeurs de Z (ex: [90, 480])

    % Récupérer tous les fichiers dans le dossier
    files = dir(fullfile(directory, '*.S2P')); % Récupérer les fichiers .S2P
    filesNames = {files.name}; % Liste des noms de fichiers

    % Initialisation des structures pour les paires
    pairs = {};
    commonX = {};
    diffY = {};
    commonZ = {};
    NbPaires = 0;

    % Pour chaque fichier, extraire X, Y, Z et organiser les fichiers
    for i = 1:length(filesNames)
        fileName = filesNames{i};
        
        % Extraire les informations X, Y, Z à partir du nom de fichier
        [X, Y, Z] = extractFileParams(fileName);
        
        % Vérifier que Y et Z sont dans les plages spécifiées
        if isempty(Y) || isempty(Z) || ~ismember(Y, Y_range) || ~ismember(Z, Z_range)
            continue; % Si le fichier ne correspond pas à la plage, on le saute
        end
        
        % Chercher un fichier correspondant (même X et Z, mais Y différent)
        for j = i+1:length(filesNames)
            compareFileName = filesNames{j};
            [compareX, compareY, compareZ] = extractFileParams(compareFileName);
            
            % Si le fichier a les mêmes X et Z, mais Y différent, ils sont une paire
            if strcmp(X, compareX) && Z == compareZ && Y ~= compareY
                pairs{end+1} = {fileName, compareFileName}; % Ajouter la paire à la liste
                commonX{end+1} = X;
                diffY{end+1} = [Y, compareY];
                commonZ{end+1} = Z;
                NbPaires = NbPaires + 1;
                break; % On arrête la recherche de pair pour ce fichier
            end
        end
    end
    
    % Affichage des résultats
    % if ~isempty(pairs)
    %     disp('Paires de fichiers trouvées :');
    %     for k = 1:length(pairs)
    %         disp(['Paire ', num2str(k), ': ', pairs{k}{1}, ' et ', pairs{k}{2}]);
    %     end
    % else
    %     disp('Aucune paire de fichiers trouvée.');
    % end
end