%%Written by Sidhant Pednekar
function plotIteratekMeans(X, centroids, idx, K)
%plotIteratekMeans displays the final cluster configuration using plotDataPoints to color every cluster differently

plotDataPoints(X, idx, K);
title(sprintf('Number of Clusters %d', K))

end

