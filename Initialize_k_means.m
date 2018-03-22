%%Written by Sidhant Pednekar
function centroids = Initialize_k_means(X, K)
%Initialize_k_means initializes K centroids pseudo-randomly that are to be 
%used in K-Means on the dataset X

randidx = randperm(size(X, 1));
centroids = X(randidx(1:K), :);  % Taking the first K examples as centroids

end

