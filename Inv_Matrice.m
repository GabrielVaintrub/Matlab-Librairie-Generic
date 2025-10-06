
 function  [Mat_Inv,A_,B_,C_,D_] = Inv_Matrice(Mat)
% cette fonction inverse une matrice (ABCD par exemple) dont les éléments sont placés en ligne dans une
% matrice de données qui contient aussi d'autres matrices 


% La marice Mat doit être de la forme : :
%      |   A1   B1  C1  D1   | => matrice ABCD 1 pour une fréquence F1  donnée
%      |   A2   B2  C2  D2   | => matrice ABCD  2 pour une fréquence F2  donnée
%      ---------------------------
%      ---------------------------
%      ---------------------------
 %     |   AN   BN  CN  DN  | => matrice ABCD N  pour une fréquence FN  donnée
 
 
% La marice Mat_Inv (qui contient les matrices inverses)  doit être de la forme : 
%      |   A1'   B1'  C1'  D1'   | => Eléments de la matrice ABCD inverse de la matrice 1 pour une fréquence F1  donnée
%      |   A2'   B2'  C2'  D2'   | => Eléments de la matrice ABCD inverse de la matrice 2 pour une fréquence F2  donnée
%      ---------------------------
%      ---------------------------
%      ---------------------------
 %     |   AN'   BN'  CN'  DN'  | => Elément de la matrice ABCD inverse de la matrice N pour une fréquence FN  donnée
 

% Calcul du nombre de ligne de la matrice Mat
       [N_line,N_col] = size(Mat); % N = length((Mat1));;
 
 % inversion des matrices contenues dans la matrice  Mat et mise des Resultats  la matrice Mat_Inv 
        for n = 1 : N_line
          MatABCD = [Mat(n,1) Mat(n,2); Mat(n,3) Mat(n,4)];% construction d'une matrice 2*2
          INV_MatABCD = inv(MatABCD);% Inversion de la matrice 2*2 donnant une nouvelle matrice 2*2
          %Remise en ligne pour chaque point de frequence en creant la matrice des inverses
          Mat_Inv(n,:)=[INV_MatABCD(1,1) INV_MatABCD(1,2) INV_MatABCD(2,1) INV_MatABCD(2,2)];
        end
       
   % Vecteurs constitués des élements A, B, C et D des matrices inverses pour chaque points de fréquence     
    A_= Mat_Inv(:,1);
    B_= Mat_Inv(:,2);
    C_= Mat_Inv(:,3);
    D_= Mat_Inv(:,4) ;   
        
% Exemple de la forme du vecteur A_ qui les élements A pour chaque points de fréquence
%      |   A1'   | => Elément  A de la matrice inverse de la matrice 1 pour une fréquence F1  donnée
%      |   A2'   | => Elément  A de la matrice inverse de la matrice 2 pour une fréquence F2  donnée
%      ----------
%      ----------
%      ----------
%     |   AN'    | => Elément A  de la matrice inverse de la matrice N  pour une fréquence FN  donnée
        