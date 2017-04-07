---
title: "Factorial Methods: Core Concepts 1"
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

The first post in this series gave us a brief introduction into the different types of factorial analyses that are related to PCA, with a snapshot of where they fit. In this post, we are going to familiarise ourselves with the general structure or composition of a factorial analysis using PCA as a general framework.

Consequently, I will use the term <b><i>Analysis</i></b> to refer generally to any factorial method that a given concept refers to. This is important because, as we previously [discovered]({{site.baseurl}}{%post_url 2017-04-01-factorial_methods_part1_overview%}#method-overview), different analyses have different input data requirements. For convenience and brevity, the terms "Principal Component", "Component" or any other description of the products of an <b><i>Analysis</i></b> are simply referred to as PC.

By way of [reminder]({{site.baseurl}}{%post_url 2017-04-01-factorial_methods_part1_overview%}#rationale), the general principle behind this series of posts is that I aim to obtain a firm grasp of the concepts behind a technique use it. Otherwise I cannot use it properly and fully interpret its results. This guiding principle is embodied by the following proverb (paraphrased):

> "Without vision the people perish,  but blessed is the one who heeds wisdom's instruction<b><span class="superscript">1</span></b>" 
> ([Proverbs 29:18](http://biblehub.com/proverbs/29-18.htm))

<b><span class="superscript">1</span></b> or "cast off restraint"

With all this in mind, let us begin exploration :smile:

## Analysis computation (PCA)

This section 

During the background reading that I did for the previous post, I discovered that PCA can be computed via a number of means. I identified four different methods from looking at the various sections of the [Wikipedia entry](https://en.wikipedia.org/wiki/Principal_component_analysis#Derivation_of_PCA_using_the_covariance_method) of the PCA Wikipedia page and also by checking out [this answer](http://stats.stackexchange.com/a/79072) at stackexchange that in turn cited [this paper](http://www.sciencedirect.com/science/article/pii/S0169743997000105?via%3Dihub). In addition, three of these methods are summarised [here](https://learnche.org/pid/latent-variable-modelling/principal-component-analysis/algorithms-to-calculate-build-pca-models). Ignoring the fact that each method potentially manifests as "classical" or "kernel" forms, the methods are:

* [Eigenvalue Decomposition (EVD)](https://en.wikipedia.org/wiki/Eigendecomposition_of_a_matrix)
* [Single Value Decomposition (SVD)](https://en.wikipedia.org/wiki/Singular_value_decomposition)
* [Power iteration](https://en.wikipedia.org/wiki/Principal_component_analysis#Iterative_computation)
* [Non-linear iterative partial least squares (NIPALS)](https://en.wikipedia.org/wiki/Principal_component_analysis#The_NIPALS_method)

The common theme: decomposition of either the correlation, covariance or data matrix by some sort of [matrix decomposition](https://en.wikipedia.org/wiki/Matrix_decomposition) approach to obtain pairs of entities that describe the principal components, such that each principal component is described by a pair of entities consisting of one <u>value</u> and one <b>vector</b>. As far as I can determine:

* EVD create eigenvalues and eigenvectors to be used for PCA from a square correlation matrix. 
* SVD seems to be an extension of EVD to rectanglar matrices such that produces singlar values and singlular vectors that are related to the outputs of EVD.

Presently, I am not sure whethere the NIPALS and Power methods produce eigenvalues and eigenvectors. However, NIPALS seems to be able to handle missing values as stated [here](http://pbil.univ-lyon1.fr/ade4/ade4-html/nipals.html), and discussed [here](http://stats.stackexchange.com/questions/35561/)). Therefore, it seems to me that the computation of a PCA, regardless of the method employed, can be generally described as producing pairs of the following elements:

* matrix **decomposition value:** represent the proportion of the variability (variance) explained by a given principal component.
* matrix **decomposition vector:** represent the relative importance of each variable in a given principal component.

However, I will be using the terms eigenvalues and eigenvectors as the general term for simplicity. 

Incidentally, this might be simplistic, but it seemed to me that the eigenvalue seems to be a scalar that is the [greatest common divisor](https://en.wikipedia.org/wiki/Greatest_common_divisor) of all of the elements in the eigenvector. I mention it because the idea made some sense to me as a neat rationalisation for why eigenvalues exist, because the eigenvalue is potentially derived from the unit scaling of the eivenvector. That said, I'm not sure whether this is the actual mathematical explanation.

## Analysis terminoloty

### key references used:

First got the idea of checking out terminology [here](http://www.sthda.com/english/wiki/principal-component-analysis-in-r-prcomp-vs-princomp-r-software-and-data-mining), however, my subsequent search for a clear and standardised interpretation of these elements on the interwebs (sic) was more confusing than I hoped. Consequently, I reverted to my academic bias and sought to collect a small number of authoritative sources that communicate the concepts that I need to acquire with consistent semantics.

To this end, I decided to read through the work of [Abdi (2010)](https://www.utdallas.edu/~herve/abdi-awPCA2010.pdf), [Risvik (2007)](https://folk.uio.no/henninri/pca_module/pca_nipals.pdf) and [Wold et. al. (1987)](http://www.sciencedirect.com/science/article/pii/0169743987800849) as a first step to familiarising myself with the essential characteristics of PCA and other factorial methods.

Again, the overall aim is to <b>distill</b> these concepts into their most basic definitions as a reference point for further exploration.

### 1) Fundamentals components

#### a. data matrix:

representation of the input dataset as a matrix object (<b><i>n</i></b> &times; <b><i>p</i></b>) consisting of:

* <b><i>n</i></b> rows of observations
* <b><i>p</i></b> columns of variables

#### b. inertia: 

The inertia of a variable is a representation of the amount of the variance that is explained by this variable.

* variables in question are the PCs
* inertia embodied by the the eigenvalue
* total inertia = inertia of the whole dataset
* conceptually: inertia = eigenvalue = sum of squares of all observation scores
* also represented as a % of the total inertia

Basically, inertia measures the amount of <b><i>information</i></b> contained within a variable (as far as I can tell). Further, as noted [here](http://stats.stackexchange.com/questions/207642/correct-way-to-report-the-results-of-a-correspondence-analysis-and-a-principal-c), if a few PCs account for most of the inertia in the dataset:

* there is a lot of correlation between the input variables
* i.e. there is a lot of <u>redundant</u> information

#### c. centre of gravity: 

#### d. loadings: 

1. loading:
* the correlation between a given variable and a particular PC
* represents how much of a variable was used to create that PC
2. loading matrix:
* a matrix (<b><i>p</i></b> &times; <b><i>p</i></b>) of the loadings that represents the construction of the PCs by the <b><i>Analysis</i></b>
* rows (loading <b><i>vectors</i></b>): represent computed PCs (&#8804; <b><i>p</i></b>)
* columns: represent the <b><i>p</i></b> input variable loadings for each PC

#### e. Scores 

a vector that represents transformation of the individual observations (rows) so that they can be plotted on the PC cartesian space
    * vector length = # observations/rows
    * 1 score vector per PC

Scores:	"The values of individual observations represented according to PCs
*  Calculated using the loadings
* 1 scores vector per component
* Vector contains n elements (one element per observation)"

### 2) Contributions:	

This section attempts to deal specifically with components that relate one aspect of the <b><i>Analysis</i></b> to another. Therefore, in this section the terms importance, contribution, influence and impact are seen as conceptually interchangeable.

#### a. variable contribution (loadings<span class="superscript">2</span>)

* the contribution (%) of a given variable to a particular PC
    * proportion of a variable's variance that is explained
    * derived from <b>loadings<span class="superscript">2</span></b>

#### b. observation contributions: 

* The importance of an specific observation (i) to a particular PC (l)
* calculated as: ctri, l = observation score(i)<span class="superscript">2</span> &divide; eigenvalue (l)
* Note: eigenvalue = sum of squares of all observation scores

#### c. PC contributions (cos<span class="superscript">2</span>):

* The importance of an specific PC to a particular observation
    * measured by the square cosine (cos<span class="superscript">2</span>)
    * i.e. correlation between an observation and a PC
* indicates which PCs are important to interpreting an observation

### 3) active and passive components

With regards to variables, the term compatible relates specifically to whether a variable can be used in the computation of PCs by the <b><i>Analysis</i></b>.

#### a. active components:
    
input used to run the PCA analysis and calculate the PCs
    
* Active variables: Input variables for computation of the PCs
* Active individuals	Input observations for computation of the PCs

#### b. supplementary components:

a.k.a passive 

Variables included AFTER computation of the PCs

* variables (qualitative or quantitative) added to the PCA after it has been computed. 
* give context


supplementary individuals:

    Observations included AFTER computation of the PCs
    add variables (qualitative or quantitative) or observations to the PCA after it has been computed. Those variables or observations are called supplementary. 
    transformed into scores using the loadings generated from analysis of the active variables?
    
http://www.sthda.com/english/wiki/principal-component-analysis-in-r-prcomp-vs-princomp-r-software-and-data-mining
* Active individuals

