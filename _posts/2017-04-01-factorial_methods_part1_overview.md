---
title: "Factorial Methods: Overview"
series: "Factorial Analysis Intro"
layout: post
categories: [data science]
tags: [overview, factorial methods, dimension reduction, exploratory analysis, unsupervised learning, PCA, MCA FAMD, MFA]
---

## Introduction

### Background

For some time now, I have been interested in the [principal component analysis](https://en.wikipedia.org/wiki/Principal_component_analysis) (PCA) technique as a technique for spotting patterns in data and determining which variables are most useful for data modelling and prediction. However, as with all techniques, PCA has both a context and usage limitations that govern its use. Therefore, a wise user must come to terms with in order to avoid misapplication. Remember folks... ["garbage in, garbage out"](https://en.wikipedia.org/wiki/Garbage_in,_garbage_out) :smile:. This encouraged me to dig deeper to understand where PCA fits in the grand scheme of things. This lead me to the discovery of related techniques such as [multiple correspondence analysis](https://en.wikipedia.org/wiki/Multiple_correspondence_analysis) (MCA) and [factorial analysis of mixed data](https://en.wikipedia.org/wiki/Factor_analysis_of_mixed_data) (FAMD), which are related to PCA. These techniques seem to belong to the same "family" of methods. Therefore the aim of this series of posts is to understand how these methods are properly applied.

### Rationale

The broad purpose of this series of posts is to give me a good general understanding of the factorial anaylsis techniques in a simple, useful way that enables me to properly use them. As such, this is a conceptual overview that does not cover the specific implementation details of these techniques. Firstly, I am not (presently) well versed in [linear algebra](https://en.wikipedia.org/wiki/Linear_algebra), which is a technique that I would like to tackle in future. I first stumbled upon this concept in the Coursera [regression models](https://www.coursera.org/learn/regression-models) class that I took as part of their [Data Science](https://www.coursera.org/specializations/jhu-data-science) specialisation. My present approach is to learn factorial methods in the same way by mastering the essential concepts relating to the selection, application and interpretation of these methods without needing to understand their derivation. Therefore, the overall aim of my study strategy is to effectively <b>use</b> the technique, which precedes my ability to effectively <u>implement</u> the technique.

That said, I found a potentially useful [Wikibook](https://en.wikibooks.org/wiki/Linear_Algebra) that I hope will enable me to learn this technique in time. While I am at it, I also want to recover and improve upon the calculus and trigonometry that I essentially left behind in high school. I want to go deeper in these, but prudence and time dictate that I understand how and when to use the implementation of these methods before I learn their technical derivation.

Importantly, I don't think that I have a perfect understanding of these techniques and naturally, I will correct my understanding as errors come to light in future.

### Purpose Overview

#### a) Motivation

The general purpose of the techniques described in this post is to transform a dataset consisting of <b><i>n</i></b> observations (rows) and <b><i>p</i></b> variables (columns) into another set of variables that are &#8804; <b><i>p</i></b>, which I will generally refer to as principal components (PCs). Some of the characteristics of these PCs are that they are:

* linear combinations of the original variables
* linearly uncorrelated with each other
* ranked according to the amount of the variability that each PC captures from the original dataset.

#### b) Dimension reduction

This has the important effect of reducing the number of variables required to explain the variations observed in the dataset while retaining the maximum amount of information about the data, a process called [dimension reduction](https://en.wikipedia.org/wiki/Dimensionality_reduction).

#### c) Elucidation of hidden influences

Another potentially useful feature of this process is that examining the composition of the PCs, particularly the most informative ones, may reveal the underlying processes or variables that may ultimately be responsible for the patterns observed in the measured variables. 

I suspect that this would be possible by looking at which combination of variables contribute substantially to the PCs which capture the most information (as variance) about the dataset. I think that this is a similar idea to that of [latent variables](https://en.wikipedia.org/wiki/Latent_variable). The exploration of such latent variables is a goal of [Factor Analysis](https://en.wikipedia.org/wiki/Factor_analysis), which is a related (but not interchangeable) set of techniques. 

This kind of analysis could potentially identify groups or categories of observations that can be suitably labelled according to the results of the analysis. Incidentally, an alternative approach is the use of [clustering techniques](https://en.wikipedia.org/wiki/Cluster_analysis#Algorithms).

### Method Overview

This section gives a broad overview of the classical factorial analyses as I understand them. This is intended to provide a simple comparative overview of when and how to use these techniques. Note that the "Analysis scope" section of each technique is an extension of the [general scope](#motivation) outlined above.

<b id="pca-overview">a) [Principal component analysis](https://en.wikipedia.org/wiki/Principal_component_analysis) (PCA)</b>

* Analysis scope:
    
    PCA is computed using <b>only</b> quantitative (continuous numerical values) variables, and is NOT suitable for <u>qualitative</u> (categorical) variables. As a rough guide, this means that the data must be <u>logically</u> and practically consistent with the numerical data transformations required for data preparation.
    
* Input data: 
    * a dataset comprised of individuals (observations or rows) described by a set of quantitative variables (columns).

* Data prep: Raw data must be prepared to avoid distorted results due to the effect of different magnitudes and/or units of input variables on the contribution to the [variance of principal components](http://stats.stackexchange.com/a/69159) ([see here](https://en.wikipedia.org/wiki/Principal_component_analysis#Further_considerations) also).
    * mean-centring (or mean-centering): subtract the mean of each variable from the respecive data points of that variable.
    * [standard normalisation](https://en.wikipedia.org/wiki/Standard_score): mean-centred variables divided by the respective standard deviation.
* Applications:
    * potential examples are shown at the [PCA Wikipedia page](https://en.wikipedia.org/wiki/Principal_component_analysis#Applications)

<b id="mca-overview">b) [Multiple correspondence analysis](https://en.wikipedia.org/wiki/Multiple_correspondence_analysis) (MCA)</b>

* Analysis scope: 
    
    MCA can be thought of as [PCA](#pca-overview) for qualitative variables and is therefore cannot handle quantitative variables inits computation.
    
* Input data: 
     * a dataset comprised of individuals described by a set of qualitative variables.
* Data prep:
    * Presumably one needs to ensure that the category labels of the qualitative variables are appropriately standardised for analysis, i.e. avoid typos as they may be construed as a separate category.
* Applications:
    * potential examples are shown at the [MCA Wikipedia page](https://en.wikipedia.org/wiki/Multiple_correspondence_analysis#Application_fields)

<b id="famd-overview">c) [Factorial analysis of mixed data](https://en.wikipedia.org/wiki/Factor_analysis_of_mixed_data) (FAMD)</b>

* Analysis scope:
    
    FAMD can be applied to the analysis of datasets described by a mix of quantitative and qualitative variables. I understand this to be a combination of the functionality of [PCA](#pca-overview) and [MCA](#mca-overview). A general use case is described in the [scope](https://en.wikipedia.org/wiki/Factor_analysis_of_mixed_data#Scope) section of the FAMD Wikipedia page.
    
* Input data: 
     * a dataset comprised of individuals (observations) described by combinations of quantitative and qualitative variables.
* Data prep:
    * quantitative variables: as per [PCA](#pca-overview)
    * quanlitative variables: as per [MCA](#mca-overview)
* Applications:
    * In addition to the general overview in the [scope](https://en.wikipedia.org/wiki/Factor_analysis_of_mixed_data#Scope), the [FAMD Wikipedia page](https://en.wikipedia.org/wiki/Factor_analysis_of_mixed_data#Example) features a simplified example.

<b id="mfa-overview">d) [Multiple factor analysis](https://en.wikipedia.org/wiki/Multiple_factor_analysis) (MFA)</b>

* Analysis scope: 
    
    From what I understand, MFA is basically [FAMD](#famd-overview) applied to datasets described by <u><b>groups</b></u> of quantitative and/or qualitative variables. The analysis is performed such that variables from one group don't dominate the analyis by having an unreasonably large influence over the result. Larger groups of variables potentially account for more of the variability with in the dataset by virtue of their size alone, and thus may need to be <u>appropriately weighted</u> to remove this potential bias.
    
* Input data:
    *  Essentially as per [FAMD](#famd-overview)
* Data prep:
    *  Essentially as per [FAMD](#famd-overview)
* Applications:
    * potential examples are shown at [MFA Wikipedia page](https://en.wikipedia.org/wiki/Multiple_factor_analysis#Application_examples)

### FactoMineR Implementation

The page for the [FactoMineR](http://factominer.free.fr/) R package, which specialises on factorial analyes, goes into more detail about what it refers to as [classical](http://factominer.free.fr/classical-methods/index.html) and [advanced](http://factominer.free.fr/advanced-methods/index.html) methods, providing a nice summary of the different techniques that are implemented and use case scenarios. I have taken the liberty of summarising the various methods implemented by [FactoMineR](http://factominer.free.fr/) to get a feel for what is available. The simple reason is that I will likely be using this package in combination with the [FactoExtra](http://www.sthda.com/english/rpkgs/factoextra/) in order to perform and visualise factorial analyses. The four analyses [summarised above](#method-overview) are highlighted below for clarity as I expect to be focusing on the application of these methods first before exploring others.

| **Groups of Observations** | **Groups of Variables** | **Variable Type** | **Technique** |
|------------------------------------	|------------------------------------	|------------------------------------	|------------------------------------|
| one | one | quant | [<span style="background-color: #00FF00; font-weight: bold;">PCA</span>](http://factominer.free.fr/classical-methods/principal-components-analysis.html) |
| one | one | quant | [HCPC](http://factominer.free.fr/classical-methods/hierarchical-clustering-on-principal-components.html) |
| one | one | qual | [CA](http://factominer.free.fr/classical-methods/correspondence-analysis.html) |
| one | one | qual | [<span style="background-color: #00FF00; font-weight: bold;">MCA</span>](http://factominer.free.fr/classical-methods/multiple-correspondence-analysis.html) |
| one | one | mixed | [<span style="background-color: #00FF00; font-weight: bold;">FAMD</span>](http://factominer.free.fr/advanced-methods/factor-analysis-of-mixed-data.html) |
|------------------------------------	|------------------------------------	|------------------------------------	|------------------------------------|
| one | many | mixed | [<span style="background-color: #00FF00; font-weight: bold;">MFA</span>](http://factominer.free.fr/advanced-methods/multiple-factor-analysis.html) |
| one | many | mixed | [HMFA](http://factominer.free.fr/advanced-methods/hierarchical-multiple-factor-analysis.html) |
| one | many | quant | [GPA](http://factominer.free.fr/advanced-methods/generalized-procustean-analysis.html) |
|------------------------------------	|------------------------------------	|------------------------------------	|------------------------------------|
| many | one | quant | [Dual MFA](http://factominer.free.fr/advanced-methods/dual-multiple-factor-analysis.html) |

One think to note, at the bottom of the [advanced methods page](http://factominer.free.fr/advanced-methods/index.html) page the description of FAMD (emphasis mine) is:

>"When one set of individuals is described by one set of variables that may be continuous and/or categorical, the analysis proposed <b>is an particular case of MFA</b> called Factor Analysis of Mixed Data."

<b>Note:</b> To me, this contradicts the description of [MFA](https://en.wikipedia.org/wiki/Multiple_factor_analysis) at Wikipedia and also seems to contradict the description of this method in context of what they have implemented (see table above). Admittedly, this is my summary of their information. However, the <u>main point</u> is that I need to take care when selecting, using and interpreting the output of any analysis method implementation. This is critical to ensure that I comply with the requirements of <b>both</b> the <u>factorial method</u> under consideration and the <u>specific implementation</u> of said method.

## Conclusion

This post has been a rewarding one to compile :smile:. I now feel that I have a much better handle of how to use PCA and its related techniques with clarity. I am now in a position to get my hands dirty with some of these techniques and understand:

* their input parameters
* data preparation requirements 
* comprehensive results interpretation

Onward to greater things :smile: