function [idx cost] = AdjacencyCentroids(X, centroids)
%AdjacencyCentroids computes the closest centroid  for each constituent and
%returns cluster label number (1-K)

K = size(centroids, 1);

idx = zeros(size(X,1), 1);
dist = zeros(size(X,1), K);

for i = 1:K
    dist(:,i) = (X(:,1) - centroids(i,1)).^2 + (X(:,2) - centroids(i,2)).^2 + (X(:,3) - centroids(i,3)).^2 ;
end
[val, idx] = min(dist');
cost = sum(val);
end

