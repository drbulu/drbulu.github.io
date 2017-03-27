---
title: "Factorial Methods: Overview"
series: "Factorial Analysis Intro"
layout: post
categories: [data science]
tags: [overview, factorial methods, dimension reduction, exploratory analysis, unsupervised learning, PCA, MCA FAMD, MFA]
---

## Introduction

For some time now, I have been interested in the [principal component analysis](https://en.wikipedia.org/wiki/Principal_component_analysis) (PCA) technique as a technique for spotting patterns in data and determining which variables are most useful for data modelling and prediction. However, as with all techniques, PCA has both a context and usage limitations that govern its use. Therefore, a wise user must come to terms with in order to avoid misapplication. Remember folks... ["garbage in, garbage out"](https://en.wikipedia.org/wiki/Garbage_in,_garbage_out) :smile:. This encouraged me to dig deeper to understand where PCA fits in the grand scheme of things. This lead me to the discovery of related techniques such as [multiple correspondence analysis](https://en.wikipedia.org/wiki/Multiple_correspondence_analysis) (MCA) and [factorial analysis of mixed data](https://en.wikipedia.org/wiki/Factor_analysis_of_mixed_data) (FAMD), which are related to PCA. These techniques seem to belong to the same "family" of methods. Therefore the aim of this series of posts is to understand how these methods are properly applied.

## Method Overview

### Basic Overview

[Principal component analysis](https://en.wikipedia.org/wiki/Principal_component_analysis) (PCA)

[Multiple correspondence analysis](https://en.wikipedia.org/wiki/Multiple_correspondence_analysis) (MCA)

[Factorial analysis of mixed data](https://en.wikipedia.org/wiki/Factor_analysis_of_mixed_data) (FAMD)

[Multiple factor analysis](https://en.wikipedia.org/wiki/Multiple_factor_analysis) (MFA)

### Further Info

The page for the [FactoMiner](http://factominer.free.fr/) package, which specialises on factorial analyes, goes into more detail about what it refers to as [classical](http://factominer.free.fr/classical-methods/index.html) and [advanced](http://factominer.free.fr/advanced-methods/index.html) methods, providing a nice summary of the different techniques that are implemented and use case scenarios.


## For later posts

[Terminology](https://en.wikipedia.org/wiki/Factor_analysis#Terminology)

http://www.sthda.com/english/wiki/principal-component-analysis-in-r-prcomp-vs-princomp-r-software-and-data-mining
* Active individuals

http://www.sthda.com/english/wiki/ade4-and-factoextra-principal-component-analysis-r-software-and-data-mining

https://www.xlstat.com/en/solutions/features/principal-component-analysis-pca

add variables (qualitative or quantitative) or observations to the PCA after it has been computed. Those variables or observations are called supplementary. 

https://en.wikibooks.org/wiki/Data_Mining_Algorithms_In_R/Packages/FactoMineR
