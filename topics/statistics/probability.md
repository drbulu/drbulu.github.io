---
layout: default
---

<script type="text/javascript" src="http://cdn.mathjax.org/mathjax/latest/MathJax.js?config=TeX-AMS-MML_HTMLorMML"></script>

# Probability

### Probability rules

### Intro
Side note: probability is not about the event's outcome, but about the number of ways (paths) that the event can be generated. Thus one outcome can be produced by multiple events.

OR simply, several events can reach the SAME outcome in different ways, each with its own probability assigned to it.

A **probability measure**, $P$, is a function from the collection of possible events so that the following hold

1. For an event $E\subset \Omega$, $0 \leq P(E) \leq 1$
2. $P(\Omega) = 1$
3. If $E_1$ and $E_2$ are mutually exclusive events
  $P(E_1 \cup E_2) = P(E_1) + P(E_2)$.

Part 3 of the definition implies **finite additivity**

$$
P(\cup_{i=1}^n A_i) = \sum_{i=1}^n P(A_i)
$$
where the $$\{A_i\}$$ are mutually exclusive. (Note a more general version of
additivity is used in advanced classes.)

### Interpretation of set operations

Normal set operations have particular interpretations in this setting

1. $\omega \in E$ implies that $E$ occurs when $\omega$ occurs
2. $\omega \not\in E$ implies that $E$ does not occur when $\omega$ occurs
3. $E \subset F$ implies that the occurrence of $E$ implies the occurrence of $F$
4. $E \cap F$  implies the event that both $E$ and $F$ occur
5. $E \cup F$ implies the event that at least one of $E$ or $F$ occur
6. $E \cap F=\emptyset$ means that $E$ and $F$ are **mutually exclusive**, or cannot both occur
7. $E^c$ or $\bar E$ is the event that $E$ does not occur

Some help: http://www.statistics-help-online.com/node9.html

### Example consequences

- $P(\emptyset) = 0$
- $P(E) = 1 - P(E^c)$
- $P(A \cup B) = P(A) + P(B) - P(A \cap B)$
- if $A \subset B$ then $P(A) \leq P(B)$
- $P\left(A \cup B\right) = 1 - P(A^c \cap B^c)$
- $P(A \cap B^c) = P(A) - P(A \cap B)$
- $P(\cup_{i=1}^n E_i) \leq \sum_{i=1}^n P(E_i)$
- $P(\cup_{i=1}^n E_i) \geq \max_i P(E_i)$

## Conditional probability


### 1) calculating conditional probability

See the conditional probability definition (for Syntax)

See the die role example

### 2) Bayes rule

Conditioning set = the set of events for which we want to calculate the probability

Bayes rule

Diagnostic tests

Example(s)

## Expected values

the expected value = mean of a distribution = sum of ( E * pE )  
i.e. expected value is the sum of all events multiplied by their probability  
for a probablility mass function  
expected value = the centre of mass of a distribution  
if each  
mean squared error is a measure of the mean's accuracy (level of imbalance in the discribution)  
expected value = a population 

