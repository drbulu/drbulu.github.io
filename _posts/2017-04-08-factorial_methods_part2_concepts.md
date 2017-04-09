---
title: "Factorial Methods: Core Concepts 1"
series: "Factorial Analysis Intro"
layout: post
math_symbols: true
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

This section was one that I found necessary to tackle before fleshing out the other ideas in this post. This was because I realised that I had to have a good conceptual grasp of how <b>Analyses</b> are calculated. Here, I aim to use PCA as a lens to understand the inner workings of factorial analyses to alay potential confusion about their interpretation.

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

## Analysis terminology

### key references used:

First got the idea of checking out terminology [here](http://www.sthda.com/english/wiki/principal-component-analysis-in-r-prcomp-vs-princomp-r-software-and-data-mining), however, my subsequent search for a clear and standardised interpretation of these elements on the interwebs (sic) was more confusing than I hoped. Consequently, I reverted to my academic bias and sought to collect a small number of authoritative sources that communicate the concepts that I need to acquire with consistent semantics.

To this end, I decided to read through the work of [Abdi (2010)](https://www.utdallas.edu/~herve/abdi-awPCA2010.pdf), [Risvik (2007)](https://folk.uio.no/henninri/pca_module/pca_nipals.pdf) and [Wold et. al. (1987)](http://www.sciencedirect.com/science/article/pii/0169743987800849) as a first step to familiarising myself with the essential characteristics of PCA and other factorial methods.

Again, the overall aim is to <b>distill</b> these concepts into their most basic definitions as a reference point for further exploration.

### 1) The basics

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

Represents the centre of gravity (mean) of the rows: 

* of the original data matrix
* synonyms: barycentre or centroid
* a vector of length <b><i>p</i></b>
* can be used to represent group centres (e.g.  [here](http://www.sthda.com/english/wiki/principal-component-analysis-in-r-prcomp-vs-princomp-r-software-and-data-mining#supplementary-qualitative-variables))?

#### d. loadings: 

1. loading:
* the correlation between a given variable and a particular PC
* represents how much of a variable was used to create that PC
2. loading matrix:
* a matrix (<b><i>p</i></b> &times; <b><i>p</i></b>) of the loadings that represents the construction of the PCs by the <b><i>Analysis</i></b>
* rows (loading <b><i>vectors</i></b>): represent computed PCs (&#8804; <b><i>p</i></b>)
* columns: represent the <b><i>p</i></b> input variable loadings for each PC

#### e. Scores 

A vector that represents transformation of the individual observations (rows) so that they can be plotted on the PC cartesian space:

* values of the PC variables for each row
* Vector contains <b><i>n</i></b> elements (one element per observation)
* 1 vector of scores per PC

### 2) Contributions:	

This section attempts to deal specifically with components that relate one aspect of the <b><i>Analysis</i></b> to another. Therefore, in this section the terms importance, contribution, influence and impact are seen as conceptually interchangeable. Importantly, these contributions relate substantially to the interpretation of an <b><i>Analysis</i></b>.

#### a. variable contribution (loadings<span class="superscript">2</span>)

* the contribution (%) of a given variable to a particular PC
    * proportion of a variable's variance that is explained
    * derived from <b>loadings<span class="superscript">2</span></b>

#### b. observation contributions: 

* The importance of an specific observation <b><i>i</i></b> to a particular PC (l)
* calculated using:
    * the PC's eivenvalue ($\lambda_l$)
    * observation's score, which we'll call $o_{i,l}$ (observation <i>i</i> for component <i>l</i>)

$$ctr_{i,l} = { o_{i,l} \over \lambda_l } = { o_{i,l} \over \sum^n_1 o^2_{i,l} }$$

> Note: $\lambda_l$ = $\sum^n_1 o^2_{i,l}$

#### c. PC contributions (cos<span class="superscript">2</span>):

* The importance of an specific PC to a particular observation
    * measured by the square cosine (cos<span class="superscript">2</span>)
    * i.e. correlation between an observation and a PC
* indicates which PCs are important to interpreting an observation

### 3) Active vs. Passive

The calculation and interpretation of a given <b><i>Analysis</i></b> potentially involve two types of inputs: active and passive. Therefore, it is useful to have a clear idea of what these constituents are.

Related to this, with regards to variables, I use contrast the terms <i>compatible</i> and <i>incompatible</i>. This indicates whether a variable can be used in the computation of PCs by the <b><i>Analysis</i></b> in question.

* compatible: e.g. <b>quantitative</b> variables as input to PCA 
* incompatible: e.g. PCA input variables <u>cannot</u> be <b>qualitative</b>

#### a. active inputs:
    
Inputs used to calculate the PCs for a given <b><i>Analysis</i></b>:

* Active variables: 
    * Input variables <u>compatible</u> for computation of the PCs
    * $\sum loadings^2 = 1$

* Active individuals: 
    * Input observation rows for computation of the PCs
    * each row contains measurements of the <b><i>p</i></b> active variables

#### b. supplementary inputs:

Inputs included <u>after</u> the calculation of PCs by the <b><i>Analysis</i></b>. Also referred to as <i>passive</i>:

* passive observations
    * not used to compute the PCs
    * row contains measurements of the same <b><i>p</i></b> active variables
    * scores for calculated using the loading matrix calculated from the active variables
     * <b style="color:red;">Machine learning note:</b> passive observations <b>must</b> be preprocessed using the data centroids (means) and/or standard deviations used to preprocess the <b>active</b> variables (as explained in week 2 of [this](https://www.coursera.org/learn/practical-machine-learning#syllabus) course).

* passive variables
    * Additional variables measured for active (and possibly passive) observations
    * General aim: add further insight to the <b><i>Analysis</i></b>
        * add new insight to active variables
        * find where passive variables fit in the active analysis context
    * a) <u>compatible</u> variables:
        * Measures correlation between active PCs and variables
        * Loadings computed between passive variable(s) and active PCs
            * i.e. correlation coefficients
            * elable plotting of these variables
            * Supplementary $\sum loadings^2 \ne 1$
    * b) <u>incompatible</u> variables:
        * some analyses have input variables restrictions:
            * PCA: quantitative ONLY
            * MCA: qualitative ONLY
        * indirect integration:
            * cannot be computed directly by the <b><i>Analysis</i></b>
            * but can be superimposed onto the analysis e.g <u>plotting</u>:
                * colour by variable
                * shape by variable
                * group by varible (e.g. circle scores by group as shown [here](http://www.sthda.com/english/wiki/principal-component-analysis-in-r-prcomp-vs-princomp-r-software-and-data-mining#supplementary-qualitative-variables))
            * consider versatile <b><i>Analysis</i></b> alternative:
                * if seeking to superimpose many passive variables
                * options for mixed data: [FAMD](https://en.wikipedia.org/wiki/Factor_analysis_of_mixed_data) or [MFA](https://en.wikipedia.org/wiki/Multiple_factor_analysis)

## Conclusion

Previously, we were introduced to the main basic types of factorial analysis. Following this, we have delved a little bit into how these methods work, using the PCA as a general framework. Personally, I found this process to be instructive and have gained significant insight and confidence that I feel that I can apply to correctly interpreting factorial methods. In the next post we will cover a few more areas before diving into examples :smile:. 