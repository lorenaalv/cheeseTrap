
<!-- README.md is generated from README.Rmd. Please edit that file -->

# cheeseTrap

The goal of cheeseTrap is to effectively flag potential data issues
within labs’ documentation of scientific experiments that include
multiple variables (both numeric and qualitative) describing a model
organism. Specifically, this package would be very helpful in cleaning
data sets pertaining to mouse data, where each mouse is an observation,
and each variable is a descriptor about that mouse (weight, sex, etc.)
In total, our package can contains 5 functions and 4 data sets. Of those
4 data sets, 3 correspond to mouse data from James Xenakis’ Mouse Lab
and the other is survey data collected by Vanessa Valverde to determine
if someone’s physical fitness dictates their social dominance.

## Installation and Access

You can install the development version of cheeseTrap like so:

``` r
install.packages("cheeseTrap")
#> Installing package into 'C:/Users/alvlo/AppData/Local/Temp/RtmpUlB0Th/temp_libpath3b5434323427'
#> (as 'lib' is unspecified)
#> Warning: package 'cheeseTrap' is not available for this version of R
#> 
#> A version of this package for your version of R might be available elsewhere,
#> see the ideas at
#> https://cran.r-project.org/doc/manuals/r-patched/R-admin.html#Installing-packages
```

To access the cheeseTrap package in an R Studio environment, load the
package by simply running the following code chunk:

``` r
library(cheeseTrap)
```

## Package Usage

Again, cheeseTrap contains 5 functions and 3 datasets.

The functions are:

join_comparison() allows the user to compare data reported at two
specific time points to identify any ID variable that changed from one
time point to another. join_comparison() takes in arguments for two
different data frames with the user inputting the variable to join on,
typically an ID identifier.

data_formatter() allows the user to flag data inputs that are
incorrectly non-numeric and are found within a quantitative variable. It
takes in arguments for a data frame and the numerical column to check
for potential data input issues. The output is a table of the
non-numeric rows that do not fit the expected data format.

outlier_detector() will identify outliers in the data, which can be
helpful to identify before conducting statistical analysis. It takes in
arguments for a data frame and a numerical column to check for potential
outliers. Then, outlier_detector() will output a table of the flagged
outliers, as well as a scatterplot of the data, giving users the freedom
to explore solutions.

typo_flagger() will correct any typos within a categorical variable to
ensure proper data management. It takes in arguments for a data frame,
the categorical column to check, and the correct inputs for the
categorical column. It will output a table of the rows of the specified
column that do not meet the expected input requirements.

set_range() will

The datasets are:

birth

The birth dataset includes details for the mice gender, body, weight,
and identifying number at birth, all assigned and reported by the lab.
This data was obtained by the James Xenakis Mouse Lab. Data entry issues
exist within this dataset for the purpose of showing function usage.

body_weight

The body_weight dataset includes measurements for mouse body weights
reported during the lab’s routine checks, as well as the mouse
identifying number and the date of the body weight check. This data was
obtained by the James Xenakis Mouse Lab. Data entry issues exist within
this dataset for the purpose of showing function usage.

outcome

The outcome dataset includes details for the

social_dominance

The social_dominance dataset includes details for the This data was
obtained by Vanessa Valverde from a survey to determine if someone’s
physical fitness dictates their social dominance.

## Examples

In the context of mouse data, it is often common for the sex of a mouse
to be incorrectly identified at the birth timepoint and then correctly
identified at a later timepoint, after the mouse matures. Using
join_comparison() will identify the change in sex of a particular mouse,
given that the sex is identified within the ID variable.

``` r
join_comparison(df1 = birth, df2 = body_weight, join_by = "ID")
```

In the context of mouse data, the researcher might mistype a character
when inputting data for a numeric mouse body weight. To flag such
issues, data_formatter() can be used to output a table of the rows where
non-numeric data is found.

``` r
data_formatter(body_weight, c("Body_Weight_1", "Body_Weight_2", "Body_Weight_3"))
```

In the context of mouse data, if a mice is particularly large or small,
this could indicate to scientists that they should check on this mouse
to ensure that it has proper cage functioning and to consider possibly
excluding this mouse from the data analysis. To detect such outliers,
outlier_detector() can be applied.

``` r
outlier_detector(data=body_weight, y_var="Body_Weight_1")
```

In the context of mouse data, typo_flagger() may be effectively used on
a column describing if the mouse received “Tmt” or “Plac”. Any spelling
errors or additional descriptors added by another team researcher would
be flagged.

``` r
typo_flagger(data = birth, column = "Treatment", correct_inputs = c("Plac", "Tmt"))
```

REQUIREMENTS FOR PROJECT 2!

Answers the questions: \* Why should I use this package? done \* How do
I access the package? done \* How do I use the package? done

- README should include 1-2 examples of package/function usage. MORE
  extended examples should be placed in the vignette.
- 400-800 WORDS IN LENGTH!

– A short description of the purpose of the package done – Necessary
background context and relevant hyperlinks done – 1-2 clear, runnable
examples of usage done – Installation instructions done
