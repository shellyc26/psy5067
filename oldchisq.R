old chisq lecture

---
  ## When to use?
  - Classes of observations

- Non-continuous data

???
  The normal is no longer useful if you have noncontinuous data

---
  ## Assumptions
  
  - Each observation is in only one category

- Observations are independent

- N is large (or expected N is large)
- 2 groups greater than 10 per group
- More than 2 groups greater than 5 per group

---
  ## Remember Independence? 
  
  $$p(A)p(B) = p(A\cap B)$$
    ---
    ## Let's expand... Tests of Association (or Independence)
    
    - aka Pearson Chi-square test
  
  - Developed to see how close we are to the estimated distribution
  - nominal data (ordinal and greater we can use corelations)
  
  ---
    ## Same Old Same
    - If we are interested in knowing whether X is contingent (or dependent) upon Y, or whether X and Y are **independent**, we're going to need a bigger table.

- And we need to calculate our expected frequencies differently, where...

- Expected value = $R_iC_j/N$

---
class: inverse, middle, center

## Is attrition on a longitudinal study related to educational attainment?

???
People seem to be dropping out of your study. You hope that they drop out at random. But you're concerned that the people dropping out do so in a way that seems to be related to education levels. Maybe you think that the less educated a participant is, the more likely it is that they drop out of the study. 
  
  ---
    ## Attrition Example
    
    Our data...
  
  ```{r,echo=FALSE}
  att = data.frame(StayedIn = c(20, 25, 30),
                   DroppedOut = c(20, 15, 10))
  
  row.names(att) = c("Failed to complete high school",
                     "High school degree",
                     "College degree")
  
  att
  ```
  
  *Null Hypothesis*: There is no association between the categorical variables we are testing. No association between educational attainment and attrition. They are independent
  
  *Alternative Hypothesis*: There is an association between educational attainment and attrition. They are not independent.
  
  ---
    
    ## Attrition Example
    
    ```{r, echo=FALSE}
  att
  ```
  
  It's the same general formula, but we need to calculate our expected values a little differently...
$$ \chi^2_P = \Sigma\frac{(\text{observed frequency} - \text{expected frequency})^2}{\text{expected frequency}}$$

$$\text{Expected Value} = R_iC_j/N$$
---
## Attrition Example

The OG Data

```{r,echo=FALSE}
att = data.frame(StayedIn = c(20, 25, 30),
                 DroppedOut = c(20, 15, 10))

row.names(att) = c("Failed to complete high school",
                   "High school degree",
                   "College degree")

att
```


--

The Expected Value Calculations

```{r,echo=FALSE}
att2 = data.frame(StayedIn = c("40*75/120", "40*75/120", "40*75/120"),
                 DroppedOut = c("40*45/120", "40*45/120", "40*45/120"))

row.names(att2) = c("Failed to complete high school",
                   "High school degree",
                   "College degree")

att2
```

Expected frequency for staying in = 25

Expected frequency for dropping out = 15
---

## Attrition Example

Plug this in for "expected frequencies"
```{r,echo=FALSE}
att3 = data.frame(StayedIn = c("(20-25)^2/25", "(25-25)^2/25", "(30-25)^2/25"),
                 DroppedOut = c("(20-15)^2/15", "(15-15)^2/15", "(10-15)^2/15"))

row.names(att3) = c("Failed to complete high school",
                   "High school degree",
                   "College degree")

att3
```

--

So we get...

```{r,echo=FALSE}
att4 = data.frame(StayedIn = c(1, 0, 1),
                 DroppedOut = c(1.666667, 0, 1.666667))

row.names(att4) = c("Failed to complete high school",
                   "High school degree",
                   "College degree")

att4
```

--

Sum them up:
```{r}
1 + 0 + 1 + 1.666667 + 0 + 1.666667
```

---
## Attrition Example

$\chi^2(?) = 5.33$

--

What is our degrees of freedom?

- $df = (r-1)(c-1)$
- $df = (3-1)(2-1)$
- $df = 2*1$
- $df = 2$

--

$\chi^2(2) = 5.33$

```{r}
pchisq(5.33, df = 2, lower.tail = FALSE)
```


---
## What's up with these df?
    
    We have 3 constraints:
    
    - The cell frequencies must sum to the overall sample size
  
  - The row totals must sum to the overall sample size
  
  - The column totals must sum to the overall sample size
  
  ---
    
    ## Assumptions
    
    Independent observations
  
  Each obseravation is in one and only one category
  
  N is large (usually taken to mean that expected N is at least 5 in each cell)
  
  ---
    
    ## Effect Sizes for Chi-Square
    
    **Odds Ratio**
    OR = number experiencing event divided by number who did not experience event.
  
  ```{r, echo=FALSE}
  att
  ```
  
  - $p(\text{Dropped Out} | <\text{high school}) = 20/40$
    - $p(\text{Dropped Out} | \text{high school}) = 15/40$
    
    
    ???
    We're going ACROSS THE ROWS to get the denominator

---

## Odds Ratio
OR = number experiencing event divided by number who did not experience event.

- Odds(Dropped Out | < High School = 20/40 = .5
- Odds(Dropped Out | High School = 15/40 = .375

--

- Odds Ratio = .5 / .375 = 1.33

*The odds of dropping out of the study rather than remaining in the study when they did not complete high school are 1.33 times the odds of dropping out if they completed high school, but not college*

---

## Rules of thumb

Cohen (1988) provided the following advice for interpreting odds ratios:

- 1.5 small
- 2.5 medium
- 4.3 large

---

## Phi Correlation

- Pearson correlation between two dichotomous variables is $\phi$
- This doesn't quite work with our attrition example, so let's look at another contingency table...

--

.small[
- Rosenstein & Horowitz (1996): Adolescent attachment and psychopathology
- Researchers were interested in whether attachment to mothers was associated with having a conduct disorder or affective disorder (clinical sample)
- Attachment:
  - Preoccupied: appear confused and entangled by attachment relationships
  - Dismissive: dismiss the importance or influence of attachment figure
- Disorder:
  - Conduct: persistent antisocial behavior that violates norms
  - Affective: major or recurrent depressive symptoms, mania, and/or mood disorders
]
---

## Attachment

```{r, echo=FALSE}
attachment = data.frame(AnyConduct = c(1, 3),
                        JustAffective = c(5,14))

row.names(attachment) = c("Dissmissive", "Preoccupied")

attachment
```

Practice:
- Work through the full chi-square test on your own time. You should get .003. See if you're right!
  - Calculate the effect size (odds ratio). You can choose what you're calculating, but note that your interpretation will change!

---

## Phi Correlation

```{r, echo=FALSE}
attachment2 = data.frame(AnyConduct = c("1 (Cell 11)", "3 (Cell 21)"),
                        JustAffective = c("5 (Cell 12)", "14 (Cell 22)"))

row.names(attachment2) = c("Dissmissive", "Preoccupied")

attachment2
```

.small[
$$\phi = \frac{Cell_{11} Cell_{22} - Cell_{12} Cell_{21}}{\sqrt{(Cell_{11} + Cell_{12})(Cell_{21} + Cell_{22})(Cell_{11} + Cell_{21})(Cell_{12} + Cell_{22})}}$$
]
---
## Phi Correlation
.small[

$$\phi = \frac{Cell_{11} Cell_{22} - Cell_{12} Cell_{21}}{\sqrt{(Cell_{11} + Cell_{12})(Cell_{21} + Cell_{22})(Cell_{11} + Cell_{21})(Cell_{12} + Cell_{22})}}$$
]

$$\phi = \frac{(1*14) - (5*3)}{\sqrt{(1+5)(3+14)(1+3)(5+14)}}$$

$$\phi = .01$$

--

OR

$$\phi = \sqrt{\frac{\chi^2}{N}}$$

---
class: inverse

## Next time

Comparing means with all the $t$-tests