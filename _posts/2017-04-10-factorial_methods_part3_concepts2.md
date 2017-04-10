---
title: "Factorial Methods: Core Concepts 2"
series: "Factorial Analysis Intro"
layout: post
math_symbols: true
categories: [data science]
tags: [overview, factorial methods, dimension reduction, exploratory analysis, unsupervised learning, PCA, MCA FAMD, MFA]
---

## Introduction

This post is a continuation of the [Analysis terminology]({{site.baseurl}}{%post_url 2017-04-08-factorial_methods_part2_concepts%}#analysis-terminology) summary in the previous post. In addition, much of this post is a summary of the overview article of PCA by [Abdi and Williams (2010)](https://www.utdallas.edu/~herve/abdi-awPCA2010.pdf) aimed at getting a full picture of the various aspects of factorial analysis. Specific topics will be covered in later posts, where relevant, building on this initial summary. Consequently, this post is heavily "bullet pointed" to facilitate my exploration. Therefore, a motivated reader is welcome to explore the original source for a more comprehensive treatment of the concepts summarised here.

## Visualisation

This section aims to summarise some of the concepts related to the visualisation of factorial analyses, again using PCA as a general lens. I like to think of the previous post as core concepts relating to the conputation or construction of an <b><i>Analysis</i></b>, this section aims to deal with how said concepts come together when one seeks to interpret the outputs of an <b><i>Analysis</i></b>.

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
* Supplementary information:
    * The integration of supplementary information in the [previous post]({{site.baseurl}}{%post_url 2017-04-08-factorial_methods_part2_concepts%}#b-supplementary-inputs). That section also described the notion of "compatible" vs. "incompatible" variables. Suffice to say that: 
        * supplementary observations and "compatible" variable types can be visualised as per active variables and observations
        * "incompatible" variable types can be overlaid onto the analysis to visually enhance interpretation.

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

### d) Circle of Correlations (CoC)

* A circle of unit radius (r = 1), centred at plot origin (0, 0)
* Measures the importance of a variables to the plotted PCs
    * how well variable is represented by plotted PCs
        * strength of correlation between variable and PC
        * distance from origin &prop; correlation strength
    * Perfectly represented variables
        * position <b>on</b> circumference
        * variable $\sum loadings^2 = 1$
    * Variables not completely represented
        * position <u>inside</u> circumference
        * variable $\sum loadings^2 \<  1$
* Consequently, indicates how well the plotted PCs represent the dataset
    * Perfect: loadings of ALL variables ON circumference
    * Imperfect: loadings of ALL (or some) variables INSIDE circumference

## Modelling Application

### Semantic clarification

This section of the post touches briefly on some of the concepts relating to how factorial analyses model (i.e. represent) the original data. As such I will be using the terms [Fixed Effects Model (FEM)](https://en.wikipedia.org/wiki/Fixed_effects_model) and [Random Effects Model (REM)](https://en.wikipedia.org/wiki/Random_effects_model) in a manner divergent from their Wikipedia definitions. Apparently, there is some [ambiguity](http://stats.stackexchange.com/questions/34509/concepts-of-mixed-effects-in-statistics-and-econometrics-how-to-cope-with-them) regarding the use of these terms, e.g. Econometrics viewpoint vs. Biostatistics (see Wikipedia).

So, being a life scientist, I will go down the biostatistics route to defining these concepts, given that this context is more accessible to me. Also, the definitions seem simpler. However, it is good to understand that another world view exists in the event that I enter a different context. That said, here are my working definitions, imbibed graciously from [Abdi and Williams (2010)](https://www.utdallas.edu/~herve/abdi-awPCA2010.pdf).

### Model definition

* Fixed Effect Model (FEM): The data used in the <b><i>Analysis</i></b> (e.g. PCA) represent the <b>entire <u>population</u></b> of individuals or observations.
    * seems to represent a <b>descriptive analysis</b> application
    * e.g. what are the major underlying characteristics that define <u>this population</u>?
* Random Effect Model (REM): The data used in the <b><i>Analysis</i></b> represent a <b>subset</b> (sample)</b> in order to estimate the characteristics of the population from which these observations were drawn.
    * seems to represent an inferential or predictive analysis application
    * e.g. can we use <u>this sample</u> to: 
        * understand the characteristics of the broader general population?
        * to predict the nature of a new set of samples drawn from the same original population?

### Model evaluation

Note, the summary below represents a general conceptual contrast between the approaches. As such, this <b>does not</b> cover any specific implementation/application scenarios:

* Analysis as <b>FEM</b>: 
    * Evaluate the reconstruction of the entire data matrix using a selected number of components
    * calculate quality:
        * based on residual sum of squares (RESS)
        * estimate also adaptable to supplementary observations
        * Using ALL computed PCs perfectly reconstructs data matrix

* Analysis as <b>REM</b>: 
    * can't use parametric options (data != population)
    * use computer based resampling: e.g.
        * bootstrapping
        * cross-validation (e.g. jacknife a.ka. leave-one-out)
    * calculate quality:
        * based on predicted residual sum of squares (PRESS)
        * essentially estimates in-sample error.
        * Data reconstruction from model
            * may <b>not</b> be possible even using ALL computed PCs
            * especially if: number of variables (<b>p</b>) &gt; number of observations (<b>n</b>)

## Component Selection

### a) Scree Plot

* subjective measure based on variance explained by PCs
* visually assessed by a ranked plot of the variance explained by all PCs
    * e.g. regain PCs that explain above average variance
    * average = 1 / total number of PCs
* warning:
    * can potentially overlook important information
    * e.g. if a variable contributes significantly to an <u>excluded</u> PC

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

Previously, I had heard a bit about rotations and was vaguely familiar with them. Judging by what is summarised below I don't see myself using them, but I found it good to get a clearer picture of what the fuss was about. (http://stats.stackexchange.com/a/136936)

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

## Conclusion

This has been another good exercise that expanded our understanding of the essential characteristics of factorial analyses, serving as a solid foundation to serve further reading and facilitate analysis interpretation. In the next post, we will look at how these analyses can be implemented in R. 

:smile: