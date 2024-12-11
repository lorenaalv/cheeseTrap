
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
# run the following once
install.packages("devtools")
#> Installing package into 'C:/Users/alvlo/AppData/Local/Temp/RtmpyowWqz/temp_libpath4bf4142c2128'
#> (as 'lib' is unspecified)
#> package 'devtools' successfully unpacked and MD5 sums checked
#> 
#> The downloaded binary packages are in
#>  C:\Users\alvlo\AppData\Local\Temp\RtmpYpZrza\downloaded_packages

# then install the package
devtools::install_github("lorenaalv/cheeseTrap")
#> Using github PAT from envvar GITHUB_PAT. Use `gitcreds::gitcreds_set()` and unset GITHUB_PAT in .Renviron (or elsewhere) if you want to use the more secure git credential store instead.
#> Downloading GitHub repo lorenaalv/cheeseTrap@HEAD
#> Rcpp        (1.0.13 -> 1.0.13-1) [CRAN]
#> later       (1.3.2  -> 1.4.1   ) [CRAN]
#> fs          (1.6.4  -> 1.6.5   ) [CRAN]
#> tinytex     (0.53   -> 0.54    ) [CRAN]
#> fontawesome (0.5.2  -> 0.5.3   ) [CRAN]
#> xfun        (0.47   -> 0.49    ) [CRAN]
#> evaluate    (1.0.0  -> 1.0.1   ) [CRAN]
#> rmarkdown   (2.28   -> 2.29    ) [CRAN]
#> knitr       (1.48   -> 1.49    ) [CRAN]
#> sys         (3.4.2  -> 3.4.3   ) [CRAN]
#> askpass     (1.2.0  -> 1.2.1   ) [CRAN]
#> curl        (5.2.3  -> 6.0.1   ) [CRAN]
#> gtable      (0.3.5  -> 0.3.6   ) [CRAN]
#> promises    (1.3.0  -> 1.3.2   ) [CRAN]
#> data.table  (1.16.0 -> 1.16.4  ) [CRAN]
#> bitops      (1.0-8  -> 1.0-9   ) [CRAN]
#> Installing 16 packages: Rcpp, later, fs, tinytex, fontawesome, xfun, evaluate, rmarkdown, knitr, sys, askpass, curl, gtable, promises, data.table, bitops
#> Installing packages into 'C:/Users/alvlo/AppData/Local/Temp/RtmpyowWqz/temp_libpath4bf4142c2128'
#> (as 'lib' is unspecified)
#> package 'Rcpp' successfully unpacked and MD5 sums checked
#> package 'later' successfully unpacked and MD5 sums checked
#> package 'fs' successfully unpacked and MD5 sums checked
#> package 'tinytex' successfully unpacked and MD5 sums checked
#> package 'fontawesome' successfully unpacked and MD5 sums checked
#> package 'xfun' successfully unpacked and MD5 sums checked
#> package 'evaluate' successfully unpacked and MD5 sums checked
#> package 'rmarkdown' successfully unpacked and MD5 sums checked
#> package 'knitr' successfully unpacked and MD5 sums checked
#> package 'sys' successfully unpacked and MD5 sums checked
#> package 'askpass' successfully unpacked and MD5 sums checked
#> package 'curl' successfully unpacked and MD5 sums checked
#> package 'gtable' successfully unpacked and MD5 sums checked
#> package 'promises' successfully unpacked and MD5 sums checked
#> package 'data.table' successfully unpacked and MD5 sums checked
#> package 'bitops' successfully unpacked and MD5 sums checked
#> 
#> The downloaded binary packages are in
#>  C:\Users\alvlo\AppData\Local\Temp\RtmpYpZrza\downloaded_packages
#> ── R CMD build ─────────────────────────────────────────────────────────────────
#>          checking for file 'C:\Users\alvlo\AppData\Local\Temp\RtmpYpZrza\remotes50e85de162a\lorenaalv-cheeseTrap-2800e8f/DESCRIPTION' ...  ✔  checking for file 'C:\Users\alvlo\AppData\Local\Temp\RtmpYpZrza\remotes50e85de162a\lorenaalv-cheeseTrap-2800e8f/DESCRIPTION' (553ms)
#>       ─  preparing 'cheeseTrap': (924ms)
#>    checking DESCRIPTION meta-information ...     checking DESCRIPTION meta-information ...   ✔  checking DESCRIPTION meta-information
#>       ─  checking for LF line-endings in source and make files and shell scripts (548ms)
#>       ─  checking for empty or unneeded directories
#>       ─  building 'cheeseTrap_0.1.0.tar.gz'
#>      
#> 
#> Installing package into 'C:/Users/alvlo/AppData/Local/Temp/RtmpyowWqz/temp_libpath4bf4142c2128'
#> (as 'lib' is unspecified)
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

set_range() will look within the dataset and a specified numerical
column that has a set range of values. Non-numeric values would first be
excluded with a warning to the user of a table of these values that will
be dropped. The function then outputs a different table for the values
that are outside of the specified range.

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

The outcome dataset includes details for the outcome of using either the
Placebo or the Treatment on the mice, the data these check ins were done
by the lab, and the identifier for each mouse.

social_dominance

The social_dominance dataset includes details for questions asked in a
Qualtrics survey to a specified population. The goal of the dataset was
to gather information about how someone’s physical fitness might
influence their social dominance in the world. This data was obtained by
Vanessa Valverde from Qualtrics survey for a Political Psychology
course.

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

set_range() looks within a survey called “social_dominance” and looks
within the Q2 column, where respondents were asked how many days out of
7 days they worked out. Non-numeric values would first be excluded and
then you would be able to set the desired range of response — for
example, if you want to look at people who worked out between 1-4 days
per week.

``` r
set_range(data = social_dominance, column_name = "Q2", min_value = 1, max_value = 4)
```
