# Librairie : Generic

Cette librairie contient des outils génériques pour faciliter l'analyse des fichiers et l'extraction des informations. Elle inclut des fonctions polyvalentes utilisées dans divers contextes des projets.

## Contenu

- `extractFileParams.m` : 
  Extrait les paramètres `X`, `Y` et `Z` à partir d'un nom de fichier, en utilisant des expressions régulières. 
  - **Usage principal** : Analyse des noms de fichiers pour identifier des propriétés spécifiques comme la longueur et la largeur des lignes de transmission.
  - **Entrée** : Nom d'un fichier (string).
  - **Sorties** : Paramètres `X` (texte), `Y` et `Z` (nombres).

- `pairFilesFromFolder.m` : 
  Identifie et regroupe des paires de fichiers basées sur des critères communs/différents dans leurs noms.
  - **Usage principal** : Automatisation de la recherche de paires pour comparer des lignes de transmission avec des propriétés similaires.
  - **Entrées** :
    - Dossier contenant les fichiers.
    - Plages de valeurs pour `Y` et `Z`.
  - **Sorties** : Liste des paires, informations communes (`X`, `Z`) et différentes (`Y`).

## Exemple d'utilisation

### `extractFileParams.m`
Extrait les informations d'un fichier nommé `4_Sij_Deembed_1500_L1500um_350_P350um.S2P` :
```matlab
[X, Y, Z] = extractFileParams('4_Sij_Deembed_1500_L1500um_350_P350um.S2P');
disp(X); % 'Deembed'
disp(Y); % 1500
disp(Z); % 350
```
---

## Auteur
Organisé et documenté par Gabriel Vaintrub. Pour toute question ou amélioration, merci de soumettre une issue ou un pull request sur le dépôt GitHub.
