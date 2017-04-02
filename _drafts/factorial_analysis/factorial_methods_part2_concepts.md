---
title: "Factorial Methods: Useful Concepts"
series: "Factorial Analysis Intro"
layout: post
categories: [data science]
tags: [overview, factorial methods, dimension reduction, exploratory analysis, unsupervised learning, PCA, MCA FAMD, MFA]
---

<!-- http://stackoverflow.com/questions/15155778/superscript-in-markdown-github-flavored -->

<style>
    .superscript {
        font-size: 60%;
        vertical-align: baseline; 
        position: relative;
        top: -0.5em;
    }
</style>

## Introduction

The first post in this series gave us a brief introduction into the different types of factorial analyses that are related to PCA, with a snapshot of where they fit. In this post, we are going to familiarise ourselves with 

Get an idea of some of the 

before I use a technique I like to understand it, otherwise I cannot use it properly and fully interpret its results. So, I find it important to understand what the essential components of the analysis are and the role that they play in the implementation and understanding of the technique.

This is in line with the guiding principle conveyed by the following proverb:

> "Without vision the people perish<b><span class="superscript">1</span></b>" 
> ([Proverbs 29:18](http://biblehub.com/proverbs/29-18.htm))

<b><span class="superscript">1</span></b> or "cast off restraint"

briefly explain the significance of this proverb to this context.

## Computing PCA

During the background reading that I did for the previous post, I discovered that PCA can be computed via a number of means. I identified four different methods from looking at the various sections of the [Wikipedia entry](https://en.wikipedia.org/wiki/Principal_component_analysis#Derivation_of_PCA_using_the_covariance_method) of the PCA Wikipedia page and also by checking out [this answer](http://stats.stackexchange.com/a/79072) at stackexchange that in turn cited [this paper](http://www.sciencedirect.com/science/article/pii/S0169743997000105?via%3Dihub). In addition, three of these methods are summarised [here](https://learnche.org/pid/latent-variable-modelling/principal-component-analysis/algorithms-to-calculate-build-pca-models). Ignoring the fact that each method potentially manifests as "classical" or "kernel" forms, the methods are:

* [Eigenvalue Decomposition (EVD)](https://en.wikipedia.org/wiki/Eigendecomposition_of_a_matrix)
* [Single Value Decomposition (SVD)](https://en.wikipedia.org/wiki/Singular_value_decomposition)
* [Power iteration](https://en.wikipedia.org/wiki/Principal_component_analysis#Iterative_computation)
* [Non-linear iterative partial least squares (NIPALS)](https://en.wikipedia.org/wiki/Principal_component_analysis#The_NIPALS_method)

The common theme: decomposition of either the correlation, covariance or data matrix by some sort of [matrix decomposition](https://en.wikipedia.org/wiki/Matrix_decomposition) approach to obtain pairs of entities that describe the principal components, such that each principal component is described by a pair of entities consisting of one <u>value</u> and one <b>vector</b>. As far as I can determine:

* EVD create eigenvalues and eigenvectors to be used for PCA from a square correlation matrix. 
* SVD seems to be an extension of EVD to rectanglar matrices such that produces singlar values and singlular vectors that are related to the outputs of EVD.

Presently, I am not sure whethere the NIPALS and Power methods produce eigenvalues and eigenvectors. However, NIPALS seems to be able to handle missing values as stated [here](http://pbil.univ-lyon1.fr/ade4/ade4-html/nipals.html), and discussed [here](http://stats.stackexchange.com/questions/35561/)).

I felt that I needed to get a 

* matrix **decomposition value:** represent the proportion of the variability (variance) explained by a given principal component.
* matrix **decomposition vector:** represent the relative importance of each variable in a given principal component.

## PCA terminoloty

http://stats.stackexchange.com/questions/143905/loadings-vs-eigenvectors-in-pca-when-to-use-one-or-another


data matrix:

representation of the input dataset as a matrix object consisting of <b><i>n</i></b> rows of observations and <b><i>p</i></b> columns of variables.

dimensions:

Principal components:

inertia: 

loadings: 
https://folk.uio.no/henninri/pca_module/pca_nipals.pdf

scores: a vector that represents transformation of the individual observations (rows) so that they can be plotted on the PC cartesian space
    * vector length = # observations/rows
    * 1 score vector per PC

active variables:

active individuals:

supplementary variables:

* variables (qualitative or quantitative) added to the PCA after it has been computed. 
* give context

supplementary individuals:

add variables (qualitative or quantitative) or observations to the PCA after it has been computed. Those variables or observations are called supplementary. 


http://www.sthda.com/english/wiki/principal-component-analysis-in-r-prcomp-vs-princomp-r-software-and-data-mining
* Active individuals


## PCA rotations




Most useful guide regarding the different components and their interpretation: 

* http://www.sthda.com/english/wiki/principal-component-analysis-the-basics-you-should-read-r-software-and-data-mining
* http://www.sthda.com/english/wiki/principal-component-analysis-how-to-reveal-the-most-important-variables-in-your-data-r-software-and-data-mining
* https://www.xlstat.com/en/solutions/features/principal-component-analysis-pca 

* http://stats.stackexchange.com/questions/143905/loadings-vs-eigenvectors-in-pca-when-to-use-one-or-another
* http://stats.stackexchange.com/questions/2691/making-sense-of-principal-component-analysis-eigenvectors-eigenvalues/35653#35653
* http://stats.stackexchange.com/questions/80534/what-are-the-units-in-this-pca-biplot/80576#80576

* https://georgemdallas.wordpress.com/2013/10/30/principal-component-analysis-4-dummies-eigenvectors-eigenvalues-and-dimension-reduction/
* interesting but indepth: http://stats.stackexchange.com/a/150978




http://www4.ncsu.edu/~slrace/LinearAlgebra2016/Slides/EigenspacesPrint.pdf


Eigenvalue seems to be a scalar that is the [greatest common divisor](https://en.wikipedia.org/wiki/Greatest_common_divisor) of all of the elements in the eigenvector.

### Tutorials

http://www.cs.otago.ac.nz/cosc453/student_tutorials/principal_components.pdf

https://www.cs.princeton.edu/picasso/mats/PCA-Tutorial-Intuition_jp.pdf

http://people.tamu.edu/~alawing/materials/ESSM689/pca.pdf

https://www.r-bloggers.com/principal-component-analysis/

http://www.statmethods.net/advstats/factor.html

https://georgemdallas.wordpress.com/2013/10/30/principal-component-analysis-4-dummies-eigenvectors-eigenvalues-and-dimension-reduction/ 

http://stats.stackexchange.com/questions/2691/making-sense-of-principal-component-analysis-eigenvectors-eigenvalues


## For later posts

interesting book : https://www.crcpress.com/Multiple-Factor-Analysis-by-Example-Using-R/Pages/p/book/9781482205473

[Terminology](https://en.wikipedia.org/wiki/Factor_analysis#Terminology)

http://www.sthda.com/english/wiki/principal-component-analysis-in-r-prcomp-vs-princomp-r-software-and-data-mining
* Active individuals

http://www.sthda.com/english/wiki/ade4-and-factoextra-principal-component-analysis-r-software-and-data-mining

https://www.xlstat.com/en/solutions/features/principal-component-analysis-pca

add variables (qualitative or quantitative) or observations to the PCA after it has been computed. Those variables or observations are called supplementary. 

https://en.wikibooks.org/wiki/Data_Mining_Algorithms_In_R/Packages/FactoMineR
