
% 6.1 Import:
food = csvread('food.csv',1,1);


% 6.2 Processing:
% [Z,MU,SIGMA] = zscore(food);
% 6.4 correlation matrix:
% R = corrcoef(Z); %equal to 'R = corrcoef(food)'


% 6.2 Processing: Centering
meanFood = mean(food);
meanFood = repmat(meanFood,length(food(:,1)),1);
centeredFood = food-meanFood;
 
% 6.2 Processing: Scaling centered data
stdFood = std(food);
stdFood = repmat(stdFood,length(food(:,1)),1);
scaledFood = centeredFood./stdFood;
 
% 6.4. correlation matrix
corrMat = zeros(numDim);
n = length(food(:,1));
for i=1:length(food(1,:))
    for j=1:length(food(1,:))
        corrMat(i,j) = (1/(n-1)) * scaledFood(:,i)'*scaledFood(:,j);
    end
end

% 6.5 Calculate the eigenvectors and eigenvalues of R:
[Veig, Deig] = eigs(R);
% 6.6 Sort the eigenvalues from largest to smallest:
Deig2=diag(sort(diag(Deig),'descend'));
[c, ind]=sort(diag(Deig),'descend'); % record the index of Deig
% 6.6 Accordingly update the order of the eigenvectors in matrix:
Veig2=Veig(:,ind); 

% 6.6 the scree plot of the eigenvalues energies.
[COEFF, SCORE, LATENT, TSQUARED, EXPLAINED] = pca(Z);
% EXPLAINED is the percentage distribution of eigenvalues in c vector
% scree plot
figure()
pareto(EXPLAINED)
xlabel('Principal Component')
ylabel('Variance Explained (%)')

% 6.7 PCA
Z_pca = Z * Veig2(:, 1:2);
% 6.8 scatter plot
figure()
scatter(Z_pca(:,1), Z_pca(:, 2))
xlabel('Principal Component 1 - pca')
ylabel('Principal Component 2 - pca')


% 6.10 SVD
[U,S,V] = svd(Z,'econ');
% 6.11 SVD - projecting data
Z_svd = U * S(:,1:2);
figure()
scatter(Z_svd(:,1), Z_svd(:, 2))
xlabel('Principal Component 1 - svd')
ylabel('Principal Component 2 - svd')