

load X_data.mat
% transpose of X_data
X_t = X_data';
% the first 8 data points
X_data_8 = X_t(1:8,:);
% 4.1 Calculate the Euclidean distances between each pair of the data points
D = pdist2(X_t, X_t);
% 4.1 report the distances among the first 8 data points (a 8×8 distance matrix).
D8 = pdist2(X_data_8, X_data_8);

% 4.1 (a) and (b)
% construct a neighborhood graph using the first criteria
D1 = zeros(size(D,1),size(D,2));
for row = 1:size(D,1)
    [sortedValues,sortIndex] = sort(D(row,:),'ascend');
    for col = 1:size(D,2)
        if D(row,col) < sortedValues(7) & D(row,col)~=0
            D1(row,col) = D(row,col);
        end
    end
end
G1 = digraph(D1);
% plot the neighborhood graph G1
figure();
plot(G1);

% construct a neighborhood graph using the second criteria
D2 = zeros(size(D,1),size(D,2));
for row = 1:size(D,1)
    for col = 1:size(D,2)
        if D(row,col) < 6
            D2(row,col) = D(row,col);
        end
    end
end
G2 = graph(D2);
% plot the neighborhood graph G2
figure();
plot(G2);


% construct a neighborhood graph using the first criteria
D3 = zeros(size(D8,1),size(D8,2));
for row = 1:size(D8,1)
    [sortedValues,sortIndex] = sort(D8(row,:),'ascend');
    for col = 1:size(D8,2)
        if D8(row,col) < sortedValues(7) & D8(row,col)~=0
            D3(row,col) = D8(row,col);
        end
    end
end
G3 = digraph(D3);
% plot the neighborhood graph G1
figure();
plot(G3);

% construct a neighborhood graph using the second criteria
D4 = zeros(size(D8,1),size(D8,2));
for row = 1:size(D8,1)
    for col = 1:size(D8,2)
        if D8(row,col) < 6
            D4(row,col) = D8(row,col);
        end
    end
end
G4 = graph(D4);
% plot the neighborhood graph G2
figure();
plot(G4);

% 4.2
geo = zeros(size(D8,1), size(D8,2));

% geodesic distance for 8 points based on neighborhood graph G3
geodesic1 = geodesic(G3, geo);
% geodesic distance for 8 points based on neighborhood graph G4
geodesic2 = geodesic(G4, geo);






        
            
