
<!-- README.md is generated from README.Rmd. Please edit that file -->

# cheeseTrap

The goal of cheeseTrap is to clean data pertaining to scientific
experiments that include multiple variables (both numeric and
qualitative) describing a model organism. Specifically, this package
would be very helpful in cleaning data sets pertaining to mouse data,
where each mouse is an observation, and each variable is a descriptor
about that mouse (weight, sex, etc.) In total, our package can contains
5 functions and 4 datasets. Of those 4 datasets, 3 correspond to mouse
data from James Xenakis’ Mouse Lab and the other is survey data
collected by Vanessa Valverde.

## Installation

You can install the development version of cheeseTrap like so:

``` r
install.packages("cheeseTrap")
#> Installing package into 'C:/Users/alvlo/AppData/Local/Temp/RtmpApVsqT/temp_libpath370824995e4'
#> (as 'lib' is unspecified)
#> Warning: package 'cheeseTrap' is not available for this version of R
#> 
#> A version of this package for your version of R might be available elsewhere,
#> see the ideas at
#> https://cran.r-project.org/doc/manuals/r-patched/R-admin.html#Installing-packages
```

## Example

This is a basic example which shows you how to solve a common problem.
Note, all examples are in the context of analyzing mouse data, though
this package cold be applied to other test organisms.

``` r
library(cheeseTrap)

## Function 1: Join Comparison Function
# Function 1 allows the user to compare data from mice a two specific time points to identify any ID variable (mice) that changed from one time point to another. For example, it is often common for the sex of a mouse to be incorrectly identified at the birth timepoint and then correctdly identified at a later timepoint, after the mouse matures. Using this function will identify the change in sex of a particular mouse, given that the sex is identified within the ID variable. 

## Function 2: Non-Numeric Identification Function
# Function 2 allows the user to correct data inputs that are non-numeric but within a numeric variable. 

## Function 3: Outlier Identification Function
# Function 3 will identify outliers in the data which can be helpful to identify before conducting statistical analysis. For example, if a mice is particularly large or small, this could indicate to scientists that they should check on this mouse to ensure that it has proper cage functioning (food, water, etc) and also to possibly exlude this mouse from the data analysis. 

## Function 4: Treatment Type Function
# Function 4 will correct any typos within a categorical variable to ensure propor future user of group_by function or otherwise calling for a category within that variable.

## Function 5: Social Dominance Survey Data Function
# Function 5 will 
```

REQUIREMENTS FOR PROJECT 2!

Answers the questions: \* Why should I use this package? \* How do I
access the package? \* How do I use the package?

- README should include 1-2 examples of package/function usage. MORE
  extended examples should be placed in the vignette.
- 400-800 WORDS IN LENGTH!
