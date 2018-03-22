# Machine_Learning-Cluster_Analysis_Aggregation
This folder contains codes for a Unsupervised machine learning cluster analysis on aggregating particles. 
Specifically it predicts the individual particle constitution of each floc, and so gives an estimate on
the floc size distribution at the end of the agglomeration process. "Bullet_simulations_aggregated_clusters.PNG"
contains the final floc configuration after a Langevin simulation run using Bullet Physics Engine having a 
conservative attractive force. Predictions from the cluster analysis are seen in "Cluster_Analysis_Aggregating_flocs.PNG".
As seen, the analysis makes very sucessful predictions and shows the application of such a methodology in Peclet infinity systems,
in the absence of Stochastic forces. Current work focuses on such predictions in the presence of such forces.

Initial particle positions are contained in the "Position.txt"
Optimum number of clusters to be used in the analysis is selected by running "Number_of_clusters_optimum.m"
Finally run "Main.m" for the cluster analysis. Extensive documentation has been provided in the form of comments for each code.
