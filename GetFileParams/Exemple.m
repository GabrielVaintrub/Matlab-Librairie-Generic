clear
clc

defaultPath = 'C:\Users\vaintrug\Documents\_CROMA\Donnes_Simu\Comparaison_Calculs_HFSS\4_VarPort';

[filesName, filesLocation] = uigetfile('*.S2P', ...
    'Select S2P data files', defaultPath, ...
    'MultiSelect', 'on');

NumParam = 1;
SetUpFile(NumParam) = FileParam;
SetUpFile(NumParam).Name = 'Lot';

NumParam = NumParam + 1;
SetUpFile(NumParam) = FileParam;
SetUpFile(NumParam).Name = 'Parametre';

NumParam = NumParam + 1;
SetUpFile(NumParam) = FileParam;
SetUpFile(NumParam).Name = 'Deembeding';
SetUpFile(NumParam).Sufix = 'Deembed';


NumParam = NumParam + 1;
SetUpFile(NumParam) = FileParam;
SetUpFile(NumParam).Name = 'Line length';
SetUpFile(NumParam).Sufix = 'um';


FilesParams = GetFileParams(filesName, SetUpFile);
