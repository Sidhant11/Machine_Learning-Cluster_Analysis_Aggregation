%%Written by Sidhant Pednekar
%% Cluster Analysis: Predicting number of aggregates and their size from primary contituent initial positions 
%  using K-Means Clustering
 
%% Initialization
clear ; close all; clc
 
%% ================= Finding Closest Centroids ====================
 
fprintf('Finding closest centroids.\n\n');
 
X = load('Positions.txt');
 
 %% ===================== Test =========================
 
max_n_cy =50; %Number of times the entire algorithm is repeated using different 
%intial cluster positions
max_iters = 50; %Number of iterations to arrive at final cluster position 
%at a given initial seed
max_K = 10; %Maximum number of clusters to be tested
min_K = 2;
K = ceil(0.5*(max_K + min_K));
initial_centroids = Initialize_k_means(X, K)  %random initialization to get estimate of min cost
[idx cost] = AdjacencyCentroids(X, initial_centroids); %Find cluster closest to each data point 
cost_min = cost;   %Gain estimate of cost value to minimize
fprintf('\n Updated centroids means.\n\n');
centroids = compute_Cluster_Centroids(X, idx, K); %  Computing means using centroid previous classification.
fprintf(' %f %f %f \n' , centroids');
[m n] = size(X);
centroids_opt = centroids;   %optimized through several random cluster initializations
idx_opt = idx;               %optimized through several random cluster initializations
K_opt = 2;                   % Optimum Number of Centroids
cost_min = cost*ones(max_K,1)
    %% ===================== Optimization of cluster analysis =========================
 
for K = 2:max_K
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
 
        fprintf('K-means cycle number %d Cost %d Number of clusters %d \n', n_cy, cost, K);
 
        if cost<=cost_min(K)
            centroids_opt = centroids;
            idx_opt = idx;
            cost_min(K) = cost;
            K_opt = K;
        end
 
        if n_cy==max_n_cy && K == max_K
            %plotIteratekMeans(X, centroids_opt, idx_opt, K_opt);
            %fprintf('Opt_Cost %d Opt Number of clusters %d \n', cost_min, K_opt);
        end
 
        fprintf('\nK-Means Done.\n\n');
    end
   
end
%Plotting Cost vs number of clusters
 K = 2:max_K;
 plot(K, cost_min(2:end))
 hold on;
 %Value for number of clusters chosen, based on "Elbow" in slope
 scatter(5,cost_min(5),200,'r')
xlabel('Number of clusters','interpreter','latex', 'fontweight','bold','FontSize',16);
ylabel('Cost', 'interpreter','latex','fontweight','bold','FontSize',16);