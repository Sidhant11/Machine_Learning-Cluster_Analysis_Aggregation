%%Written by Sidhant Pednekar
function centroids = compute_Cluster_Centroids(X, idx, K)
%compute_Cluster_Centroids returns the updated cluster centroid locations

[m n] = size(X);
centroids = zeros(K, n);
for i = 1:K
    centroids(i,:) = mean(X((idx==i),:));
end

end

