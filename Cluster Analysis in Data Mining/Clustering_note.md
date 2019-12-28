# Cluster concept (Theortical)

This markdown include all the information related to clustering.

--------------------------

* [General idea](#General_Concept)
* [K-means related](#K-means)
* [Hierarchical cluster](#Hierarchical_Cluster)
* [Probabilistic hierarchical cluster](#Probabilistic_hierarchical_cluster)
* [Density Based Cluster](#Density_Based_Cluster)
* [Grid Based Cluster](#Grid_Based_Cluster)
* [Cluster Validation](#Cluster_Validation)

--------------------------



## General_Concept

1. Concept

   - Distance-based methods
       * Partitioning algorithms: K-means, K-Medoids
       * Hierarchical algorithms: Agglomerative vs divisive methods
   - Probabilistic and generative models
   - Density based and grid-based methods

   

2. Similarity Measures


   - **Measuring similarity of objects**
     * High intra-class similarity: cohesive within clusters
     * Low inter-class similarity: distinctive between clusters

   - **Distance on Numeric Data -> Minkowski Distance**

     * p=1 -> become manhattan distance

        $$ d(i, j) = \left | X_{i1} - X_{j1} \right | + \left | X_{i2}-X_{j2} \right | + ... + \left | X_{il}-X_{jl} \right | $$

     * p=2 -> become Euclidean distance

        $$ d(i, j) = \sqrt{\left | X_{i1} - X_{j1} \right |^{2} + \left | X_{i2}-X_{j2} \right |^{2} + ... + \left | X_{il}-X_{jl} \right |^{2}} $$

     * p=infinite -> supremum distance
       $$ d(i, j) = max\left | X_{i1} - X_{j1} \right | $$

     

   - **Distance calculation example**

      | point | attribute1 | attribute2 |
      | ----- | ---------- | ---------- |
      | x1    | 1          | 2          |
      | x2    | 3          | 5          |
      | x3    | 2          | 0          |
      | x4    | 4          | 5          |

   ​	Manhattan (L1)

      |      | x1   | x2   | x3   | x4   |
      | ---- | ---- | ---- | ---- | ---- |
      | x1   | 0    |      |      |      |
      | x2   | 5    | 0    |      |      |
      | x3   | 3    | 6    | 0    |      |
      | x4   | 6    | 1    | 7    | 0    |

   ​	Euclidean (L2)

      |      | x1   | x2   | x3   | x4   |
      | ---- | ---- | ---- | ---- | ---- |
      | x1   | 0    |      |      |      |
      | x2   | 3.61 | 0    |      |      |
      | x3   | 2.24 | 5.1  | 0    |      |
      | x4   | 4.24 | 1    | 5.39 | 0    |

   ​	Supremum

      |      | x1   | x2   | x3   | x4   |
      | ---- | ---- | ---- | ---- | ---- |
      | x1   | 0    |      |      |      |
      | x2   | 3    | 0    |      |      |
      | x3   | 2    | 5    | 0    |      |
      | x4   | 3    | 1    | 5    | 0    |

   

   - **Proximity Measure for Symmetric vs Asymmetric Binary Variables**

     - Symmetric binary variable (appear and not appear are count as same)

       $$ d(i, j) = \frac{r+s}{q+r+s+t} $$

     - Asymmetric binary variable (similar as F1 score: value FP and FN different)t not import to us 

       $$ d(i, j) = \frac{r+s}{q+r+s} $$

       |      | 1    | 0    | sum  |
       | ---- | ---- | ---- | ---- |
       | 1    | q    | r    | q+r  |
       | 0    | s    | t    | s+t  |
       | sum  | q+s  | r+t  | p    |

     

   - **Distance between Categorical Attributes Ordinal Attributes and Mixed Types**

       * Categorical Variable: m: # of matches, p: total # of variables
         $$ d(i, j) = \frac{p-m}{p} $$

         

   - **Proximity Measure between Two vectors: Cosine Similarity**

     $$ cos(d1,d2) = \frac{d1 \bullet d2}{\left \| d1 \right\| \left \| d2 \right \|} $$

   

   - **Covariance and Correlation Coefficient**

     $$ Var(x) = E[(x-\mu)^{2}] = E[x^{2}] - E(x)^{2} $$

     $$ cov(x1,x2) = E[(x_{1}-\mu_{1})(x_{2}-\mu_{2})] = E[x_{1}x_{2}] - E[x_{1}]E[x_{2}] $$

     $$ \rho = \frac{\sigma_{12}}{\sqrt{\sigma_{1}^{2} \sigma_{2}^{2}}} $$





## K-means

* k-means
  * apply only to continuous data
  * sensitive to outlier -> k-median, k-mode to solve this issue
  * limited to local optimal -> select initial points is very important or use k-means++
  * cannot apply to non-convex clusters which mean can only apply for linear data -> kernel k-means deal with non-linear

* k-mode
  * apply to categorical data

* k-prototype
  * use when there is mixed data (continuous and categorical data)

* k-medoid
  * solve the issue of k-means which is sensitive to outlier
  * how it works:
    * select initial K medoids randomly
    * Object re-assign
    * Swap medoid m with o if it improves the clustering quality
    * repeat above two till it converge
  * drawback: computational intentisive (K\*(n-K)^2)

* kernel-kmeans
  * for non-linear data
  * computational intensive -> compute n\*n kernel



## Hierarchical_Cluster

* Hierarchical Cluster

  * Dendogram

  * no need to specify number of clusters K

  * no iterative refinement

  * types:

    * Agglomerative: bottom up -> ex: Agglomerative nesting (AGNES)

      * from single link (nearest neighbor) -> sensitive to outlier
      * complete link: also sensitive to outlier
      * centroid link

    * Divisive: top down

      * inverse of AGNES

      * recursive split

      * consider as global search

        

* Additional Method of Clusters (Hierarchical Clustering)

  1. BIRCH: micro clustering based method

     * First partitioned hierarchically using a tree structure into microclusters
     * Then clustered into macroclusters via other clustering algorithms

  2. CURE (Clustering using well-scattered representative)

     * minimum distance between the representative points -> (using both single link and average link)
     * shrinking factor alpha: shrunk towards the centroid -> more robust to outlier

  3. CHAMELEON (Graph partitioning on the KNN)

     * Two phase algorithms

       * Use graph partitioning algorithms

       * Use agglomerative hierarchical clustering algorithms

         

* Summary: Once a k-nearest-neighbor graph is constructed, it is partitioned into small graphlets, which are then merged back together to create clusters.

  

* Problem of algorithmic hierarchical clustering

  * Nontrivial to choose a good distance measure
  * Hard to handle missing attribute values
  * Optimization goal not clear: local search



## Probabilistic_hierarchical_cluste

* Use probabilistic models to measure distance between clusters
* Generative model -> ex: Gaussian model
* Can handle partial data
* Summary
  * When measuring the quality of a clustering, we take the product of the likelihood of each individual cluster.
  * Probabilistic hierarchical clustering is considered a generative model: the set of data objects to be clustered is assumed to be drawn from some underlying data generation mechanism.
  * We only merge two clusters if their distance is < 0, which results in an increase in the clustering quality.



## Density_Based_Cluster

* Features:
  * Discover clusters of arbitrary shape
  * handle noise
  * One scan (only examine the local region to justify density)
  * need density parameters as termination condition



* Methods

  1. DBSCAN (Density-based spatial clustering of Application with Noise)

     * discover clusters of arbitrary shape

     * two parameters: 

       * Eps: maximum radius of the neighborhood
       * Minpts: minimum number of points in the eps-neighborhood of a point

     * How it works

       * Arbitrarily select a point p
       * Retrieve all points density reachable	
         * if p is a core point, a cluster is formed
         * if p is a border point, no points are density- reachable from p and DBSCAN visits the next point of the dataset
       * Continue the process until all of the points have been processed

     * Drawback: 

       * computation complexity -> n^2, but if use spatial index then efficient
       * sensitive to parameter settings

       

  2. OPTICS (ordering points to identify clustering structure)

     * solve DBSCAN drawback sensitive to parameter setting
     * idea: higher density points should be processed first
     * How it works: determine the Minpts then determine the distance

     

  3. DENCLUE





## Grid_Based_Cluster

* partition the data space into a finite number of cells to form a grid structure
* features and challenges:
  1. efficiency and scalability: # of cells << # of data points
  2. hard to handle highly irregular data distribution
  3. Locality
  4. curse of dimensionality

* Methods

  1. STING (Statistical information Grid)

     * spatial area is divide into rectangular cells at different levels 

     * How it works

       - start at the root and proceed to the next lower level using STING
       - calculate the likelihood that a cell is relevant to the query at some confidence level using the statistical information of the cell
       - only children of likely relevant cells are recursively explored
       - repeat this process until the bottom layer is reached

     * Advantages:

       1. query independent, easy to parallelize, incremental update

       2. efficiency

          

     * Disadvantages:

       1. loss accuracy in lower level for query process

          

  2. CLIQUE (Clustering in QUEst)

     * Density based and Grid based subspace clustering

     * How it works:

       * partition the data space and find number of points that lie inside each cell of the partition

       * identify the subspace that contain clusters using priori principle

         

     * Advantages:

       * find subspaces of the highest dimensionality 

       * insensitive to the order of records in input

       * scales linearly with the size of input

         

     * Disadvantages:

       * quality of results depend on: number and width of the partitions and grid cells



## Cluster_Validation

* Cluster Validation

  * Externel: supervise -> have ground truth

    * Q(C, T) where Q: quality, C: cluster, T: truth

      -> need to follow 4 criteria

       1. Cluster homogeneity

       2. Cluster completeness

       3. Rag bag better than alien: put those cannot categorize into others rather than mix up

       4.  small cluster preservation

          

   * Measures:

      * Matching-based measure: purity vs maximum matching; F measure

         * Purity: $$\frac{max(n_{ij})}{n_{i}}$$

         * Maximum matching: one cluster can only match to one partition

         * F measure

            * Prec = $$\frac{max(n_{ij})}{n_{i}}$$

            * Recall = $$\frac{max(\left |T_{ij}  \right |)}{\left |T_{i}  \right |}$$

            * F = $$\frac{2n_{ij}}{(n+m)}$$

              

      * Entropy-based measure

         * **Normalised mutual information (NMI)**: When the clustering result is identical to the partition, the mutual information I(C, T)=H(C)=H(T). Thus, NMI(C, T)=1.

           

      * Pairwise measures: agreement between cluster label and partition label

         * TP: two points belong to the same partition and same cluster
         * FN: have same ground truth but different cluster
         * FP: different ground truth (partition label) but same cluster
         * TN: different partition label and not same cluster
         * Measures
            * Jaccard Coefficient
               * Jaccard = TP/(TP+FN+FP)
               * perfect clustering: Jaccard = 1
            * Rand Statistics
               * Rand = (TP+TN)/N
            * Fowlkes-Mallow Measure:
               * FM = sqrt(prec\*recall) = TP/sqrt((TP+FN)(TP+FP))

  

  

   * Internel: unsupervised (Don’t have ground truth)

      * Measures: BetaCV measure

        

   * Relative: direct compare different cluster (usually obtain via different parameter settings for same algorithms)

      * Measures: Silhouette coefficient







 * Some Clusteration for clustering

    * Cluster Stability: use bootstrap to sample to check the cluster stability	

       * finding # of clusters

          * Empirical: k = sqrt(n/2)

          * Elbow method: check the wcss (within cluster sum of square)

          * Cross validation method

            

    * Clustering Tendency: check whether the data is suitable for clustering

       * check whether the data has any inherent grouping structure



​	







