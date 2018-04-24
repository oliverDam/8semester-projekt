function dataEvaluation(EMGfeature)

L = length(EMGfeature)/4;

Ex = ones(L,1)*0;
Fl = ones(L,1)*1;
Ra = ones(L,1)*2;
Ul = ones(L,1)*3;

overallMovement = [Ex;Fl;Ra;Ul];

[pcs, scrs, ~, ~, pexp] = pca(EMGfeature);

figure(1)
%Intensity of principal components
subplot(1,3,1)
pareto(pexp);
xlabel('a)')
title('PCA of the LogVar feature of the four movements')
subplot(1,3,[2 3])
%Scatterplot of the four movements
scatter3(scrs(1:L, 1 ), scrs(1:L, 2 ), scrs(1:L, 3 ), 10, ...
    overallMovement(1:L,1),'filled')
hold on
scatter3(scrs(L+1:L*2, 1 ), scrs(L+1:L*2, 2 ), scrs(L+1:L*2, 3 ), ...
    10, overallMovement(L+1:L*2,1),'filled')
scatter3(scrs(L*2+1:L*3, 1 ), scrs(L*2+1:L*3, 2 ), scrs(L*2+1:L*3, 3 ), ...
    10, overallMovement(L*2+1:L*3,1),'filled')
scatter3(scrs(L*3+1:L*4, 1 ), scrs(L*3+1:L*4, 2 ), scrs(L*3+1:L*4, 3 ), ...
    10, overallMovement(L*3+1:L*4,1),'filled')
legend('Extension','Flexion','Radial deviation','Ulnar deviation')
xlabel('a)')
title('Scatter plot of the PCA')