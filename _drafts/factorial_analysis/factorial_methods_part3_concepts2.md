---
title: "Factorial Methods: Core Concepts 2"
series: "Factorial Analysis Intro"
layout: post
math_symbols: true
categories: [data science]
tags: [overview, factorial methods, dimension reduction, exploratory analysis, unsupervised learning, PCA, MCA FAMD, MFA]
---

## Introduction

 previously [discovered]({{site.baseurl}}{%post_url 2017-04-01-factorial_methods_part1_overview%}#method-overview), different analyses 

using the same reference material covered [previously]({{site.baseurl}}{%post_url 2017-04-08-factorial_methods_part2_concepts%}#key-references-used)

https://www.utdallas.edu/~herve/abdi-awPCA2010.pdf

## Visualisation

### 1. Projections

* transformation of data matrix to PCs
    * compression: projection of high dimension data to lower dimension PCs
    * via loading matrix
    * applied to active and passive observations
* scores for each PC created
    * by each PC's loading vector
    * applied to the same data matrix

### 2. Plotting

#### a) overview

* Examine the data represented by PCs
* Groups of PCs can be plotted on a cartesian plane
    * $PC_X$: PC assigned to x-axis
    * $PC_Y$: PC assigned to y-axis
    * $PC_Z$: PC assigned to z-axis
* PCs with the <b>most</b> inertia are plotted
    * mostly 2D (x, y) coordinates
    * sometimes 3D (x, y, z) coordinates
        * less visually interpretable
        * note: > 3D $\ne$ plottable

#### b) variables

* <b><i>aim:</i></b> displayes the correlation/contribution of variables and plotted PCs
* <b><i>coordinates:</i></b> variable <u>loadings</u>
* <b><i>representation:</i></b>
    * arrows from origin (0, 0) to variable locus ($PC_X, PC_Y$)
    * points <b>away</b> from the origin
* <b><i>groups</i></b> of variables share:
    * similar direction because they are correlated
    * possibly &#8805; 1 common underlying (latent) variable(s)

#### c) scores

* <b><i>aim:</i></b> position and relationship of observations relative to plotted PCs
* <b><i>coordinates:</i></b> observation <u>scores</u>
* <b><i>representation:</i></b> 
    * separate data points 
    * each representing one observation
* <b><i>groups</i></b> of observations share: 
    * important characteristics 
    * connections with specific variables

### 3. Circle of correlations

Variable importance = 1/dist from circle origin
Indicates how well the plotted PCs represent the data
If perfect: 
PCs perfectly represent data
loadings position ON circumference
Else: 
More PCs required to perfectly represent data
loadings position inside circle

[hi]({{site.baseurl}}{% post_url 2017-04-08-factorial_methods_part2_concepts %}#active-vs-passive)

### 4. Suppelemtary information

## Modelling (will handle separately after initial examples!)


https://en.wikipedia.org/wiki/Fixed_effects_model

https://en.wikipedia.org/wiki/Random_effects_model

http://stats.stackexchange.com/questions/34509/concepts-of-mixed-effects-in-statistics-and-econometrics-how-to-cope-with-them

https://msdn.microsoft.com/en-us/library/azure/dn913102.aspx


1. Acknowledge the Fixed effects and random effects paradigms and ambiguity

2. Clarify the semantics:
a) Descriptive analysis: 
    * observations represent the population to study
    * 
    
    Model evaluation:

    
b) Predictive analysis
    * observatiosn represent a valid sample of the population
    
    n most applications, the set of observations represents
asamplefromalargerpopulation.Inthiscase,the
goal is to estimate the value of
new
observations from
this population. This corresponds to a
random effect
model.

Model evaluation:
* can't use parametric options (data != population)
* use computer based resampling: e.g.
    * bootstrapping
    * cross-validation
* calculated based on predicted residual sum of squares (PRESS)
    

## Component Selection

### a) Scree Plot

* subjective measure based on variance explained by PCs
* e.g. regain PCs with above average variance explained
* average = 1 / total number of PCs


### b) Estimate model quality

* reduce overfitting
* methods
    * analyse residuals PRESS or RESS
    * bootstrapping
    * crossvalidation
    
### c) PC Confidence intervals (CIs)
* occurs after selection of PCs
* possible via bootstrapping

## Rotations

* Aim: Facilitate easier interpretation of the <b><i>Analysis</i></b> 
* Method: 
    * rotation of the <u>retained</u> PCs
        * PC selection forms a subspace of the <b><i>Analysis</i></b>
        * therefore subspace selection affects rotation results
    * total inertia is not affected
* Types
    * Orthogonal
        * e.g. Varimax
        * reduces the # PCs that a variable can be associated with
        * enhances variable contrast: <b>+ve</b> vs. <b>-ve</b> loadings
    * Oblique
        * e.g. Promax
        * relaxes orthogonality constraints
        * fuses highly correlated PCs
* warning:
    * potential impact on analysis fidelity
        * sacrifices properties of original unrotated analysis
        * reduces reproducibility
    * potential outcome
        * can paradoxically reduce interpretability
        * model less strongly represents data
