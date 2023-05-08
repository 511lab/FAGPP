# FAGPP
#Fast Anchor Graph Preserving Projections


We provide the codes and the datasets.

Abstract：The existing graph-based dimensionality reduction algorithms need to learn an adjacency matrix or construct it in advance, therefore the time complexity of the graph-based dimensionality reduction algorithms is not less than O(n2d), where n denotes the number of samples, d denotes the number of dimensions. On the other hand, the existing dimensionality reduction algorithms do not consider the cluster information in the original space, resulting in the weakening or even loss of these valuable information after dimensionality reduction. To address the above problems, we propose Fast Anchor Graph Preserving Projections (FAGPP), which learns the projection matrix, the anchors and the membership matrix at the same time. Especially, FAGPP has a built-in Principal Component Analysis (PCA) item, which makes our model not only deal with the cluster information of data, but also deal with the global information of data. The time complexity of FAGPP is O(nmd), where m denotes the number of the anchors and m is much less than n. We propose a novel iterative algorithm to solve the proposed model and the convergence of the algorithm is proved theoretically. The experimental results on a large number of high-dimensional benchmark image data sets demonstrate the efficiency of FAGPP. All the codes and data sets can be found on website https://github.com/511lab/FAGPP.

# Set up
## Requirements
All the experiments were conducted with 32G RAM, 64-bit Windows 10 and Inter Core i9 processor. 
All the codes are implemented with MATLAB 2019b. 

In order to keep consistent with the comparison algorithms, the 1NN classification is chosen as the base classifier. The operating parameters of the 1NN classification are as follows: Euclidean distance is used to calculate the intersample distance, and the number of sample nearest neighbors is taken as 1. When the number of columns of X does not exceed 10, the nearest neighbor search method is the KD-tree search algorithm. The maximum number of data points in the leaf node of the kdtree is 50. We set the weights of each sample to be the same, and each sample is assigned to the class closest to it.

# Datasets
You can also download the datasets from [Datasets](https://github.com/511lab/FAGPP/datasets)

# Codes  
Source Codes on Matlab are available at, [Codes](https://github.com/511lab/FAGPP/code.tar)

1.main.m #The main function of Classification performance.

2.L2_distance_subfun.m  #The  function that calculates the distance between samples.

3.FAGPP.m #The function of our proposed FAGPP algorithm.

4.ConstructA_NP.m  #The function of the anchor point graph construction algorithm.

5.Random_sampling.m  #The function of the Stratified sampling of the Classification performance.

6.EProjSimplex_new.m #The function used to solve for P.


# Contact: 
For any problem about this dataset or codes, please contact Dr. Wang (wjkweb@163.com).
