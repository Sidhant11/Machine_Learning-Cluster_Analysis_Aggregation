%%Written by Sidhant Pednekar
%% Cluster Analysis: Predicting number of aggregates and their size from primary contituent initial positions 
%  using K-Means Clustering
 
%% Initialization
clear ; close all; clc
 
%% ================= Finding Closest Centroids ====================
 
fprintf('Finding closest centroids.\n\n');
 
X = load('Positions.txt');
 
 %% ===================== Test =========================
 
K = 5; % Number of Centroids, in future will make code optimize number 
%of clusters based of minimisation of cost funtion (distance)
max_n_cy =50; %Number of times the entire algorithm is repeated using different 
%intial cluster positions
max_iters = 20; %Number of iterations to arrive at final cluster position 
%at a given initial seed
initial_centroids = Initialize_k_means(X, K)  %random initialization to get estimate of min cost
[idx cost] = AdjacencyCentroids(X, initial_centroids); %Find cluster closest to each data point 
cost_min = cost;   %Gain estimate of cost value to minimize
fprintf('\n Updated centroids means.\n\n');
centroids = compute_Cluster_Centroids(X, idx, K); %  Computing means using centroid previous classification.
fprintf(' %f %f %f \n' , centroids');
[m n] = size(X);
centroids_opt = centroids;   %optimized through several random cluster initializations
idx_opt = idx;               %optimized through several random cluster initializations
    %% ===================== Optimization of cluster analysis =========================
    
for n_cy = 1:max_n_cy
     initial_centroids = Initialize_k_means(X, K);
     centroids = initial_centroids;   
    %% =================== K-Means Iteration ======================
 
    fprintf('\nIterating.\n\n');
 
    % Run K-Means
    for i=1:max_iters
 
        % For each example in X, assign it to the closest centroid
        [idx cost] = AdjacencyCentroids(X, centroids);
 
       % Given the memberships, compute new centroids
        centroids = compute_Cluster_Centroids(X, idx, K);
    end
 
    fprintf('K-means cycle number %d Cost %d \n', n_cy, cost_min);
 
    if cost<=cost_min
        centroids_opt = centroids;
        idx_opt = idx;
        cost_min = cost;
    end
 
    if n_cy==max_n_cy
        plotIteratekMeans(X, centroids_opt, idx_opt, K);
    end
        
    fprintf('\nK-Means Done.\n\n');
end
 


