
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
#> Installing package into 'C:/Users/alvlo/AppData/Local/Temp/RtmpUlB0Th/temp_libpath3b5463304e4b'
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
#> [1] "Rows with non-numeric values:"
#> <div id="naeklbyfbf" style="padding-left:0px;padding-right:0px;padding-top:10px;padding-bottom:10px;overflow-x:auto;overflow-y:auto;width:auto;height:auto;">
#>   <style>#naeklbyfbf table {
#>   font-family: system-ui, 'Segoe UI', Roboto, Helvetica, Arial, sans-serif, 'Apple Color Emoji', 'Segoe UI Emoji', 'Segoe UI Symbol', 'Noto Color Emoji';
#>   -webkit-font-smoothing: antialiased;
#>   -moz-osx-font-smoothing: grayscale;
#> }
#> 
#> #naeklbyfbf thead, #naeklbyfbf tbody, #naeklbyfbf tfoot, #naeklbyfbf tr, #naeklbyfbf td, #naeklbyfbf th {
#>   border-style: none;
#> }
#> 
#> #naeklbyfbf p {
#>   margin: 0;
#>   padding: 0;
#> }
#> 
#> #naeklbyfbf .gt_table {
#>   display: table;
#>   border-collapse: collapse;
#>   line-height: normal;
#>   margin-left: auto;
#>   margin-right: auto;
#>   color: #333333;
#>   font-size: 16px;
#>   font-weight: normal;
#>   font-style: normal;
#>   background-color: #FFFFFF;
#>   width: auto;
#>   border-top-style: solid;
#>   border-top-width: 2px;
#>   border-top-color: #A8A8A8;
#>   border-right-style: none;
#>   border-right-width: 2px;
#>   border-right-color: #D3D3D3;
#>   border-bottom-style: solid;
#>   border-bottom-width: 2px;
#>   border-bottom-color: #A8A8A8;
#>   border-left-style: none;
#>   border-left-width: 2px;
#>   border-left-color: #D3D3D3;
#> }
#> 
#> #naeklbyfbf .gt_caption {
#>   padding-top: 4px;
#>   padding-bottom: 4px;
#> }
#> 
#> #naeklbyfbf .gt_title {
#>   color: #333333;
#>   font-size: 125%;
#>   font-weight: initial;
#>   padding-top: 4px;
#>   padding-bottom: 4px;
#>   padding-left: 5px;
#>   padding-right: 5px;
#>   border-bottom-color: #FFFFFF;
#>   border-bottom-width: 0;
#> }
#> 
#> #naeklbyfbf .gt_subtitle {
#>   color: #333333;
#>   font-size: 85%;
#>   font-weight: initial;
#>   padding-top: 3px;
#>   padding-bottom: 5px;
#>   padding-left: 5px;
#>   padding-right: 5px;
#>   border-top-color: #FFFFFF;
#>   border-top-width: 0;
#> }
#> 
#> #naeklbyfbf .gt_heading {
#>   background-color: #FFFFFF;
#>   text-align: center;
#>   border-bottom-color: #FFFFFF;
#>   border-left-style: none;
#>   border-left-width: 1px;
#>   border-left-color: #D3D3D3;
#>   border-right-style: none;
#>   border-right-width: 1px;
#>   border-right-color: #D3D3D3;
#> }
#> 
#> #naeklbyfbf .gt_bottom_border {
#>   border-bottom-style: solid;
#>   border-bottom-width: 2px;
#>   border-bottom-color: #D3D3D3;
#> }
#> 
#> #naeklbyfbf .gt_col_headings {
#>   border-top-style: solid;
#>   border-top-width: 2px;
#>   border-top-color: #D3D3D3;
#>   border-bottom-style: solid;
#>   border-bottom-width: 2px;
#>   border-bottom-color: #D3D3D3;
#>   border-left-style: none;
#>   border-left-width: 1px;
#>   border-left-color: #D3D3D3;
#>   border-right-style: none;
#>   border-right-width: 1px;
#>   border-right-color: #D3D3D3;
#> }
#> 
#> #naeklbyfbf .gt_col_heading {
#>   color: #333333;
#>   background-color: #FFFFFF;
#>   font-size: 100%;
#>   font-weight: normal;
#>   text-transform: inherit;
#>   border-left-style: none;
#>   border-left-width: 1px;
#>   border-left-color: #D3D3D3;
#>   border-right-style: none;
#>   border-right-width: 1px;
#>   border-right-color: #D3D3D3;
#>   vertical-align: bottom;
#>   padding-top: 5px;
#>   padding-bottom: 6px;
#>   padding-left: 5px;
#>   padding-right: 5px;
#>   overflow-x: hidden;
#> }
#> 
#> #naeklbyfbf .gt_column_spanner_outer {
#>   color: #333333;
#>   background-color: #FFFFFF;
#>   font-size: 100%;
#>   font-weight: normal;
#>   text-transform: inherit;
#>   padding-top: 0;
#>   padding-bottom: 0;
#>   padding-left: 4px;
#>   padding-right: 4px;
#> }
#> 
#> #naeklbyfbf .gt_column_spanner_outer:first-child {
#>   padding-left: 0;
#> }
#> 
#> #naeklbyfbf .gt_column_spanner_outer:last-child {
#>   padding-right: 0;
#> }
#> 
#> #naeklbyfbf .gt_column_spanner {
#>   border-bottom-style: solid;
#>   border-bottom-width: 2px;
#>   border-bottom-color: #D3D3D3;
#>   vertical-align: bottom;
#>   padding-top: 5px;
#>   padding-bottom: 5px;
#>   overflow-x: hidden;
#>   display: inline-block;
#>   width: 100%;
#> }
#> 
#> #naeklbyfbf .gt_spanner_row {
#>   border-bottom-style: hidden;
#> }
#> 
#> #naeklbyfbf .gt_group_heading {
#>   padding-top: 8px;
#>   padding-bottom: 8px;
#>   padding-left: 5px;
#>   padding-right: 5px;
#>   color: #333333;
#>   background-color: #FFFFFF;
#>   font-size: 100%;
#>   font-weight: initial;
#>   text-transform: inherit;
#>   border-top-style: solid;
#>   border-top-width: 2px;
#>   border-top-color: #D3D3D3;
#>   border-bottom-style: solid;
#>   border-bottom-width: 2px;
#>   border-bottom-color: #D3D3D3;
#>   border-left-style: none;
#>   border-left-width: 1px;
#>   border-left-color: #D3D3D3;
#>   border-right-style: none;
#>   border-right-width: 1px;
#>   border-right-color: #D3D3D3;
#>   vertical-align: middle;
#>   text-align: left;
#> }
#> 
#> #naeklbyfbf .gt_empty_group_heading {
#>   padding: 0.5px;
#>   color: #333333;
#>   background-color: #FFFFFF;
#>   font-size: 100%;
#>   font-weight: initial;
#>   border-top-style: solid;
#>   border-top-width: 2px;
#>   border-top-color: #D3D3D3;
#>   border-bottom-style: solid;
#>   border-bottom-width: 2px;
#>   border-bottom-color: #D3D3D3;
#>   vertical-align: middle;
#> }
#> 
#> #naeklbyfbf .gt_from_md > :first-child {
#>   margin-top: 0;
#> }
#> 
#> #naeklbyfbf .gt_from_md > :last-child {
#>   margin-bottom: 0;
#> }
#> 
#> #naeklbyfbf .gt_row {
#>   padding-top: 8px;
#>   padding-bottom: 8px;
#>   padding-left: 5px;
#>   padding-right: 5px;
#>   margin: 10px;
#>   border-top-style: solid;
#>   border-top-width: 1px;
#>   border-top-color: #D3D3D3;
#>   border-left-style: none;
#>   border-left-width: 1px;
#>   border-left-color: #D3D3D3;
#>   border-right-style: none;
#>   border-right-width: 1px;
#>   border-right-color: #D3D3D3;
#>   vertical-align: middle;
#>   overflow-x: hidden;
#> }
#> 
#> #naeklbyfbf .gt_stub {
#>   color: #333333;
#>   background-color: #FFFFFF;
#>   font-size: 100%;
#>   font-weight: initial;
#>   text-transform: inherit;
#>   border-right-style: solid;
#>   border-right-width: 2px;
#>   border-right-color: #D3D3D3;
#>   padding-left: 5px;
#>   padding-right: 5px;
#> }
#> 
#> #naeklbyfbf .gt_stub_row_group {
#>   color: #333333;
#>   background-color: #FFFFFF;
#>   font-size: 100%;
#>   font-weight: initial;
#>   text-transform: inherit;
#>   border-right-style: solid;
#>   border-right-width: 2px;
#>   border-right-color: #D3D3D3;
#>   padding-left: 5px;
#>   padding-right: 5px;
#>   vertical-align: top;
#> }
#> 
#> #naeklbyfbf .gt_row_group_first td {
#>   border-top-width: 2px;
#> }
#> 
#> #naeklbyfbf .gt_row_group_first th {
#>   border-top-width: 2px;
#> }
#> 
#> #naeklbyfbf .gt_summary_row {
#>   color: #333333;
#>   background-color: #FFFFFF;
#>   text-transform: inherit;
#>   padding-top: 8px;
#>   padding-bottom: 8px;
#>   padding-left: 5px;
#>   padding-right: 5px;
#> }
#> 
#> #naeklbyfbf .gt_first_summary_row {
#>   border-top-style: solid;
#>   border-top-color: #D3D3D3;
#> }
#> 
#> #naeklbyfbf .gt_first_summary_row.thick {
#>   border-top-width: 2px;
#> }
#> 
#> #naeklbyfbf .gt_last_summary_row {
#>   padding-top: 8px;
#>   padding-bottom: 8px;
#>   padding-left: 5px;
#>   padding-right: 5px;
#>   border-bottom-style: solid;
#>   border-bottom-width: 2px;
#>   border-bottom-color: #D3D3D3;
#> }
#> 
#> #naeklbyfbf .gt_grand_summary_row {
#>   color: #333333;
#>   background-color: #FFFFFF;
#>   text-transform: inherit;
#>   padding-top: 8px;
#>   padding-bottom: 8px;
#>   padding-left: 5px;
#>   padding-right: 5px;
#> }
#> 
#> #naeklbyfbf .gt_first_grand_summary_row {
#>   padding-top: 8px;
#>   padding-bottom: 8px;
#>   padding-left: 5px;
#>   padding-right: 5px;
#>   border-top-style: double;
#>   border-top-width: 6px;
#>   border-top-color: #D3D3D3;
#> }
#> 
#> #naeklbyfbf .gt_last_grand_summary_row_top {
#>   padding-top: 8px;
#>   padding-bottom: 8px;
#>   padding-left: 5px;
#>   padding-right: 5px;
#>   border-bottom-style: double;
#>   border-bottom-width: 6px;
#>   border-bottom-color: #D3D3D3;
#> }
#> 
#> #naeklbyfbf .gt_striped {
#>   background-color: rgba(128, 128, 128, 0.05);
#> }
#> 
#> #naeklbyfbf .gt_table_body {
#>   border-top-style: solid;
#>   border-top-width: 2px;
#>   border-top-color: #D3D3D3;
#>   border-bottom-style: solid;
#>   border-bottom-width: 2px;
#>   border-bottom-color: #D3D3D3;
#> }
#> 
#> #naeklbyfbf .gt_footnotes {
#>   color: #333333;
#>   background-color: #FFFFFF;
#>   border-bottom-style: none;
#>   border-bottom-width: 2px;
#>   border-bottom-color: #D3D3D3;
#>   border-left-style: none;
#>   border-left-width: 2px;
#>   border-left-color: #D3D3D3;
#>   border-right-style: none;
#>   border-right-width: 2px;
#>   border-right-color: #D3D3D3;
#> }
#> 
#> #naeklbyfbf .gt_footnote {
#>   margin: 0px;
#>   font-size: 90%;
#>   padding-top: 4px;
#>   padding-bottom: 4px;
#>   padding-left: 5px;
#>   padding-right: 5px;
#> }
#> 
#> #naeklbyfbf .gt_sourcenotes {
#>   color: #333333;
#>   background-color: #FFFFFF;
#>   border-bottom-style: none;
#>   border-bottom-width: 2px;
#>   border-bottom-color: #D3D3D3;
#>   border-left-style: none;
#>   border-left-width: 2px;
#>   border-left-color: #D3D3D3;
#>   border-right-style: none;
#>   border-right-width: 2px;
#>   border-right-color: #D3D3D3;
#> }
#> 
#> #naeklbyfbf .gt_sourcenote {
#>   font-size: 90%;
#>   padding-top: 4px;
#>   padding-bottom: 4px;
#>   padding-left: 5px;
#>   padding-right: 5px;
#> }
#> 
#> #naeklbyfbf .gt_left {
#>   text-align: left;
#> }
#> 
#> #naeklbyfbf .gt_center {
#>   text-align: center;
#> }
#> 
#> #naeklbyfbf .gt_right {
#>   text-align: right;
#>   font-variant-numeric: tabular-nums;
#> }
#> 
#> #naeklbyfbf .gt_font_normal {
#>   font-weight: normal;
#> }
#> 
#> #naeklbyfbf .gt_font_bold {
#>   font-weight: bold;
#> }
#> 
#> #naeklbyfbf .gt_font_italic {
#>   font-style: italic;
#> }
#> 
#> #naeklbyfbf .gt_super {
#>   font-size: 65%;
#> }
#> 
#> #naeklbyfbf .gt_footnote_marks {
#>   font-size: 75%;
#>   vertical-align: 0.4em;
#>   position: initial;
#> }
#> 
#> #naeklbyfbf .gt_asterisk {
#>   font-size: 100%;
#>   vertical-align: 0;
#> }
#> 
#> #naeklbyfbf .gt_indent_1 {
#>   text-indent: 5px;
#> }
#> 
#> #naeklbyfbf .gt_indent_2 {
#>   text-indent: 10px;
#> }
#> 
#> #naeklbyfbf .gt_indent_3 {
#>   text-indent: 15px;
#> }
#> 
#> #naeklbyfbf .gt_indent_4 {
#>   text-indent: 20px;
#> }
#> 
#> #naeklbyfbf .gt_indent_5 {
#>   text-indent: 25px;
#> }
#> 
#> #naeklbyfbf .katex-display {
#>   display: inline-flex !important;
#>   margin-bottom: 0.75em !important;
#> }
#> 
#> #naeklbyfbf div.Reactable > div.rt-table > div.rt-thead > div.rt-tr.rt-tr-group-header > div.rt-th-group:after {
#>   height: 0px !important;
#> }
#> </style>
#>   <table class="gt_table" data-quarto-disable-processing="false" data-quarto-bootstrap="false">
#>   <thead>
#>     <tr class="gt_heading">
#>       <td colspan="2" class="gt_heading gt_title gt_font_normal gt_bottom_border" style>Rows Containing Non-Numeric Values in Q2</td>
#>     </tr>
#>     
#>     <tr class="gt_col_headings">
#>       <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1" scope="col" id="a::stub"></th>
#>       <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1" scope="col" id="Q2">Q2</th>
#>     </tr>
#>   </thead>
#>   <tbody class="gt_table_body">
#>     <tr><th id="stub_1_1" scope="row" class="gt_row gt_right gt_stub">1</th>
#> <td headers="stub_1_1 Q2" class="gt_row gt_left">6 days</td></tr>
#>     <tr><th id="stub_1_2" scope="row" class="gt_row gt_right gt_stub">2</th>
#> <td headers="stub_1_2 Q2" class="gt_row gt_left">7 days</td></tr>
#>     <tr><th id="stub_1_3" scope="row" class="gt_row gt_right gt_stub">3</th>
#> <td headers="stub_1_3 Q2" class="gt_row gt_left">4 days a week</td></tr>
#>     <tr><th id="stub_1_4" scope="row" class="gt_row gt_right gt_stub">4</th>
#> <td headers="stub_1_4 Q2" class="gt_row gt_left">3 days a week</td></tr>
#>     <tr><th id="stub_1_5" scope="row" class="gt_row gt_right gt_stub">5</th>
#> <td headers="stub_1_5 Q2" class="gt_row gt_left">every other day</td></tr>
#>     <tr><th id="stub_1_6" scope="row" class="gt_row gt_right gt_stub">6</th>
#> <td headers="stub_1_6 Q2" class="gt_row gt_left">NA</td></tr>
#>     <tr><th id="stub_1_7" scope="row" class="gt_row gt_right gt_stub">7</th>
#> <td headers="stub_1_7 Q2" class="gt_row gt_left">5 days</td></tr>
#>     <tr><th id="stub_1_8" scope="row" class="gt_row gt_right gt_stub">8</th>
#> <td headers="stub_1_8 Q2" class="gt_row gt_left">NA</td></tr>
#>     <tr><th id="stub_1_9" scope="row" class="gt_row gt_right gt_stub">9</th>
#> <td headers="stub_1_9 Q2" class="gt_row gt_left">6-7 days</td></tr>
#>     <tr><th id="stub_1_10" scope="row" class="gt_row gt_right gt_stub">10</th>
#> <td headers="stub_1_10 Q2" class="gt_row gt_left">5-7 days</td></tr>
#>     <tr><th id="stub_1_11" scope="row" class="gt_row gt_right gt_stub">11</th>
#> <td headers="stub_1_11 Q2" class="gt_row gt_left">5 days a week</td></tr>
#>     <tr><th id="stub_1_12" scope="row" class="gt_row gt_right gt_stub">12</th>
#> <td headers="stub_1_12 Q2" class="gt_row gt_left">7 days</td></tr>
#>     <tr><th id="stub_1_13" scope="row" class="gt_row gt_right gt_stub">13</th>
#> <td headers="stub_1_13 Q2" class="gt_row gt_left">NA</td></tr>
#>     <tr><th id="stub_1_14" scope="row" class="gt_row gt_right gt_stub">14</th>
#> <td headers="stub_1_14 Q2" class="gt_row gt_left">7-10</td></tr>
#>     <tr><th id="stub_1_15" scope="row" class="gt_row gt_right gt_stub">15</th>
#> <td headers="stub_1_15 Q2" class="gt_row gt_left">5 days a week</td></tr>
#>     <tr><th id="stub_1_16" scope="row" class="gt_row gt_right gt_stub">16</th>
#> <td headers="stub_1_16 Q2" class="gt_row gt_left">4 days normally, I just started College at a top school and have not had the time</td></tr>
#>     <tr><th id="stub_1_17" scope="row" class="gt_row gt_right gt_stub">17</th>
#> <td headers="stub_1_17 Q2" class="gt_row gt_left">5 Days</td></tr>
#>     <tr><th id="stub_1_18" scope="row" class="gt_row gt_right gt_stub">18</th>
#> <td headers="stub_1_18 Q2" class="gt_row gt_left">NA</td></tr>
#>   </tbody>
#>   
#>   
#> </table>
#> </div>
#> [1] "Rows where Q2 falls outside the range: 1 to 4"
#> <div id="gtbvtuodyr" style="padding-left:0px;padding-right:0px;padding-top:10px;padding-bottom:10px;overflow-x:auto;overflow-y:auto;width:auto;height:auto;">
#>   <style>#gtbvtuodyr table {
#>   font-family: system-ui, 'Segoe UI', Roboto, Helvetica, Arial, sans-serif, 'Apple Color Emoji', 'Segoe UI Emoji', 'Segoe UI Symbol', 'Noto Color Emoji';
#>   -webkit-font-smoothing: antialiased;
#>   -moz-osx-font-smoothing: grayscale;
#> }
#> 
#> #gtbvtuodyr thead, #gtbvtuodyr tbody, #gtbvtuodyr tfoot, #gtbvtuodyr tr, #gtbvtuodyr td, #gtbvtuodyr th {
#>   border-style: none;
#> }
#> 
#> #gtbvtuodyr p {
#>   margin: 0;
#>   padding: 0;
#> }
#> 
#> #gtbvtuodyr .gt_table {
#>   display: table;
#>   border-collapse: collapse;
#>   line-height: normal;
#>   margin-left: auto;
#>   margin-right: auto;
#>   color: #333333;
#>   font-size: 16px;
#>   font-weight: normal;
#>   font-style: normal;
#>   background-color: #FFFFFF;
#>   width: auto;
#>   border-top-style: solid;
#>   border-top-width: 2px;
#>   border-top-color: #A8A8A8;
#>   border-right-style: none;
#>   border-right-width: 2px;
#>   border-right-color: #D3D3D3;
#>   border-bottom-style: solid;
#>   border-bottom-width: 2px;
#>   border-bottom-color: #A8A8A8;
#>   border-left-style: none;
#>   border-left-width: 2px;
#>   border-left-color: #D3D3D3;
#> }
#> 
#> #gtbvtuodyr .gt_caption {
#>   padding-top: 4px;
#>   padding-bottom: 4px;
#> }
#> 
#> #gtbvtuodyr .gt_title {
#>   color: #333333;
#>   font-size: 125%;
#>   font-weight: initial;
#>   padding-top: 4px;
#>   padding-bottom: 4px;
#>   padding-left: 5px;
#>   padding-right: 5px;
#>   border-bottom-color: #FFFFFF;
#>   border-bottom-width: 0;
#> }
#> 
#> #gtbvtuodyr .gt_subtitle {
#>   color: #333333;
#>   font-size: 85%;
#>   font-weight: initial;
#>   padding-top: 3px;
#>   padding-bottom: 5px;
#>   padding-left: 5px;
#>   padding-right: 5px;
#>   border-top-color: #FFFFFF;
#>   border-top-width: 0;
#> }
#> 
#> #gtbvtuodyr .gt_heading {
#>   background-color: #FFFFFF;
#>   text-align: center;
#>   border-bottom-color: #FFFFFF;
#>   border-left-style: none;
#>   border-left-width: 1px;
#>   border-left-color: #D3D3D3;
#>   border-right-style: none;
#>   border-right-width: 1px;
#>   border-right-color: #D3D3D3;
#> }
#> 
#> #gtbvtuodyr .gt_bottom_border {
#>   border-bottom-style: solid;
#>   border-bottom-width: 2px;
#>   border-bottom-color: #D3D3D3;
#> }
#> 
#> #gtbvtuodyr .gt_col_headings {
#>   border-top-style: solid;
#>   border-top-width: 2px;
#>   border-top-color: #D3D3D3;
#>   border-bottom-style: solid;
#>   border-bottom-width: 2px;
#>   border-bottom-color: #D3D3D3;
#>   border-left-style: none;
#>   border-left-width: 1px;
#>   border-left-color: #D3D3D3;
#>   border-right-style: none;
#>   border-right-width: 1px;
#>   border-right-color: #D3D3D3;
#> }
#> 
#> #gtbvtuodyr .gt_col_heading {
#>   color: #333333;
#>   background-color: #FFFFFF;
#>   font-size: 100%;
#>   font-weight: normal;
#>   text-transform: inherit;
#>   border-left-style: none;
#>   border-left-width: 1px;
#>   border-left-color: #D3D3D3;
#>   border-right-style: none;
#>   border-right-width: 1px;
#>   border-right-color: #D3D3D3;
#>   vertical-align: bottom;
#>   padding-top: 5px;
#>   padding-bottom: 6px;
#>   padding-left: 5px;
#>   padding-right: 5px;
#>   overflow-x: hidden;
#> }
#> 
#> #gtbvtuodyr .gt_column_spanner_outer {
#>   color: #333333;
#>   background-color: #FFFFFF;
#>   font-size: 100%;
#>   font-weight: normal;
#>   text-transform: inherit;
#>   padding-top: 0;
#>   padding-bottom: 0;
#>   padding-left: 4px;
#>   padding-right: 4px;
#> }
#> 
#> #gtbvtuodyr .gt_column_spanner_outer:first-child {
#>   padding-left: 0;
#> }
#> 
#> #gtbvtuodyr .gt_column_spanner_outer:last-child {
#>   padding-right: 0;
#> }
#> 
#> #gtbvtuodyr .gt_column_spanner {
#>   border-bottom-style: solid;
#>   border-bottom-width: 2px;
#>   border-bottom-color: #D3D3D3;
#>   vertical-align: bottom;
#>   padding-top: 5px;
#>   padding-bottom: 5px;
#>   overflow-x: hidden;
#>   display: inline-block;
#>   width: 100%;
#> }
#> 
#> #gtbvtuodyr .gt_spanner_row {
#>   border-bottom-style: hidden;
#> }
#> 
#> #gtbvtuodyr .gt_group_heading {
#>   padding-top: 8px;
#>   padding-bottom: 8px;
#>   padding-left: 5px;
#>   padding-right: 5px;
#>   color: #333333;
#>   background-color: #FFFFFF;
#>   font-size: 100%;
#>   font-weight: initial;
#>   text-transform: inherit;
#>   border-top-style: solid;
#>   border-top-width: 2px;
#>   border-top-color: #D3D3D3;
#>   border-bottom-style: solid;
#>   border-bottom-width: 2px;
#>   border-bottom-color: #D3D3D3;
#>   border-left-style: none;
#>   border-left-width: 1px;
#>   border-left-color: #D3D3D3;
#>   border-right-style: none;
#>   border-right-width: 1px;
#>   border-right-color: #D3D3D3;
#>   vertical-align: middle;
#>   text-align: left;
#> }
#> 
#> #gtbvtuodyr .gt_empty_group_heading {
#>   padding: 0.5px;
#>   color: #333333;
#>   background-color: #FFFFFF;
#>   font-size: 100%;
#>   font-weight: initial;
#>   border-top-style: solid;
#>   border-top-width: 2px;
#>   border-top-color: #D3D3D3;
#>   border-bottom-style: solid;
#>   border-bottom-width: 2px;
#>   border-bottom-color: #D3D3D3;
#>   vertical-align: middle;
#> }
#> 
#> #gtbvtuodyr .gt_from_md > :first-child {
#>   margin-top: 0;
#> }
#> 
#> #gtbvtuodyr .gt_from_md > :last-child {
#>   margin-bottom: 0;
#> }
#> 
#> #gtbvtuodyr .gt_row {
#>   padding-top: 8px;
#>   padding-bottom: 8px;
#>   padding-left: 5px;
#>   padding-right: 5px;
#>   margin: 10px;
#>   border-top-style: solid;
#>   border-top-width: 1px;
#>   border-top-color: #D3D3D3;
#>   border-left-style: none;
#>   border-left-width: 1px;
#>   border-left-color: #D3D3D3;
#>   border-right-style: none;
#>   border-right-width: 1px;
#>   border-right-color: #D3D3D3;
#>   vertical-align: middle;
#>   overflow-x: hidden;
#> }
#> 
#> #gtbvtuodyr .gt_stub {
#>   color: #333333;
#>   background-color: #FFFFFF;
#>   font-size: 100%;
#>   font-weight: initial;
#>   text-transform: inherit;
#>   border-right-style: solid;
#>   border-right-width: 2px;
#>   border-right-color: #D3D3D3;
#>   padding-left: 5px;
#>   padding-right: 5px;
#> }
#> 
#> #gtbvtuodyr .gt_stub_row_group {
#>   color: #333333;
#>   background-color: #FFFFFF;
#>   font-size: 100%;
#>   font-weight: initial;
#>   text-transform: inherit;
#>   border-right-style: solid;
#>   border-right-width: 2px;
#>   border-right-color: #D3D3D3;
#>   padding-left: 5px;
#>   padding-right: 5px;
#>   vertical-align: top;
#> }
#> 
#> #gtbvtuodyr .gt_row_group_first td {
#>   border-top-width: 2px;
#> }
#> 
#> #gtbvtuodyr .gt_row_group_first th {
#>   border-top-width: 2px;
#> }
#> 
#> #gtbvtuodyr .gt_summary_row {
#>   color: #333333;
#>   background-color: #FFFFFF;
#>   text-transform: inherit;
#>   padding-top: 8px;
#>   padding-bottom: 8px;
#>   padding-left: 5px;
#>   padding-right: 5px;
#> }
#> 
#> #gtbvtuodyr .gt_first_summary_row {
#>   border-top-style: solid;
#>   border-top-color: #D3D3D3;
#> }
#> 
#> #gtbvtuodyr .gt_first_summary_row.thick {
#>   border-top-width: 2px;
#> }
#> 
#> #gtbvtuodyr .gt_last_summary_row {
#>   padding-top: 8px;
#>   padding-bottom: 8px;
#>   padding-left: 5px;
#>   padding-right: 5px;
#>   border-bottom-style: solid;
#>   border-bottom-width: 2px;
#>   border-bottom-color: #D3D3D3;
#> }
#> 
#> #gtbvtuodyr .gt_grand_summary_row {
#>   color: #333333;
#>   background-color: #FFFFFF;
#>   text-transform: inherit;
#>   padding-top: 8px;
#>   padding-bottom: 8px;
#>   padding-left: 5px;
#>   padding-right: 5px;
#> }
#> 
#> #gtbvtuodyr .gt_first_grand_summary_row {
#>   padding-top: 8px;
#>   padding-bottom: 8px;
#>   padding-left: 5px;
#>   padding-right: 5px;
#>   border-top-style: double;
#>   border-top-width: 6px;
#>   border-top-color: #D3D3D3;
#> }
#> 
#> #gtbvtuodyr .gt_last_grand_summary_row_top {
#>   padding-top: 8px;
#>   padding-bottom: 8px;
#>   padding-left: 5px;
#>   padding-right: 5px;
#>   border-bottom-style: double;
#>   border-bottom-width: 6px;
#>   border-bottom-color: #D3D3D3;
#> }
#> 
#> #gtbvtuodyr .gt_striped {
#>   background-color: rgba(128, 128, 128, 0.05);
#> }
#> 
#> #gtbvtuodyr .gt_table_body {
#>   border-top-style: solid;
#>   border-top-width: 2px;
#>   border-top-color: #D3D3D3;
#>   border-bottom-style: solid;
#>   border-bottom-width: 2px;
#>   border-bottom-color: #D3D3D3;
#> }
#> 
#> #gtbvtuodyr .gt_footnotes {
#>   color: #333333;
#>   background-color: #FFFFFF;
#>   border-bottom-style: none;
#>   border-bottom-width: 2px;
#>   border-bottom-color: #D3D3D3;
#>   border-left-style: none;
#>   border-left-width: 2px;
#>   border-left-color: #D3D3D3;
#>   border-right-style: none;
#>   border-right-width: 2px;
#>   border-right-color: #D3D3D3;
#> }
#> 
#> #gtbvtuodyr .gt_footnote {
#>   margin: 0px;
#>   font-size: 90%;
#>   padding-top: 4px;
#>   padding-bottom: 4px;
#>   padding-left: 5px;
#>   padding-right: 5px;
#> }
#> 
#> #gtbvtuodyr .gt_sourcenotes {
#>   color: #333333;
#>   background-color: #FFFFFF;
#>   border-bottom-style: none;
#>   border-bottom-width: 2px;
#>   border-bottom-color: #D3D3D3;
#>   border-left-style: none;
#>   border-left-width: 2px;
#>   border-left-color: #D3D3D3;
#>   border-right-style: none;
#>   border-right-width: 2px;
#>   border-right-color: #D3D3D3;
#> }
#> 
#> #gtbvtuodyr .gt_sourcenote {
#>   font-size: 90%;
#>   padding-top: 4px;
#>   padding-bottom: 4px;
#>   padding-left: 5px;
#>   padding-right: 5px;
#> }
#> 
#> #gtbvtuodyr .gt_left {
#>   text-align: left;
#> }
#> 
#> #gtbvtuodyr .gt_center {
#>   text-align: center;
#> }
#> 
#> #gtbvtuodyr .gt_right {
#>   text-align: right;
#>   font-variant-numeric: tabular-nums;
#> }
#> 
#> #gtbvtuodyr .gt_font_normal {
#>   font-weight: normal;
#> }
#> 
#> #gtbvtuodyr .gt_font_bold {
#>   font-weight: bold;
#> }
#> 
#> #gtbvtuodyr .gt_font_italic {
#>   font-style: italic;
#> }
#> 
#> #gtbvtuodyr .gt_super {
#>   font-size: 65%;
#> }
#> 
#> #gtbvtuodyr .gt_footnote_marks {
#>   font-size: 75%;
#>   vertical-align: 0.4em;
#>   position: initial;
#> }
#> 
#> #gtbvtuodyr .gt_asterisk {
#>   font-size: 100%;
#>   vertical-align: 0;
#> }
#> 
#> #gtbvtuodyr .gt_indent_1 {
#>   text-indent: 5px;
#> }
#> 
#> #gtbvtuodyr .gt_indent_2 {
#>   text-indent: 10px;
#> }
#> 
#> #gtbvtuodyr .gt_indent_3 {
#>   text-indent: 15px;
#> }
#> 
#> #gtbvtuodyr .gt_indent_4 {
#>   text-indent: 20px;
#> }
#> 
#> #gtbvtuodyr .gt_indent_5 {
#>   text-indent: 25px;
#> }
#> 
#> #gtbvtuodyr .katex-display {
#>   display: inline-flex !important;
#>   margin-bottom: 0.75em !important;
#> }
#> 
#> #gtbvtuodyr div.Reactable > div.rt-table > div.rt-thead > div.rt-tr.rt-tr-group-header > div.rt-th-group:after {
#>   height: 0px !important;
#> }
#> </style>
#>   <table class="gt_table" data-quarto-disable-processing="false" data-quarto-bootstrap="false">
#>   <thead>
#>     <tr class="gt_heading">
#>       <td colspan="26" class="gt_heading gt_title gt_font_normal gt_bottom_border" style>Observations in Q2 outside 1 to 4</td>
#>     </tr>
#>     
#>     <tr class="gt_col_headings">
#>       <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="ID">ID</th>
#>       <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="Duration..in.seconds.">Duration..in.seconds.</th>
#>       <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="Q1">Q1</th>
#>       <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="Q2">Q2</th>
#>       <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1" scope="col" id="Q3">Q3</th>
#>       <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1" scope="col" id="Q4">Q4</th>
#>       <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1" scope="col" id="Q5">Q5</th>
#>       <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1" scope="col" id="Q6">Q6</th>
#>       <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1" scope="col" id="Q7">Q7</th>
#>       <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1" scope="col" id="Intergroup_dominance_Q1">Intergroup_dominance_Q1</th>
#>       <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1" scope="col" id="Intergroup_dominance_Q2">Intergroup_dominance_Q2</th>
#>       <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1" scope="col" id="Intergroup_dominance_Q3">Intergroup_dominance_Q3</th>
#>       <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1" scope="col" id="Intergroup_dominance_Q4">Intergroup_dominance_Q4</th>
#>       <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1" scope="col" id="Intergroup_dominance_Q5">Intergroup_dominance_Q5</th>
#>       <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1" scope="col" id="Intergroup_dominance_Q6">Intergroup_dominance_Q6</th>
#>       <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1" scope="col" id="Intergroup_dominance_Q7">Intergroup_dominance_Q7</th>
#>       <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1" scope="col" id="Intergroup_dominance_Q8">Intergroup_dominance_Q8</th>
#>       <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1" scope="col" id="Antiegalitarian_Q1">Antiegalitarian_Q1</th>
#>       <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1" scope="col" id="Antiegalitarian_Q2">Antiegalitarian_Q2</th>
#>       <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1" scope="col" id="Antiegalitarian_Q3">Antiegalitarian_Q3</th>
#>       <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1" scope="col" id="Antiegalitarian_Q4">Antiegalitarian_Q4</th>
#>       <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1" scope="col" id="Antiegalitarian_Q5">Antiegalitarian_Q5</th>
#>       <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1" scope="col" id="Antiegalitarian_Q6">Antiegalitarian_Q6</th>
#>       <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1" scope="col" id="Antiegalitarian_Q7">Antiegalitarian_Q7</th>
#>       <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1" scope="col" id="Antiegalitarian_Q8">Antiegalitarian_Q8</th>
#>       <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="SC0">SC0</th>
#>     </tr>
#>   </thead>
#>   <tbody class="gt_table_body">
#>     <tr><td headers="ID" class="gt_row gt_right">1</td>
#> <td headers="Duration..in.seconds." class="gt_row gt_right">263</td>
#> <td headers="Q1" class="gt_row gt_right">9</td>
#> <td headers="Q2" class="gt_row gt_right">6</td>
#> <td headers="Q3" class="gt_row gt_left">145</td>
#> <td headers="Q4" class="gt_row gt_left">Idk</td>
#> <td headers="Q5" class="gt_row gt_left">0</td>
#> <td headers="Q6" class="gt_row gt_left">5’6”</td>
#> <td headers="Q7" class="gt_row gt_left">175</td>
#> <td headers="Intergroup_dominance_Q1" class="gt_row gt_left">Strongly Disagree</td>
#> <td headers="Intergroup_dominance_Q2" class="gt_row gt_left">Strongly Disagree</td>
#> <td headers="Intergroup_dominance_Q3" class="gt_row gt_left">Slightly Disagree</td>
#> <td headers="Intergroup_dominance_Q4" class="gt_row gt_left">Slightly Disagree</td>
#> <td headers="Intergroup_dominance_Q5" class="gt_row gt_left">Strongly Agree</td>
#> <td headers="Intergroup_dominance_Q6" class="gt_row gt_left">Somewhat Agree</td>
#> <td headers="Intergroup_dominance_Q7" class="gt_row gt_left">Strongly Agree</td>
#> <td headers="Intergroup_dominance_Q8" class="gt_row gt_left">Strongly Agree</td>
#> <td headers="Antiegalitarian_Q1" class="gt_row gt_left">Strongly Disagree</td>
#> <td headers="Antiegalitarian_Q2" class="gt_row gt_left">Strongly Disagree</td>
#> <td headers="Antiegalitarian_Q3" class="gt_row gt_left">Slightly Disagree</td>
#> <td headers="Antiegalitarian_Q4" class="gt_row gt_left">Strongly Disagree</td>
#> <td headers="Antiegalitarian_Q5" class="gt_row gt_left">Strongly Agree</td>
#> <td headers="Antiegalitarian_Q6" class="gt_row gt_left">Strongly Agree</td>
#> <td headers="Antiegalitarian_Q7" class="gt_row gt_left">Strongly Agree</td>
#> <td headers="Antiegalitarian_Q8" class="gt_row gt_left">Strongly Agree</td>
#> <td headers="SC0" class="gt_row gt_right">77</td></tr>
#>     <tr><td headers="ID" class="gt_row gt_right">4</td>
#> <td headers="Duration..in.seconds." class="gt_row gt_right">186</td>
#> <td headers="Q1" class="gt_row gt_right">NA</td>
#> <td headers="Q2" class="gt_row gt_right">6</td>
#> <td headers="Q3" class="gt_row gt_left">160</td>
#> <td headers="Q4" class="gt_row gt_left">285</td>
#> <td headers="Q5" class="gt_row gt_left">15</td>
#> <td headers="Q6" class="gt_row gt_left">68</td>
#> <td headers="Q7" class="gt_row gt_left">150</td>
#> <td headers="Intergroup_dominance_Q1" class="gt_row gt_left">Strongly Disagree</td>
#> <td headers="Intergroup_dominance_Q2" class="gt_row gt_left">Strongly Disagree</td>
#> <td headers="Intergroup_dominance_Q3" class="gt_row gt_left">Strongly Disagree</td>
#> <td headers="Intergroup_dominance_Q4" class="gt_row gt_left">Strongly Disagree</td>
#> <td headers="Intergroup_dominance_Q5" class="gt_row gt_left">Neutral</td>
#> <td headers="Intergroup_dominance_Q6" class="gt_row gt_left">Strongly Agree</td>
#> <td headers="Intergroup_dominance_Q7" class="gt_row gt_left">Strongly Agree</td>
#> <td headers="Intergroup_dominance_Q8" class="gt_row gt_left">Strongly Agree</td>
#> <td headers="Antiegalitarian_Q1" class="gt_row gt_left">Strongly Disagree</td>
#> <td headers="Antiegalitarian_Q2" class="gt_row gt_left">Strongly Disagree</td>
#> <td headers="Antiegalitarian_Q3" class="gt_row gt_left">Neutral</td>
#> <td headers="Antiegalitarian_Q4" class="gt_row gt_left">Strongly Disagree</td>
#> <td headers="Antiegalitarian_Q5" class="gt_row gt_left">Neutral</td>
#> <td headers="Antiegalitarian_Q6" class="gt_row gt_left">Neutral</td>
#> <td headers="Antiegalitarian_Q7" class="gt_row gt_left">Strongly Agree</td>
#> <td headers="Antiegalitarian_Q8" class="gt_row gt_left">Neutral</td>
#> <td headers="SC0" class="gt_row gt_right">67</td></tr>
#>     <tr><td headers="ID" class="gt_row gt_right">6</td>
#> <td headers="Duration..in.seconds." class="gt_row gt_right">443</td>
#> <td headers="Q1" class="gt_row gt_right">3</td>
#> <td headers="Q2" class="gt_row gt_right">0</td>
#> <td headers="Q3" class="gt_row gt_left">NA</td>
#> <td headers="Q4" class="gt_row gt_left">NA</td>
#> <td headers="Q5" class="gt_row gt_left">NA</td>
#> <td headers="Q6" class="gt_row gt_left">NA</td>
#> <td headers="Q7" class="gt_row gt_left">NA</td>
#> <td headers="Intergroup_dominance_Q1" class="gt_row gt_left">Somewhat Agree</td>
#> <td headers="Intergroup_dominance_Q2" class="gt_row gt_left">Somewhat Agree</td>
#> <td headers="Intergroup_dominance_Q3" class="gt_row gt_left">Slightly Agree</td>
#> <td headers="Intergroup_dominance_Q4" class="gt_row gt_left">Neutral</td>
#> <td headers="Intergroup_dominance_Q5" class="gt_row gt_left">Strongly Agree</td>
#> <td headers="Intergroup_dominance_Q6" class="gt_row gt_left">Slightly Disagree</td>
#> <td headers="Intergroup_dominance_Q7" class="gt_row gt_left">Somewhat Agree</td>
#> <td headers="Intergroup_dominance_Q8" class="gt_row gt_left">Somewhat Disagree</td>
#> <td headers="Antiegalitarian_Q1" class="gt_row gt_left">Strongly Disagree</td>
#> <td headers="Antiegalitarian_Q2" class="gt_row gt_left">Strongly Disagree</td>
#> <td headers="Antiegalitarian_Q3" class="gt_row gt_left">Somewhat Disagree</td>
#> <td headers="Antiegalitarian_Q4" class="gt_row gt_left">Strongly Disagree</td>
#> <td headers="Antiegalitarian_Q5" class="gt_row gt_left">Slightly Disagree</td>
#> <td headers="Antiegalitarian_Q6" class="gt_row gt_left">Somewhat Agree</td>
#> <td headers="Antiegalitarian_Q7" class="gt_row gt_left">Somewhat Agree</td>
#> <td headers="Antiegalitarian_Q8" class="gt_row gt_left">Somewhat Agree</td>
#> <td headers="SC0" class="gt_row gt_right">78</td></tr>
#>     <tr><td headers="ID" class="gt_row gt_right">10</td>
#> <td headers="Duration..in.seconds." class="gt_row gt_right">171</td>
#> <td headers="Q1" class="gt_row gt_right">NA</td>
#> <td headers="Q2" class="gt_row gt_right">0</td>
#> <td headers="Q3" class="gt_row gt_left">150</td>
#> <td headers="Q4" class="gt_row gt_left">245</td>
#> <td headers="Q5" class="gt_row gt_left">0</td>
#> <td headers="Q6" class="gt_row gt_left">5’2in</td>
#> <td headers="Q7" class="gt_row gt_left">225</td>
#> <td headers="Intergroup_dominance_Q1" class="gt_row gt_left">Strongly Disagree</td>
#> <td headers="Intergroup_dominance_Q2" class="gt_row gt_left">Strongly Disagree</td>
#> <td headers="Intergroup_dominance_Q3" class="gt_row gt_left">Strongly Disagree</td>
#> <td headers="Intergroup_dominance_Q4" class="gt_row gt_left">Strongly Disagree</td>
#> <td headers="Intergroup_dominance_Q5" class="gt_row gt_left">Strongly Agree</td>
#> <td headers="Intergroup_dominance_Q6" class="gt_row gt_left">Strongly Agree</td>
#> <td headers="Intergroup_dominance_Q7" class="gt_row gt_left">Strongly Agree</td>
#> <td headers="Intergroup_dominance_Q8" class="gt_row gt_left">Strongly Agree</td>
#> <td headers="Antiegalitarian_Q1" class="gt_row gt_left">Slightly Disagree</td>
#> <td headers="Antiegalitarian_Q2" class="gt_row gt_left">Slightly Disagree</td>
#> <td headers="Antiegalitarian_Q3" class="gt_row gt_left">Somewhat Disagree</td>
#> <td headers="Antiegalitarian_Q4" class="gt_row gt_left">Somewhat Agree</td>
#> <td headers="Antiegalitarian_Q5" class="gt_row gt_left">Strongly Agree</td>
#> <td headers="Antiegalitarian_Q6" class="gt_row gt_left">Strongly Agree</td>
#> <td headers="Antiegalitarian_Q7" class="gt_row gt_left">Slightly Agree</td>
#> <td headers="Antiegalitarian_Q8" class="gt_row gt_left">Somewhat Disagree</td>
#> <td headers="SC0" class="gt_row gt_right">80</td></tr>
#>     <tr><td headers="ID" class="gt_row gt_right">12</td>
#> <td headers="Duration..in.seconds." class="gt_row gt_right">313</td>
#> <td headers="Q1" class="gt_row gt_right">5</td>
#> <td headers="Q2" class="gt_row gt_right">0</td>
#> <td headers="Q3" class="gt_row gt_left">NA</td>
#> <td headers="Q4" class="gt_row gt_left">NA</td>
#> <td headers="Q5" class="gt_row gt_left">0</td>
#> <td headers="Q6" class="gt_row gt_left">5’4</td>
#> <td headers="Q7" class="gt_row gt_left">NA</td>
#> <td headers="Intergroup_dominance_Q1" class="gt_row gt_left">Strongly Disagree</td>
#> <td headers="Intergroup_dominance_Q2" class="gt_row gt_left">Strongly Disagree</td>
#> <td headers="Intergroup_dominance_Q3" class="gt_row gt_left">Strongly Disagree</td>
#> <td headers="Intergroup_dominance_Q4" class="gt_row gt_left">Strongly Disagree</td>
#> <td headers="Intergroup_dominance_Q5" class="gt_row gt_left">Strongly Agree</td>
#> <td headers="Intergroup_dominance_Q6" class="gt_row gt_left">Strongly Agree</td>
#> <td headers="Intergroup_dominance_Q7" class="gt_row gt_left">Strongly Agree</td>
#> <td headers="Intergroup_dominance_Q8" class="gt_row gt_left">Strongly Disagree</td>
#> <td headers="Antiegalitarian_Q1" class="gt_row gt_left">Strongly Disagree</td>
#> <td headers="Antiegalitarian_Q2" class="gt_row gt_left">Strongly Disagree</td>
#> <td headers="Antiegalitarian_Q3" class="gt_row gt_left">Strongly Disagree</td>
#> <td headers="Antiegalitarian_Q4" class="gt_row gt_left">Strongly Disagree</td>
#> <td headers="Antiegalitarian_Q5" class="gt_row gt_left">Somewhat Agree</td>
#> <td headers="Antiegalitarian_Q6" class="gt_row gt_left">Strongly Agree</td>
#> <td headers="Antiegalitarian_Q7" class="gt_row gt_left">Strongly Agree</td>
#> <td headers="Antiegalitarian_Q8" class="gt_row gt_left">Somewhat Agree</td>
#> <td headers="SC0" class="gt_row gt_right">67</td></tr>
#>     <tr><td headers="ID" class="gt_row gt_right">13</td>
#> <td headers="Duration..in.seconds." class="gt_row gt_right">423</td>
#> <td headers="Q1" class="gt_row gt_right">7</td>
#> <td headers="Q2" class="gt_row gt_right">5</td>
#> <td headers="Q3" class="gt_row gt_left">100</td>
#> <td headers="Q4" class="gt_row gt_left">200</td>
#> <td headers="Q5" class="gt_row gt_left">0</td>
#> <td headers="Q6" class="gt_row gt_left">73</td>
#> <td headers="Q7" class="gt_row gt_left">273</td>
#> <td headers="Intergroup_dominance_Q1" class="gt_row gt_left">Slightly Disagree</td>
#> <td headers="Intergroup_dominance_Q2" class="gt_row gt_left">Slightly Disagree</td>
#> <td headers="Intergroup_dominance_Q3" class="gt_row gt_left">Slightly Disagree</td>
#> <td headers="Intergroup_dominance_Q4" class="gt_row gt_left">Somewhat Disagree</td>
#> <td headers="Intergroup_dominance_Q5" class="gt_row gt_left">Somewhat Agree</td>
#> <td headers="Intergroup_dominance_Q6" class="gt_row gt_left">Slightly Agree</td>
#> <td headers="Intergroup_dominance_Q7" class="gt_row gt_left">Strongly Agree</td>
#> <td headers="Intergroup_dominance_Q8" class="gt_row gt_left">Somewhat Agree</td>
#> <td headers="Antiegalitarian_Q1" class="gt_row gt_left">Slightly Disagree</td>
#> <td headers="Antiegalitarian_Q2" class="gt_row gt_left">Somewhat Disagree</td>
#> <td headers="Antiegalitarian_Q3" class="gt_row gt_left">Somewhat Disagree</td>
#> <td headers="Antiegalitarian_Q4" class="gt_row gt_left">Slightly Disagree</td>
#> <td headers="Antiegalitarian_Q5" class="gt_row gt_left">Somewhat Agree</td>
#> <td headers="Antiegalitarian_Q6" class="gt_row gt_left">Slightly Agree</td>
#> <td headers="Antiegalitarian_Q7" class="gt_row gt_left">Slightly Agree</td>
#> <td headers="Antiegalitarian_Q8" class="gt_row gt_left">Somewhat Disagree</td>
#> <td headers="SC0" class="gt_row gt_right">69</td></tr>
#>     <tr><td headers="ID" class="gt_row gt_right">14</td>
#> <td headers="Duration..in.seconds." class="gt_row gt_right">223</td>
#> <td headers="Q1" class="gt_row gt_right">8</td>
#> <td headers="Q2" class="gt_row gt_right">5</td>
#> <td headers="Q3" class="gt_row gt_left">315</td>
#> <td headers="Q4" class="gt_row gt_left">395</td>
#> <td headers="Q5" class="gt_row gt_left">20</td>
#> <td headers="Q6" class="gt_row gt_left">72</td>
#> <td headers="Q7" class="gt_row gt_left">205</td>
#> <td headers="Intergroup_dominance_Q1" class="gt_row gt_left">Slightly Agree</td>
#> <td headers="Intergroup_dominance_Q2" class="gt_row gt_left">Slightly Agree</td>
#> <td headers="Intergroup_dominance_Q3" class="gt_row gt_left">Slightly Agree</td>
#> <td headers="Intergroup_dominance_Q4" class="gt_row gt_left">Somewhat Agree</td>
#> <td headers="Intergroup_dominance_Q5" class="gt_row gt_left">Strongly Agree</td>
#> <td headers="Intergroup_dominance_Q6" class="gt_row gt_left">Slightly Agree</td>
#> <td headers="Intergroup_dominance_Q7" class="gt_row gt_left">Somewhat Agree</td>
#> <td headers="Intergroup_dominance_Q8" class="gt_row gt_left">Slightly Disagree</td>
#> <td headers="Antiegalitarian_Q1" class="gt_row gt_left">Strongly Disagree</td>
#> <td headers="Antiegalitarian_Q2" class="gt_row gt_left">Somewhat Disagree</td>
#> <td headers="Antiegalitarian_Q3" class="gt_row gt_left">Somewhat Agree</td>
#> <td headers="Antiegalitarian_Q4" class="gt_row gt_left">Somewhat Disagree</td>
#> <td headers="Antiegalitarian_Q5" class="gt_row gt_left">Strongly Agree</td>
#> <td headers="Antiegalitarian_Q6" class="gt_row gt_left">Strongly Agree</td>
#> <td headers="Antiegalitarian_Q7" class="gt_row gt_left">Strongly Agree</td>
#> <td headers="Antiegalitarian_Q8" class="gt_row gt_left">Strongly Agree</td>
#> <td headers="SC0" class="gt_row gt_right">94</td></tr>
#>     <tr><td headers="ID" class="gt_row gt_right">15</td>
#> <td headers="Duration..in.seconds." class="gt_row gt_right">237</td>
#> <td headers="Q1" class="gt_row gt_right">7</td>
#> <td headers="Q2" class="gt_row gt_right">7</td>
#> <td headers="Q3" class="gt_row gt_left">315</td>
#> <td headers="Q4" class="gt_row gt_left">305</td>
#> <td headers="Q5" class="gt_row gt_left">18</td>
#> <td headers="Q6" class="gt_row gt_left">67</td>
#> <td headers="Q7" class="gt_row gt_left">185</td>
#> <td headers="Intergroup_dominance_Q1" class="gt_row gt_left">Strongly Disagree</td>
#> <td headers="Intergroup_dominance_Q2" class="gt_row gt_left">Strongly Disagree</td>
#> <td headers="Intergroup_dominance_Q3" class="gt_row gt_left">Strongly Disagree</td>
#> <td headers="Intergroup_dominance_Q4" class="gt_row gt_left">Strongly Disagree</td>
#> <td headers="Intergroup_dominance_Q5" class="gt_row gt_left">Strongly Agree</td>
#> <td headers="Intergroup_dominance_Q6" class="gt_row gt_left">Strongly Agree</td>
#> <td headers="Intergroup_dominance_Q7" class="gt_row gt_left">Strongly Agree</td>
#> <td headers="Intergroup_dominance_Q8" class="gt_row gt_left">Strongly Agree</td>
#> <td headers="Antiegalitarian_Q1" class="gt_row gt_left">Strongly Disagree</td>
#> <td headers="Antiegalitarian_Q2" class="gt_row gt_left">Strongly Disagree</td>
#> <td headers="Antiegalitarian_Q3" class="gt_row gt_left">Neutral</td>
#> <td headers="Antiegalitarian_Q4" class="gt_row gt_left">Strongly Disagree</td>
#> <td headers="Antiegalitarian_Q5" class="gt_row gt_left">Neutral</td>
#> <td headers="Antiegalitarian_Q6" class="gt_row gt_left">Neutral</td>
#> <td headers="Antiegalitarian_Q7" class="gt_row gt_left">Neutral</td>
#> <td headers="Antiegalitarian_Q8" class="gt_row gt_left">Neutral</td>
#> <td headers="SC0" class="gt_row gt_right">70</td></tr>
#>     <tr><td headers="ID" class="gt_row gt_right">16</td>
#> <td headers="Duration..in.seconds." class="gt_row gt_right">695</td>
#> <td headers="Q1" class="gt_row gt_right">6</td>
#> <td headers="Q2" class="gt_row gt_right">5</td>
#> <td headers="Q3" class="gt_row gt_left">I don't know</td>
#> <td headers="Q4" class="gt_row gt_left">I don't know</td>
#> <td headers="Q5" class="gt_row gt_left">2</td>
#> <td headers="Q6" class="gt_row gt_left">5'4"</td>
#> <td headers="Q7" class="gt_row gt_left">130</td>
#> <td headers="Intergroup_dominance_Q1" class="gt_row gt_left">Neutral</td>
#> <td headers="Intergroup_dominance_Q2" class="gt_row gt_left">Neutral</td>
#> <td headers="Intergroup_dominance_Q3" class="gt_row gt_left">Neutral</td>
#> <td headers="Intergroup_dominance_Q4" class="gt_row gt_left">Neutral</td>
#> <td headers="Intergroup_dominance_Q5" class="gt_row gt_left">Strongly Agree</td>
#> <td headers="Intergroup_dominance_Q6" class="gt_row gt_left">Neutral</td>
#> <td headers="Intergroup_dominance_Q7" class="gt_row gt_left">Neutral</td>
#> <td headers="Intergroup_dominance_Q8" class="gt_row gt_left">Slightly Disagree</td>
#> <td headers="Antiegalitarian_Q1" class="gt_row gt_left">Neutral</td>
#> <td headers="Antiegalitarian_Q2" class="gt_row gt_left">Strongly Disagree</td>
#> <td headers="Antiegalitarian_Q3" class="gt_row gt_left">Strongly Disagree</td>
#> <td headers="Antiegalitarian_Q4" class="gt_row gt_left">Strongly Disagree</td>
#> <td headers="Antiegalitarian_Q5" class="gt_row gt_left">Strongly Agree</td>
#> <td headers="Antiegalitarian_Q6" class="gt_row gt_left">Neutral</td>
#> <td headers="Antiegalitarian_Q7" class="gt_row gt_left">Strongly Agree</td>
#> <td headers="Antiegalitarian_Q8" class="gt_row gt_left">Strongly Agree</td>
#> <td headers="SC0" class="gt_row gt_right">78</td></tr>
#>     <tr><td headers="ID" class="gt_row gt_right">19</td>
#> <td headers="Duration..in.seconds." class="gt_row gt_right">171</td>
#> <td headers="Q1" class="gt_row gt_right">NA</td>
#> <td headers="Q2" class="gt_row gt_right">7</td>
#> <td headers="Q3" class="gt_row gt_left">50</td>
#> <td headers="Q4" class="gt_row gt_left">50</td>
#> <td headers="Q5" class="gt_row gt_left">1</td>
#> <td headers="Q6" class="gt_row gt_left">5’6”</td>
#> <td headers="Q7" class="gt_row gt_left">120</td>
#> <td headers="Intergroup_dominance_Q1" class="gt_row gt_left">Strongly Disagree</td>
#> <td headers="Intergroup_dominance_Q2" class="gt_row gt_left">Strongly Disagree</td>
#> <td headers="Intergroup_dominance_Q3" class="gt_row gt_left">Strongly Disagree</td>
#> <td headers="Intergroup_dominance_Q4" class="gt_row gt_left">Somewhat Disagree</td>
#> <td headers="Intergroup_dominance_Q5" class="gt_row gt_left">Strongly Agree</td>
#> <td headers="Intergroup_dominance_Q6" class="gt_row gt_left">Strongly Agree</td>
#> <td headers="Intergroup_dominance_Q7" class="gt_row gt_left">Somewhat Agree</td>
#> <td headers="Intergroup_dominance_Q8" class="gt_row gt_left">Strongly Agree</td>
#> <td headers="Antiegalitarian_Q1" class="gt_row gt_left">Strongly Disagree</td>
#> <td headers="Antiegalitarian_Q2" class="gt_row gt_left">Strongly Disagree</td>
#> <td headers="Antiegalitarian_Q3" class="gt_row gt_left">Strongly Disagree</td>
#> <td headers="Antiegalitarian_Q4" class="gt_row gt_left">Strongly Disagree</td>
#> <td headers="Antiegalitarian_Q5" class="gt_row gt_left">Strongly Agree</td>
#> <td headers="Antiegalitarian_Q6" class="gt_row gt_left">Strongly Agree</td>
#> <td headers="Antiegalitarian_Q7" class="gt_row gt_left">Strongly Agree</td>
#> <td headers="Antiegalitarian_Q8" class="gt_row gt_left">Strongly Agree</td>
#> <td headers="SC0" class="gt_row gt_right">74</td></tr>
#>     <tr><td headers="ID" class="gt_row gt_right">22</td>
#> <td headers="Duration..in.seconds." class="gt_row gt_right">480</td>
#> <td headers="Q1" class="gt_row gt_right">6</td>
#> <td headers="Q2" class="gt_row gt_right">5</td>
#> <td headers="Q3" class="gt_row gt_left">105</td>
#> <td headers="Q4" class="gt_row gt_left">125</td>
#> <td headers="Q5" class="gt_row gt_left">3</td>
#> <td headers="Q6" class="gt_row gt_left">66</td>
#> <td headers="Q7" class="gt_row gt_left">180</td>
#> <td headers="Intergroup_dominance_Q1" class="gt_row gt_left">Neutral</td>
#> <td headers="Intergroup_dominance_Q2" class="gt_row gt_left">Slightly Disagree</td>
#> <td headers="Intergroup_dominance_Q3" class="gt_row gt_left">Neutral</td>
#> <td headers="Intergroup_dominance_Q4" class="gt_row gt_left">Slightly Agree</td>
#> <td headers="Intergroup_dominance_Q5" class="gt_row gt_left">Somewhat Agree</td>
#> <td headers="Intergroup_dominance_Q6" class="gt_row gt_left">Somewhat Agree</td>
#> <td headers="Intergroup_dominance_Q7" class="gt_row gt_left">Slightly Agree</td>
#> <td headers="Intergroup_dominance_Q8" class="gt_row gt_left">Slightly Agree</td>
#> <td headers="Antiegalitarian_Q1" class="gt_row gt_left">Slightly Agree</td>
#> <td headers="Antiegalitarian_Q2" class="gt_row gt_left">Neutral</td>
#> <td headers="Antiegalitarian_Q3" class="gt_row gt_left">Slightly Disagree</td>
#> <td headers="Antiegalitarian_Q4" class="gt_row gt_left">Somewhat Agree</td>
#> <td headers="Antiegalitarian_Q5" class="gt_row gt_left">Slightly Agree</td>
#> <td headers="Antiegalitarian_Q6" class="gt_row gt_left">Somewhat Agree</td>
#> <td headers="Antiegalitarian_Q7" class="gt_row gt_left">Slightly Agree</td>
#> <td headers="Antiegalitarian_Q8" class="gt_row gt_left">Slightly Agree</td>
#> <td headers="SC0" class="gt_row gt_right">93</td></tr>
#>     <tr><td headers="ID" class="gt_row gt_right">28</td>
#> <td headers="Duration..in.seconds." class="gt_row gt_right">276</td>
#> <td headers="Q1" class="gt_row gt_right">NA</td>
#> <td headers="Q2" class="gt_row gt_right">7</td>
#> <td headers="Q3" class="gt_row gt_left">225</td>
#> <td headers="Q4" class="gt_row gt_left">325</td>
#> <td headers="Q5" class="gt_row gt_left">15</td>
#> <td headers="Q6" class="gt_row gt_left">70</td>
#> <td headers="Q7" class="gt_row gt_left">176</td>
#> <td headers="Intergroup_dominance_Q1" class="gt_row gt_left">Neutral</td>
#> <td headers="Intergroup_dominance_Q2" class="gt_row gt_left">Neutral</td>
#> <td headers="Intergroup_dominance_Q3" class="gt_row gt_left">Somewhat Disagree</td>
#> <td headers="Intergroup_dominance_Q4" class="gt_row gt_left">Neutral</td>
#> <td headers="Intergroup_dominance_Q5" class="gt_row gt_left">Slightly Disagree</td>
#> <td headers="Intergroup_dominance_Q6" class="gt_row gt_left">Slightly Agree</td>
#> <td headers="Intergroup_dominance_Q7" class="gt_row gt_left">Somewhat Agree</td>
#> <td headers="Intergroup_dominance_Q8" class="gt_row gt_left">Neutral</td>
#> <td headers="Antiegalitarian_Q1" class="gt_row gt_left">Slightly Agree</td>
#> <td headers="Antiegalitarian_Q2" class="gt_row gt_left">Neutral</td>
#> <td headers="Antiegalitarian_Q3" class="gt_row gt_left">Strongly Agree</td>
#> <td headers="Antiegalitarian_Q4" class="gt_row gt_left">Strongly Disagree</td>
#> <td headers="Antiegalitarian_Q5" class="gt_row gt_left">Strongly Disagree</td>
#> <td headers="Antiegalitarian_Q6" class="gt_row gt_left">Slightly Agree</td>
#> <td headers="Antiegalitarian_Q7" class="gt_row gt_left">Somewhat Agree</td>
#> <td headers="Antiegalitarian_Q8" class="gt_row gt_left">Neutral</td>
#> <td headers="SC0" class="gt_row gt_right">77</td></tr>
#>     <tr><td headers="ID" class="gt_row gt_right">31</td>
#> <td headers="Duration..in.seconds." class="gt_row gt_right">725</td>
#> <td headers="Q1" class="gt_row gt_right">7</td>
#> <td headers="Q2" class="gt_row gt_right">5</td>
#> <td headers="Q3" class="gt_row gt_left">20</td>
#> <td headers="Q4" class="gt_row gt_left">20</td>
#> <td headers="Q5" class="gt_row gt_left">0</td>
#> <td headers="Q6" class="gt_row gt_left">5'2</td>
#> <td headers="Q7" class="gt_row gt_left">210</td>
#> <td headers="Intergroup_dominance_Q1" class="gt_row gt_left">Slightly Disagree</td>
#> <td headers="Intergroup_dominance_Q2" class="gt_row gt_left">Strongly Agree</td>
#> <td headers="Intergroup_dominance_Q3" class="gt_row gt_left">Somewhat Agree</td>
#> <td headers="Intergroup_dominance_Q4" class="gt_row gt_left">Somewhat Agree</td>
#> <td headers="Intergroup_dominance_Q5" class="gt_row gt_left">Strongly Agree</td>
#> <td headers="Intergroup_dominance_Q6" class="gt_row gt_left">Somewhat Agree</td>
#> <td headers="Intergroup_dominance_Q7" class="gt_row gt_left">Slightly Agree</td>
#> <td headers="Intergroup_dominance_Q8" class="gt_row gt_left">Slightly Disagree</td>
#> <td headers="Antiegalitarian_Q1" class="gt_row gt_left">Neutral</td>
#> <td headers="Antiegalitarian_Q2" class="gt_row gt_left">Somewhat Agree</td>
#> <td headers="Antiegalitarian_Q3" class="gt_row gt_left">Strongly Agree</td>
#> <td headers="Antiegalitarian_Q4" class="gt_row gt_left">Strongly Disagree</td>
#> <td headers="Antiegalitarian_Q5" class="gt_row gt_left">Slightly Disagree</td>
#> <td headers="Antiegalitarian_Q6" class="gt_row gt_left">Strongly Agree</td>
#> <td headers="Antiegalitarian_Q7" class="gt_row gt_left">Strongly Agree</td>
#> <td headers="Antiegalitarian_Q8" class="gt_row gt_left">Slightly Agree</td>
#> <td headers="SC0" class="gt_row gt_right">96</td></tr>
#>     <tr><td headers="ID" class="gt_row gt_right">35</td>
#> <td headers="Duration..in.seconds." class="gt_row gt_right">221</td>
#> <td headers="Q1" class="gt_row gt_right">7</td>
#> <td headers="Q2" class="gt_row gt_right">5</td>
#> <td headers="Q3" class="gt_row gt_left">225</td>
#> <td headers="Q4" class="gt_row gt_left">360</td>
#> <td headers="Q5" class="gt_row gt_left">7</td>
#> <td headers="Q6" class="gt_row gt_left">71The two hands</td>
#> <td headers="Q7" class="gt_row gt_left">200</td>
#> <td headers="Intergroup_dominance_Q1" class="gt_row gt_left">Slightly Disagree</td>
#> <td headers="Intergroup_dominance_Q2" class="gt_row gt_left">Somewhat Disagree</td>
#> <td headers="Intergroup_dominance_Q3" class="gt_row gt_left">Somewhat Disagree</td>
#> <td headers="Intergroup_dominance_Q4" class="gt_row gt_left">Slightly Agree</td>
#> <td headers="Intergroup_dominance_Q5" class="gt_row gt_left">Somewhat Agree</td>
#> <td headers="Intergroup_dominance_Q6" class="gt_row gt_left">Somewhat Agree</td>
#> <td headers="Intergroup_dominance_Q7" class="gt_row gt_left">Slightly Agree</td>
#> <td headers="Intergroup_dominance_Q8" class="gt_row gt_left">Somewhat Agree</td>
#> <td headers="Antiegalitarian_Q1" class="gt_row gt_left">Neutral</td>
#> <td headers="Antiegalitarian_Q2" class="gt_row gt_left">Somewhat Disagree</td>
#> <td headers="Antiegalitarian_Q3" class="gt_row gt_left">Somewhat Disagree</td>
#> <td headers="Antiegalitarian_Q4" class="gt_row gt_left">Slightly Disagree</td>
#> <td headers="Antiegalitarian_Q5" class="gt_row gt_left">Slightly Agree</td>
#> <td headers="Antiegalitarian_Q6" class="gt_row gt_left">Slightly Agree</td>
#> <td headers="Antiegalitarian_Q7" class="gt_row gt_left">Slightly Agree</td>
#> <td headers="Antiegalitarian_Q8" class="gt_row gt_left">Somewhat Agree</td>
#> <td headers="SC0" class="gt_row gt_right">78</td></tr>
#>     <tr><td headers="ID" class="gt_row gt_right">36</td>
#> <td headers="Duration..in.seconds." class="gt_row gt_right">536</td>
#> <td headers="Q1" class="gt_row gt_right">5</td>
#> <td headers="Q2" class="gt_row gt_right">7</td>
#> <td headers="Q3" class="gt_row gt_left">NA</td>
#> <td headers="Q4" class="gt_row gt_left">NA</td>
#> <td headers="Q5" class="gt_row gt_left">NA</td>
#> <td headers="Q6" class="gt_row gt_left">63</td>
#> <td headers="Q7" class="gt_row gt_left">120</td>
#> <td headers="Intergroup_dominance_Q1" class="gt_row gt_left">Slightly Agree</td>
#> <td headers="Intergroup_dominance_Q2" class="gt_row gt_left">Strongly Agree</td>
#> <td headers="Intergroup_dominance_Q3" class="gt_row gt_left">Slightly Agree</td>
#> <td headers="Intergroup_dominance_Q4" class="gt_row gt_left">Strongly Agree</td>
#> <td headers="Intergroup_dominance_Q5" class="gt_row gt_left">Strongly Agree</td>
#> <td headers="Intergroup_dominance_Q6" class="gt_row gt_left">Strongly Agree</td>
#> <td headers="Intergroup_dominance_Q7" class="gt_row gt_left">Strongly Agree</td>
#> <td headers="Intergroup_dominance_Q8" class="gt_row gt_left">Somewhat Agree</td>
#> <td headers="Antiegalitarian_Q1" class="gt_row gt_left">Strongly Agree</td>
#> <td headers="Antiegalitarian_Q2" class="gt_row gt_left">Slightly Disagree</td>
#> <td headers="Antiegalitarian_Q3" class="gt_row gt_left">Slightly Disagree</td>
#> <td headers="Antiegalitarian_Q4" class="gt_row gt_left">Strongly Disagree</td>
#> <td headers="Antiegalitarian_Q5" class="gt_row gt_left">Slightly Agree</td>
#> <td headers="Antiegalitarian_Q6" class="gt_row gt_left">Slightly Agree</td>
#> <td headers="Antiegalitarian_Q7" class="gt_row gt_left">Slightly Disagree</td>
#> <td headers="Antiegalitarian_Q8" class="gt_row gt_left">Somewhat Disagree</td>
#> <td headers="SC0" class="gt_row gt_right">92</td></tr>
#>     <tr><td headers="ID" class="gt_row gt_right">40</td>
#> <td headers="Duration..in.seconds." class="gt_row gt_right">146</td>
#> <td headers="Q1" class="gt_row gt_right">6</td>
#> <td headers="Q2" class="gt_row gt_right">0</td>
#> <td headers="Q3" class="gt_row gt_left">135</td>
#> <td headers="Q4" class="gt_row gt_left">100</td>
#> <td headers="Q5" class="gt_row gt_left">1</td>
#> <td headers="Q6" class="gt_row gt_left">72</td>
#> <td headers="Q7" class="gt_row gt_left">205</td>
#> <td headers="Intergroup_dominance_Q1" class="gt_row gt_left">Neutral</td>
#> <td headers="Intergroup_dominance_Q2" class="gt_row gt_left">Neutral</td>
#> <td headers="Intergroup_dominance_Q3" class="gt_row gt_left">Neutral</td>
#> <td headers="Intergroup_dominance_Q4" class="gt_row gt_left">Neutral</td>
#> <td headers="Intergroup_dominance_Q5" class="gt_row gt_left">Neutral</td>
#> <td headers="Intergroup_dominance_Q6" class="gt_row gt_left">Neutral</td>
#> <td headers="Intergroup_dominance_Q7" class="gt_row gt_left">Neutral</td>
#> <td headers="Intergroup_dominance_Q8" class="gt_row gt_left">Neutral</td>
#> <td headers="Antiegalitarian_Q1" class="gt_row gt_left">Strongly Disagree</td>
#> <td headers="Antiegalitarian_Q2" class="gt_row gt_left">Strongly Disagree</td>
#> <td headers="Antiegalitarian_Q3" class="gt_row gt_left">Strongly Disagree</td>
#> <td headers="Antiegalitarian_Q4" class="gt_row gt_left">Strongly Disagree</td>
#> <td headers="Antiegalitarian_Q5" class="gt_row gt_left">Strongly Agree</td>
#> <td headers="Antiegalitarian_Q6" class="gt_row gt_left">Strongly Agree</td>
#> <td headers="Antiegalitarian_Q7" class="gt_row gt_left">Strongly Agree</td>
#> <td headers="Antiegalitarian_Q8" class="gt_row gt_left">Strongly Agree</td>
#> <td headers="SC0" class="gt_row gt_right">76</td></tr>
#>     <tr><td headers="ID" class="gt_row gt_right">41</td>
#> <td headers="Duration..in.seconds." class="gt_row gt_right">349</td>
#> <td headers="Q1" class="gt_row gt_right">NA</td>
#> <td headers="Q2" class="gt_row gt_right">5</td>
#> <td headers="Q3" class="gt_row gt_left">275</td>
#> <td headers="Q4" class="gt_row gt_left">400</td>
#> <td headers="Q5" class="gt_row gt_left">12</td>
#> <td headers="Q6" class="gt_row gt_left">69</td>
#> <td headers="Q7" class="gt_row gt_left">200</td>
#> <td headers="Intergroup_dominance_Q1" class="gt_row gt_left">Slightly Disagree</td>
#> <td headers="Intergroup_dominance_Q2" class="gt_row gt_left">Neutral</td>
#> <td headers="Intergroup_dominance_Q3" class="gt_row gt_left">Slightly Agree</td>
#> <td headers="Intergroup_dominance_Q4" class="gt_row gt_left">Neutral</td>
#> <td headers="Intergroup_dominance_Q5" class="gt_row gt_left">Strongly Agree</td>
#> <td headers="Intergroup_dominance_Q6" class="gt_row gt_left">Slightly Agree</td>
#> <td headers="Intergroup_dominance_Q7" class="gt_row gt_left">Slightly Agree</td>
#> <td headers="Intergroup_dominance_Q8" class="gt_row gt_left">Slightly Agree</td>
#> <td headers="Antiegalitarian_Q1" class="gt_row gt_left">Strongly Disagree</td>
#> <td headers="Antiegalitarian_Q2" class="gt_row gt_left">Strongly Disagree</td>
#> <td headers="Antiegalitarian_Q3" class="gt_row gt_left">Strongly Disagree</td>
#> <td headers="Antiegalitarian_Q4" class="gt_row gt_left">Strongly Disagree</td>
#> <td headers="Antiegalitarian_Q5" class="gt_row gt_left">Neutral</td>
#> <td headers="Antiegalitarian_Q6" class="gt_row gt_left">Somewhat Agree</td>
#> <td headers="Antiegalitarian_Q7" class="gt_row gt_left">Strongly Agree</td>
#> <td headers="Antiegalitarian_Q8" class="gt_row gt_left">Strongly Agree</td>
#> <td headers="SC0" class="gt_row gt_right">76</td></tr>
#>     <tr><td headers="ID" class="gt_row gt_right">47</td>
#> <td headers="Duration..in.seconds." class="gt_row gt_right">196</td>
#> <td headers="Q1" class="gt_row gt_right">NA</td>
#> <td headers="Q2" class="gt_row gt_right">5</td>
#> <td headers="Q3" class="gt_row gt_left">285</td>
#> <td headers="Q4" class="gt_row gt_left">300</td>
#> <td headers="Q5" class="gt_row gt_left">25</td>
#> <td headers="Q6" class="gt_row gt_left">72</td>
#> <td headers="Q7" class="gt_row gt_left">200</td>
#> <td headers="Intergroup_dominance_Q1" class="gt_row gt_left">Strongly Agree</td>
#> <td headers="Intergroup_dominance_Q2" class="gt_row gt_left">Strongly Agree</td>
#> <td headers="Intergroup_dominance_Q3" class="gt_row gt_left">Somewhat Agree</td>
#> <td headers="Intergroup_dominance_Q4" class="gt_row gt_left">Somewhat Agree</td>
#> <td headers="Intergroup_dominance_Q5" class="gt_row gt_left">Strongly Agree</td>
#> <td headers="Intergroup_dominance_Q6" class="gt_row gt_left">Slightly Disagree</td>
#> <td headers="Intergroup_dominance_Q7" class="gt_row gt_left">Strongly Agree</td>
#> <td headers="Intergroup_dominance_Q8" class="gt_row gt_left">Somewhat Disagree</td>
#> <td headers="Antiegalitarian_Q1" class="gt_row gt_left">Strongly Disagree</td>
#> <td headers="Antiegalitarian_Q2" class="gt_row gt_left">Strongly Disagree</td>
#> <td headers="Antiegalitarian_Q3" class="gt_row gt_left">Strongly Disagree</td>
#> <td headers="Antiegalitarian_Q4" class="gt_row gt_left">Strongly Disagree</td>
#> <td headers="Antiegalitarian_Q5" class="gt_row gt_left">Strongly Agree</td>
#> <td headers="Antiegalitarian_Q6" class="gt_row gt_left">Strongly Agree</td>
#> <td headers="Antiegalitarian_Q7" class="gt_row gt_left">Strongly Agree</td>
#> <td headers="Antiegalitarian_Q8" class="gt_row gt_left">Strongly Agree</td>
#> <td headers="SC0" class="gt_row gt_right">87</td></tr>
#>     <tr><td headers="ID" class="gt_row gt_right">48</td>
#> <td headers="Duration..in.seconds." class="gt_row gt_right">343</td>
#> <td headers="Q1" class="gt_row gt_right">6</td>
#> <td headers="Q2" class="gt_row gt_right">7</td>
#> <td headers="Q3" class="gt_row gt_left">150</td>
#> <td headers="Q4" class="gt_row gt_left">50</td>
#> <td headers="Q5" class="gt_row gt_left">0</td>
#> <td headers="Q6" class="gt_row gt_left">70”</td>
#> <td headers="Q7" class="gt_row gt_left">178</td>
#> <td headers="Intergroup_dominance_Q1" class="gt_row gt_left">Neutral</td>
#> <td headers="Intergroup_dominance_Q2" class="gt_row gt_left">Strongly Agree</td>
#> <td headers="Intergroup_dominance_Q3" class="gt_row gt_left">Strongly Agree</td>
#> <td headers="Intergroup_dominance_Q4" class="gt_row gt_left">Neutral</td>
#> <td headers="Intergroup_dominance_Q5" class="gt_row gt_left">Strongly Agree</td>
#> <td headers="Intergroup_dominance_Q6" class="gt_row gt_left">Neutral</td>
#> <td headers="Intergroup_dominance_Q7" class="gt_row gt_left">Slightly Agree</td>
#> <td headers="Intergroup_dominance_Q8" class="gt_row gt_left">Neutral</td>
#> <td headers="Antiegalitarian_Q1" class="gt_row gt_left">Strongly Disagree</td>
#> <td headers="Antiegalitarian_Q2" class="gt_row gt_left">Strongly Disagree</td>
#> <td headers="Antiegalitarian_Q3" class="gt_row gt_left">Strongly Disagree</td>
#> <td headers="Antiegalitarian_Q4" class="gt_row gt_left">Strongly Disagree</td>
#> <td headers="Antiegalitarian_Q5" class="gt_row gt_left">Strongly Agree</td>
#> <td headers="Antiegalitarian_Q6" class="gt_row gt_left">Strongly Agree</td>
#> <td headers="Antiegalitarian_Q7" class="gt_row gt_left">Strongly Disagree</td>
#> <td headers="Antiegalitarian_Q8" class="gt_row gt_left">Strongly Agree</td>
#> <td headers="SC0" class="gt_row gt_right">80</td></tr>
#>     <tr><td headers="ID" class="gt_row gt_right">49</td>
#> <td headers="Duration..in.seconds." class="gt_row gt_right">335</td>
#> <td headers="Q1" class="gt_row gt_right">8</td>
#> <td headers="Q2" class="gt_row gt_right">7</td>
#> <td headers="Q3" class="gt_row gt_left">225</td>
#> <td headers="Q4" class="gt_row gt_left">Idk bro</td>
#> <td headers="Q5" class="gt_row gt_left">10</td>
#> <td headers="Q6" class="gt_row gt_left">70</td>
#> <td headers="Q7" class="gt_row gt_left">170</td>
#> <td headers="Intergroup_dominance_Q1" class="gt_row gt_left">Somewhat Disagree</td>
#> <td headers="Intergroup_dominance_Q2" class="gt_row gt_left">Slightly Disagree</td>
#> <td headers="Intergroup_dominance_Q3" class="gt_row gt_left">Somewhat Disagree</td>
#> <td headers="Intergroup_dominance_Q4" class="gt_row gt_left">Somewhat Disagree</td>
#> <td headers="Intergroup_dominance_Q5" class="gt_row gt_left">Strongly Agree</td>
#> <td headers="Intergroup_dominance_Q6" class="gt_row gt_left">Somewhat Agree</td>
#> <td headers="Intergroup_dominance_Q7" class="gt_row gt_left">Strongly Agree</td>
#> <td headers="Intergroup_dominance_Q8" class="gt_row gt_left">Strongly Agree</td>
#> <td headers="Antiegalitarian_Q1" class="gt_row gt_left">Somewhat Agree</td>
#> <td headers="Antiegalitarian_Q2" class="gt_row gt_left">Somewhat Disagree</td>
#> <td headers="Antiegalitarian_Q3" class="gt_row gt_left">Slightly Disagree</td>
#> <td headers="Antiegalitarian_Q4" class="gt_row gt_left">Strongly Disagree</td>
#> <td headers="Antiegalitarian_Q5" class="gt_row gt_left">Somewhat Agree</td>
#> <td headers="Antiegalitarian_Q6" class="gt_row gt_left">Slightly Agree</td>
#> <td headers="Antiegalitarian_Q7" class="gt_row gt_left">Slightly Agree</td>
#> <td headers="Antiegalitarian_Q8" class="gt_row gt_left">Slightly Agree</td>
#> <td headers="SC0" class="gt_row gt_right">81</td></tr>
#>     <tr><td headers="ID" class="gt_row gt_right">53</td>
#> <td headers="Duration..in.seconds." class="gt_row gt_right">383</td>
#> <td headers="Q1" class="gt_row gt_right">7</td>
#> <td headers="Q2" class="gt_row gt_right">5</td>
#> <td headers="Q3" class="gt_row gt_left">175</td>
#> <td headers="Q4" class="gt_row gt_left">315</td>
#> <td headers="Q5" class="gt_row gt_left">16</td>
#> <td headers="Q6" class="gt_row gt_left">71</td>
#> <td headers="Q7" class="gt_row gt_left">175</td>
#> <td headers="Intergroup_dominance_Q1" class="gt_row gt_left">Strongly Disagree</td>
#> <td headers="Intergroup_dominance_Q2" class="gt_row gt_left">Somewhat Agree</td>
#> <td headers="Intergroup_dominance_Q3" class="gt_row gt_left">Somewhat Disagree</td>
#> <td headers="Intergroup_dominance_Q4" class="gt_row gt_left">Slightly Agree</td>
#> <td headers="Intergroup_dominance_Q5" class="gt_row gt_left">Strongly Agree</td>
#> <td headers="Intergroup_dominance_Q6" class="gt_row gt_left">Strongly Agree</td>
#> <td headers="Intergroup_dominance_Q7" class="gt_row gt_left">Slightly Disagree</td>
#> <td headers="Intergroup_dominance_Q8" class="gt_row gt_left">Slightly Agree</td>
#> <td headers="Antiegalitarian_Q1" class="gt_row gt_left">Strongly Disagree</td>
#> <td headers="Antiegalitarian_Q2" class="gt_row gt_left">Neutral</td>
#> <td headers="Antiegalitarian_Q3" class="gt_row gt_left">Slightly Disagree</td>
#> <td headers="Antiegalitarian_Q4" class="gt_row gt_left">Strongly Disagree</td>
#> <td headers="Antiegalitarian_Q5" class="gt_row gt_left">Strongly Disagree</td>
#> <td headers="Antiegalitarian_Q6" class="gt_row gt_left">Strongly Agree</td>
#> <td headers="Antiegalitarian_Q7" class="gt_row gt_left">Strongly Agree</td>
#> <td headers="Antiegalitarian_Q8" class="gt_row gt_left">Slightly Agree</td>
#> <td headers="SC0" class="gt_row gt_right">74</td></tr>
#>     <tr><td headers="ID" class="gt_row gt_right">54</td>
#> <td headers="Duration..in.seconds." class="gt_row gt_right">271</td>
#> <td headers="Q1" class="gt_row gt_right">4</td>
#> <td headers="Q2" class="gt_row gt_right">5</td>
#> <td headers="Q3" class="gt_row gt_left">60</td>
#> <td headers="Q4" class="gt_row gt_left">115</td>
#> <td headers="Q5" class="gt_row gt_left">0</td>
#> <td headers="Q6" class="gt_row gt_left">5’5</td>
#> <td headers="Q7" class="gt_row gt_left">145</td>
#> <td headers="Intergroup_dominance_Q1" class="gt_row gt_left">Neutral</td>
#> <td headers="Intergroup_dominance_Q2" class="gt_row gt_left">Somewhat Disagree</td>
#> <td headers="Intergroup_dominance_Q3" class="gt_row gt_left">Slightly Agree</td>
#> <td headers="Intergroup_dominance_Q4" class="gt_row gt_left">Somewhat Agree</td>
#> <td headers="Intergroup_dominance_Q5" class="gt_row gt_left">Strongly Agree</td>
#> <td headers="Intergroup_dominance_Q6" class="gt_row gt_left">Somewhat Agree</td>
#> <td headers="Intergroup_dominance_Q7" class="gt_row gt_left">Somewhat Agree</td>
#> <td headers="Intergroup_dominance_Q8" class="gt_row gt_left">Somewhat Disagree</td>
#> <td headers="Antiegalitarian_Q1" class="gt_row gt_left">Neutral</td>
#> <td headers="Antiegalitarian_Q2" class="gt_row gt_left">Strongly Disagree</td>
#> <td headers="Antiegalitarian_Q3" class="gt_row gt_left">Strongly Disagree</td>
#> <td headers="Antiegalitarian_Q4" class="gt_row gt_left">Strongly Disagree</td>
#> <td headers="Antiegalitarian_Q5" class="gt_row gt_left">Strongly Agree</td>
#> <td headers="Antiegalitarian_Q6" class="gt_row gt_left">Strongly Agree</td>
#> <td headers="Antiegalitarian_Q7" class="gt_row gt_left">Strongly Agree</td>
#> <td headers="Antiegalitarian_Q8" class="gt_row gt_left">Strongly Agree</td>
#> <td headers="SC0" class="gt_row gt_right">82</td></tr>
#>     <tr><td headers="ID" class="gt_row gt_right">55</td>
#> <td headers="Duration..in.seconds." class="gt_row gt_right">217</td>
#> <td headers="Q1" class="gt_row gt_right">5</td>
#> <td headers="Q2" class="gt_row gt_right">0</td>
#> <td headers="Q3" class="gt_row gt_left">50</td>
#> <td headers="Q4" class="gt_row gt_left">70</td>
#> <td headers="Q5" class="gt_row gt_left">0</td>
#> <td headers="Q6" class="gt_row gt_left">62</td>
#> <td headers="Q7" class="gt_row gt_left">140</td>
#> <td headers="Intergroup_dominance_Q1" class="gt_row gt_left">Somewhat Disagree</td>
#> <td headers="Intergroup_dominance_Q2" class="gt_row gt_left">Strongly Disagree</td>
#> <td headers="Intergroup_dominance_Q3" class="gt_row gt_left">Somewhat Disagree</td>
#> <td headers="Intergroup_dominance_Q4" class="gt_row gt_left">Slightly Agree</td>
#> <td headers="Intergroup_dominance_Q5" class="gt_row gt_left">Strongly Agree</td>
#> <td headers="Intergroup_dominance_Q6" class="gt_row gt_left">Slightly Agree</td>
#> <td headers="Intergroup_dominance_Q7" class="gt_row gt_left">Somewhat Agree</td>
#> <td headers="Intergroup_dominance_Q8" class="gt_row gt_left">Slightly Agree</td>
#> <td headers="Antiegalitarian_Q1" class="gt_row gt_left">Somewhat Disagree</td>
#> <td headers="Antiegalitarian_Q2" class="gt_row gt_left">Strongly Disagree</td>
#> <td headers="Antiegalitarian_Q3" class="gt_row gt_left">Strongly Disagree</td>
#> <td headers="Antiegalitarian_Q4" class="gt_row gt_left">Strongly Disagree</td>
#> <td headers="Antiegalitarian_Q5" class="gt_row gt_left">Strongly Disagree</td>
#> <td headers="Antiegalitarian_Q6" class="gt_row gt_left">Strongly Agree</td>
#> <td headers="Antiegalitarian_Q7" class="gt_row gt_left">Strongly Agree</td>
#> <td headers="Antiegalitarian_Q8" class="gt_row gt_left">Strongly Agree</td>
#> <td headers="SC0" class="gt_row gt_right">69</td></tr>
#>     <tr><td headers="ID" class="gt_row gt_right">57</td>
#> <td headers="Duration..in.seconds." class="gt_row gt_right">552</td>
#> <td headers="Q1" class="gt_row gt_right">9</td>
#> <td headers="Q2" class="gt_row gt_right">6</td>
#> <td headers="Q3" class="gt_row gt_left">160</td>
#> <td headers="Q4" class="gt_row gt_left">I don’t know</td>
#> <td headers="Q5" class="gt_row gt_left">About 25</td>
#> <td headers="Q6" class="gt_row gt_left">70</td>
#> <td headers="Q7" class="gt_row gt_left">176</td>
#> <td headers="Intergroup_dominance_Q1" class="gt_row gt_left">Somewhat Disagree</td>
#> <td headers="Intergroup_dominance_Q2" class="gt_row gt_left">Slightly Disagree</td>
#> <td headers="Intergroup_dominance_Q3" class="gt_row gt_left">Somewhat Disagree</td>
#> <td headers="Intergroup_dominance_Q4" class="gt_row gt_left">Slightly Disagree</td>
#> <td headers="Intergroup_dominance_Q5" class="gt_row gt_left">Somewhat Agree</td>
#> <td headers="Intergroup_dominance_Q6" class="gt_row gt_left">Somewhat Agree</td>
#> <td headers="Intergroup_dominance_Q7" class="gt_row gt_left">Somewhat Agree</td>
#> <td headers="Intergroup_dominance_Q8" class="gt_row gt_left">Somewhat Agree</td>
#> <td headers="Antiegalitarian_Q1" class="gt_row gt_left">Neutral</td>
#> <td headers="Antiegalitarian_Q2" class="gt_row gt_left">Slightly Disagree</td>
#> <td headers="Antiegalitarian_Q3" class="gt_row gt_left">Neutral</td>
#> <td headers="Antiegalitarian_Q4" class="gt_row gt_left">Slightly Disagree</td>
#> <td headers="Antiegalitarian_Q5" class="gt_row gt_left">Neutral</td>
#> <td headers="Antiegalitarian_Q6" class="gt_row gt_left">Neutral</td>
#> <td headers="Antiegalitarian_Q7" class="gt_row gt_left">Neutral</td>
#> <td headers="Antiegalitarian_Q8" class="gt_row gt_left">Neutral</td>
#> <td headers="SC0" class="gt_row gt_right">72</td></tr>
#>     <tr><td headers="ID" class="gt_row gt_right">58</td>
#> <td headers="Duration..in.seconds." class="gt_row gt_right">229</td>
#> <td headers="Q1" class="gt_row gt_right">5</td>
#> <td headers="Q2" class="gt_row gt_right">5</td>
#> <td headers="Q3" class="gt_row gt_left">95</td>
#> <td headers="Q4" class="gt_row gt_left">225</td>
#> <td headers="Q5" class="gt_row gt_left">1</td>
#> <td headers="Q6" class="gt_row gt_left">70</td>
#> <td headers="Q7" class="gt_row gt_left">158</td>
#> <td headers="Intergroup_dominance_Q1" class="gt_row gt_left">Neutral</td>
#> <td headers="Intergroup_dominance_Q2" class="gt_row gt_left">Neutral</td>
#> <td headers="Intergroup_dominance_Q3" class="gt_row gt_left">Neutral</td>
#> <td headers="Intergroup_dominance_Q4" class="gt_row gt_left">Neutral</td>
#> <td headers="Intergroup_dominance_Q5" class="gt_row gt_left">Neutral</td>
#> <td headers="Intergroup_dominance_Q6" class="gt_row gt_left">Neutral</td>
#> <td headers="Intergroup_dominance_Q7" class="gt_row gt_left">Neutral</td>
#> <td headers="Intergroup_dominance_Q8" class="gt_row gt_left">Neutral</td>
#> <td headers="Antiegalitarian_Q1" class="gt_row gt_left">Neutral</td>
#> <td headers="Antiegalitarian_Q2" class="gt_row gt_left">Neutral</td>
#> <td headers="Antiegalitarian_Q3" class="gt_row gt_left">Slightly Agree</td>
#> <td headers="Antiegalitarian_Q4" class="gt_row gt_left">Slightly Agree</td>
#> <td headers="Antiegalitarian_Q5" class="gt_row gt_left">Neutral</td>
#> <td headers="Antiegalitarian_Q6" class="gt_row gt_left">Neutral</td>
#> <td headers="Antiegalitarian_Q7" class="gt_row gt_left">Neutral</td>
#> <td headers="Antiegalitarian_Q8" class="gt_row gt_left">Neutral</td>
#> <td headers="SC0" class="gt_row gt_right">77</td></tr>
#>     <tr><td headers="ID" class="gt_row gt_right">61</td>
#> <td headers="Duration..in.seconds." class="gt_row gt_right">255</td>
#> <td headers="Q1" class="gt_row gt_right">NA</td>
#> <td headers="Q2" class="gt_row gt_right">6</td>
#> <td headers="Q3" class="gt_row gt_left">265</td>
#> <td headers="Q4" class="gt_row gt_left">445</td>
#> <td headers="Q5" class="gt_row gt_left">At least 23 ;)</td>
#> <td headers="Q6" class="gt_row gt_left">69</td>
#> <td headers="Q7" class="gt_row gt_left">185</td>
#> <td headers="Intergroup_dominance_Q1" class="gt_row gt_left">Neutral</td>
#> <td headers="Intergroup_dominance_Q2" class="gt_row gt_left">Slightly Agree</td>
#> <td headers="Intergroup_dominance_Q3" class="gt_row gt_left">Neutral</td>
#> <td headers="Intergroup_dominance_Q4" class="gt_row gt_left">Strongly Agree</td>
#> <td headers="Intergroup_dominance_Q5" class="gt_row gt_left">Neutral</td>
#> <td headers="Intergroup_dominance_Q6" class="gt_row gt_left">Neutral</td>
#> <td headers="Intergroup_dominance_Q7" class="gt_row gt_left">Neutral</td>
#> <td headers="Intergroup_dominance_Q8" class="gt_row gt_left">Somewhat Disagree</td>
#> <td headers="Antiegalitarian_Q1" class="gt_row gt_left">Neutral</td>
#> <td headers="Antiegalitarian_Q2" class="gt_row gt_left">Slightly Disagree</td>
#> <td headers="Antiegalitarian_Q3" class="gt_row gt_left">Neutral</td>
#> <td headers="Antiegalitarian_Q4" class="gt_row gt_left">Somewhat Disagree</td>
#> <td headers="Antiegalitarian_Q5" class="gt_row gt_left">Somewhat Agree</td>
#> <td headers="Antiegalitarian_Q6" class="gt_row gt_left">Slightly Disagree</td>
#> <td headers="Antiegalitarian_Q7" class="gt_row gt_left">Slightly Agree</td>
#> <td headers="Antiegalitarian_Q8" class="gt_row gt_left">Slightly Agree</td>
#> <td headers="SC0" class="gt_row gt_right">75</td></tr>
#>     <tr><td headers="ID" class="gt_row gt_right">64</td>
#> <td headers="Duration..in.seconds." class="gt_row gt_right">134</td>
#> <td headers="Q1" class="gt_row gt_right">NA</td>
#> <td headers="Q2" class="gt_row gt_right">5</td>
#> <td headers="Q3" class="gt_row gt_left">225</td>
#> <td headers="Q4" class="gt_row gt_left">275</td>
#> <td headers="Q5" class="gt_row gt_left">3</td>
#> <td headers="Q6" class="gt_row gt_left">6’0</td>
#> <td headers="Q7" class="gt_row gt_left">199</td>
#> <td headers="Intergroup_dominance_Q1" class="gt_row gt_left">Strongly Disagree</td>
#> <td headers="Intergroup_dominance_Q2" class="gt_row gt_left">Strongly Disagree</td>
#> <td headers="Intergroup_dominance_Q3" class="gt_row gt_left">Strongly Disagree</td>
#> <td headers="Intergroup_dominance_Q4" class="gt_row gt_left">Strongly Disagree</td>
#> <td headers="Intergroup_dominance_Q5" class="gt_row gt_left">Strongly Agree</td>
#> <td headers="Intergroup_dominance_Q6" class="gt_row gt_left">Strongly Agree</td>
#> <td headers="Intergroup_dominance_Q7" class="gt_row gt_left">Strongly Agree</td>
#> <td headers="Intergroup_dominance_Q8" class="gt_row gt_left">Strongly Agree</td>
#> <td headers="Antiegalitarian_Q1" class="gt_row gt_left">Strongly Disagree</td>
#> <td headers="Antiegalitarian_Q2" class="gt_row gt_left">Strongly Disagree</td>
#> <td headers="Antiegalitarian_Q3" class="gt_row gt_left">Strongly Disagree</td>
#> <td headers="Antiegalitarian_Q4" class="gt_row gt_left">Strongly Disagree</td>
#> <td headers="Antiegalitarian_Q5" class="gt_row gt_left">Strongly Disagree</td>
#> <td headers="Antiegalitarian_Q6" class="gt_row gt_left">Strongly Disagree</td>
#> <td headers="Antiegalitarian_Q7" class="gt_row gt_left">Strongly Disagree</td>
#> <td headers="Antiegalitarian_Q8" class="gt_row gt_left">Neutral</td>
#> <td headers="SC0" class="gt_row gt_right">55</td></tr>
#>     <tr><td headers="ID" class="gt_row gt_right">66</td>
#> <td headers="Duration..in.seconds." class="gt_row gt_right">357</td>
#> <td headers="Q1" class="gt_row gt_right">7</td>
#> <td headers="Q2" class="gt_row gt_right">6</td>
#> <td headers="Q3" class="gt_row gt_left">80</td>
#> <td headers="Q4" class="gt_row gt_left">225</td>
#> <td headers="Q5" class="gt_row gt_left">0</td>
#> <td headers="Q6" class="gt_row gt_left">64</td>
#> <td headers="Q7" class="gt_row gt_left">130</td>
#> <td headers="Intergroup_dominance_Q1" class="gt_row gt_left">Strongly Disagree</td>
#> <td headers="Intergroup_dominance_Q2" class="gt_row gt_left">Strongly Disagree</td>
#> <td headers="Intergroup_dominance_Q3" class="gt_row gt_left">Somewhat Disagree</td>
#> <td headers="Intergroup_dominance_Q4" class="gt_row gt_left">Somewhat Disagree</td>
#> <td headers="Intergroup_dominance_Q5" class="gt_row gt_left">Strongly Agree</td>
#> <td headers="Intergroup_dominance_Q6" class="gt_row gt_left">Strongly Agree</td>
#> <td headers="Intergroup_dominance_Q7" class="gt_row gt_left">Strongly Agree</td>
#> <td headers="Intergroup_dominance_Q8" class="gt_row gt_left">Somewhat Agree</td>
#> <td headers="Antiegalitarian_Q1" class="gt_row gt_left">Strongly Disagree</td>
#> <td headers="Antiegalitarian_Q2" class="gt_row gt_left">Strongly Disagree</td>
#> <td headers="Antiegalitarian_Q3" class="gt_row gt_left">Somewhat Disagree</td>
#> <td headers="Antiegalitarian_Q4" class="gt_row gt_left">Strongly Disagree</td>
#> <td headers="Antiegalitarian_Q5" class="gt_row gt_left">Strongly Agree</td>
#> <td headers="Antiegalitarian_Q6" class="gt_row gt_left">Slightly Agree</td>
#> <td headers="Antiegalitarian_Q7" class="gt_row gt_left">Strongly Agree</td>
#> <td headers="Antiegalitarian_Q8" class="gt_row gt_left">Strongly Agree</td>
#> <td headers="SC0" class="gt_row gt_right">73</td></tr>
#>     <tr><td headers="ID" class="gt_row gt_right">67</td>
#> <td headers="Duration..in.seconds." class="gt_row gt_right">747</td>
#> <td headers="Q1" class="gt_row gt_right">NA</td>
#> <td headers="Q2" class="gt_row gt_right">5</td>
#> <td headers="Q3" class="gt_row gt_left">700</td>
#> <td headers="Q4" class="gt_row gt_left">600</td>
#> <td headers="Q5" class="gt_row gt_left">1</td>
#> <td headers="Q6" class="gt_row gt_left">69</td>
#> <td headers="Q7" class="gt_row gt_left">300</td>
#> <td headers="Intergroup_dominance_Q1" class="gt_row gt_left">Strongly Agree</td>
#> <td headers="Intergroup_dominance_Q2" class="gt_row gt_left">Strongly Agree</td>
#> <td headers="Intergroup_dominance_Q3" class="gt_row gt_left">Strongly Agree</td>
#> <td headers="Intergroup_dominance_Q4" class="gt_row gt_left">Strongly Agree</td>
#> <td headers="Intergroup_dominance_Q5" class="gt_row gt_left">Neutral</td>
#> <td headers="Intergroup_dominance_Q6" class="gt_row gt_left">Somewhat Disagree</td>
#> <td headers="Intergroup_dominance_Q7" class="gt_row gt_left">Strongly Agree</td>
#> <td headers="Intergroup_dominance_Q8" class="gt_row gt_left">Strongly Disagree</td>
#> <td headers="Antiegalitarian_Q1" class="gt_row gt_left">Strongly Agree</td>
#> <td headers="Antiegalitarian_Q2" class="gt_row gt_left">Strongly Agree</td>
#> <td headers="Antiegalitarian_Q3" class="gt_row gt_left">Strongly Agree</td>
#> <td headers="Antiegalitarian_Q4" class="gt_row gt_left">Strongly Agree</td>
#> <td headers="Antiegalitarian_Q5" class="gt_row gt_left">Strongly Disagree</td>
#> <td headers="Antiegalitarian_Q6" class="gt_row gt_left">Strongly Disagree</td>
#> <td headers="Antiegalitarian_Q7" class="gt_row gt_left">Strongly Agree</td>
#> <td headers="Antiegalitarian_Q8" class="gt_row gt_left">Strongly Disagree</td>
#> <td headers="SC0" class="gt_row gt_right">92</td></tr>
#>     <tr><td headers="ID" class="gt_row gt_right">71</td>
#> <td headers="Duration..in.seconds." class="gt_row gt_right">139</td>
#> <td headers="Q1" class="gt_row gt_right">1</td>
#> <td headers="Q2" class="gt_row gt_right">0</td>
#> <td headers="Q3" class="gt_row gt_left">0</td>
#> <td headers="Q4" class="gt_row gt_left">0</td>
#> <td headers="Q5" class="gt_row gt_left">0</td>
#> <td headers="Q6" class="gt_row gt_left">63</td>
#> <td headers="Q7" class="gt_row gt_left">120</td>
#> <td headers="Intergroup_dominance_Q1" class="gt_row gt_left">Strongly Disagree</td>
#> <td headers="Intergroup_dominance_Q2" class="gt_row gt_left">Strongly Disagree</td>
#> <td headers="Intergroup_dominance_Q3" class="gt_row gt_left">Strongly Disagree</td>
#> <td headers="Intergroup_dominance_Q4" class="gt_row gt_left">Strongly Disagree</td>
#> <td headers="Intergroup_dominance_Q5" class="gt_row gt_left">Strongly Agree</td>
#> <td headers="Intergroup_dominance_Q6" class="gt_row gt_left">Strongly Agree</td>
#> <td headers="Intergroup_dominance_Q7" class="gt_row gt_left">Strongly Agree</td>
#> <td headers="Intergroup_dominance_Q8" class="gt_row gt_left">Strongly Agree</td>
#> <td headers="Antiegalitarian_Q1" class="gt_row gt_left">Strongly Disagree</td>
#> <td headers="Antiegalitarian_Q2" class="gt_row gt_left">Strongly Disagree</td>
#> <td headers="Antiegalitarian_Q3" class="gt_row gt_left">Strongly Disagree</td>
#> <td headers="Antiegalitarian_Q4" class="gt_row gt_left">Strongly Disagree</td>
#> <td headers="Antiegalitarian_Q5" class="gt_row gt_left">Strongly Agree</td>
#> <td headers="Antiegalitarian_Q6" class="gt_row gt_left">Strongly Agree</td>
#> <td headers="Antiegalitarian_Q7" class="gt_row gt_left">Strongly Agree</td>
#> <td headers="Antiegalitarian_Q8" class="gt_row gt_left">Strongly Agree</td>
#> <td headers="SC0" class="gt_row gt_right">71</td></tr>
#>     <tr><td headers="ID" class="gt_row gt_right">72</td>
#> <td headers="Duration..in.seconds." class="gt_row gt_right">132</td>
#> <td headers="Q1" class="gt_row gt_right">8</td>
#> <td headers="Q2" class="gt_row gt_right">6</td>
#> <td headers="Q3" class="gt_row gt_left">90</td>
#> <td headers="Q4" class="gt_row gt_left">NA</td>
#> <td headers="Q5" class="gt_row gt_left">8</td>
#> <td headers="Q6" class="gt_row gt_left">66</td>
#> <td headers="Q7" class="gt_row gt_left">120</td>
#> <td headers="Intergroup_dominance_Q1" class="gt_row gt_left">Strongly Disagree</td>
#> <td headers="Intergroup_dominance_Q2" class="gt_row gt_left">Strongly Disagree</td>
#> <td headers="Intergroup_dominance_Q3" class="gt_row gt_left">Strongly Disagree</td>
#> <td headers="Intergroup_dominance_Q4" class="gt_row gt_left">Strongly Disagree</td>
#> <td headers="Intergroup_dominance_Q5" class="gt_row gt_left">Somewhat Agree</td>
#> <td headers="Intergroup_dominance_Q6" class="gt_row gt_left">Strongly Agree</td>
#> <td headers="Intergroup_dominance_Q7" class="gt_row gt_left">Strongly Agree</td>
#> <td headers="Intergroup_dominance_Q8" class="gt_row gt_left">Strongly Agree</td>
#> <td headers="Antiegalitarian_Q1" class="gt_row gt_left">Strongly Disagree</td>
#> <td headers="Antiegalitarian_Q2" class="gt_row gt_left">Strongly Disagree</td>
#> <td headers="Antiegalitarian_Q3" class="gt_row gt_left">Somewhat Disagree</td>
#> <td headers="Antiegalitarian_Q4" class="gt_row gt_left">Strongly Disagree</td>
#> <td headers="Antiegalitarian_Q5" class="gt_row gt_left">Somewhat Agree</td>
#> <td headers="Antiegalitarian_Q6" class="gt_row gt_left">Somewhat Disagree</td>
#> <td headers="Antiegalitarian_Q7" class="gt_row gt_left">Strongly Agree</td>
#> <td headers="Antiegalitarian_Q8" class="gt_row gt_left">Strongly Agree</td>
#> <td headers="SC0" class="gt_row gt_right">67</td></tr>
#>     <tr><td headers="ID" class="gt_row gt_right">75</td>
#> <td headers="Duration..in.seconds." class="gt_row gt_right">136</td>
#> <td headers="Q1" class="gt_row gt_right">8</td>
#> <td headers="Q2" class="gt_row gt_right">5</td>
#> <td headers="Q3" class="gt_row gt_left">160</td>
#> <td headers="Q4" class="gt_row gt_left">260</td>
#> <td headers="Q5" class="gt_row gt_left">17</td>
#> <td headers="Q6" class="gt_row gt_left">65</td>
#> <td headers="Q7" class="gt_row gt_left">135</td>
#> <td headers="Intergroup_dominance_Q1" class="gt_row gt_left">Somewhat Disagree</td>
#> <td headers="Intergroup_dominance_Q2" class="gt_row gt_left">Slightly Disagree</td>
#> <td headers="Intergroup_dominance_Q3" class="gt_row gt_left">Somewhat Disagree</td>
#> <td headers="Intergroup_dominance_Q4" class="gt_row gt_left">Slightly Agree</td>
#> <td headers="Intergroup_dominance_Q5" class="gt_row gt_left">Slightly Agree</td>
#> <td headers="Intergroup_dominance_Q6" class="gt_row gt_left">Slightly Agree</td>
#> <td headers="Intergroup_dominance_Q7" class="gt_row gt_left">Somewhat Agree</td>
#> <td headers="Intergroup_dominance_Q8" class="gt_row gt_left">Slightly Agree</td>
#> <td headers="Antiegalitarian_Q1" class="gt_row gt_left">Strongly Disagree</td>
#> <td headers="Antiegalitarian_Q2" class="gt_row gt_left">Strongly Disagree</td>
#> <td headers="Antiegalitarian_Q3" class="gt_row gt_left">Somewhat Disagree</td>
#> <td headers="Antiegalitarian_Q4" class="gt_row gt_left">Strongly Disagree</td>
#> <td headers="Antiegalitarian_Q5" class="gt_row gt_left">Neutral</td>
#> <td headers="Antiegalitarian_Q6" class="gt_row gt_left">Slightly Agree</td>
#> <td headers="Antiegalitarian_Q7" class="gt_row gt_left">Somewhat Agree</td>
#> <td headers="Antiegalitarian_Q8" class="gt_row gt_left">Somewhat Agree</td>
#> <td headers="SC0" class="gt_row gt_right">71</td></tr>
#>     <tr><td headers="ID" class="gt_row gt_right">76</td>
#> <td headers="Duration..in.seconds." class="gt_row gt_right">179</td>
#> <td headers="Q1" class="gt_row gt_right">7</td>
#> <td headers="Q2" class="gt_row gt_right">7</td>
#> <td headers="Q3" class="gt_row gt_left">315</td>
#> <td headers="Q4" class="gt_row gt_left">385</td>
#> <td headers="Q5" class="gt_row gt_left">22</td>
#> <td headers="Q6" class="gt_row gt_left">69</td>
#> <td headers="Q7" class="gt_row gt_left">192</td>
#> <td headers="Intergroup_dominance_Q1" class="gt_row gt_left">Somewhat Agree</td>
#> <td headers="Intergroup_dominance_Q2" class="gt_row gt_left">Somewhat Disagree</td>
#> <td headers="Intergroup_dominance_Q3" class="gt_row gt_left">Slightly Disagree</td>
#> <td headers="Intergroup_dominance_Q4" class="gt_row gt_left">Neutral</td>
#> <td headers="Intergroup_dominance_Q5" class="gt_row gt_left">Somewhat Agree</td>
#> <td headers="Intergroup_dominance_Q6" class="gt_row gt_left">Somewhat Agree</td>
#> <td headers="Intergroup_dominance_Q7" class="gt_row gt_left">Slightly Agree</td>
#> <td headers="Intergroup_dominance_Q8" class="gt_row gt_left">Slightly Agree</td>
#> <td headers="Antiegalitarian_Q1" class="gt_row gt_left">Slightly Disagree</td>
#> <td headers="Antiegalitarian_Q2" class="gt_row gt_left">Strongly Disagree</td>
#> <td headers="Antiegalitarian_Q3" class="gt_row gt_left">Somewhat Agree</td>
#> <td headers="Antiegalitarian_Q4" class="gt_row gt_left">Somewhat Disagree</td>
#> <td headers="Antiegalitarian_Q5" class="gt_row gt_left">Somewhat Agree</td>
#> <td headers="Antiegalitarian_Q6" class="gt_row gt_left">Slightly Disagree</td>
#> <td headers="Antiegalitarian_Q7" class="gt_row gt_left">Strongly Agree</td>
#> <td headers="Antiegalitarian_Q8" class="gt_row gt_left">Slightly Disagree</td>
#> <td headers="SC0" class="gt_row gt_right">81</td></tr>
#>     <tr><td headers="ID" class="gt_row gt_right">77</td>
#> <td headers="Duration..in.seconds." class="gt_row gt_right">169</td>
#> <td headers="Q1" class="gt_row gt_right">7</td>
#> <td headers="Q2" class="gt_row gt_right">5</td>
#> <td headers="Q3" class="gt_row gt_left">135</td>
#> <td headers="Q4" class="gt_row gt_left">225</td>
#> <td headers="Q5" class="gt_row gt_left">9</td>
#> <td headers="Q6" class="gt_row gt_left">67</td>
#> <td headers="Q7" class="gt_row gt_left">150</td>
#> <td headers="Intergroup_dominance_Q1" class="gt_row gt_left">Slightly Agree</td>
#> <td headers="Intergroup_dominance_Q2" class="gt_row gt_left">Strongly Disagree</td>
#> <td headers="Intergroup_dominance_Q3" class="gt_row gt_left">Neutral</td>
#> <td headers="Intergroup_dominance_Q4" class="gt_row gt_left">Somewhat Agree</td>
#> <td headers="Intergroup_dominance_Q5" class="gt_row gt_left">Strongly Agree</td>
#> <td headers="Intergroup_dominance_Q6" class="gt_row gt_left">Strongly Agree</td>
#> <td headers="Intergroup_dominance_Q7" class="gt_row gt_left">Strongly Agree</td>
#> <td headers="Intergroup_dominance_Q8" class="gt_row gt_left">Strongly Agree</td>
#> <td headers="Antiegalitarian_Q1" class="gt_row gt_left">Slightly Disagree</td>
#> <td headers="Antiegalitarian_Q2" class="gt_row gt_left">Strongly Disagree</td>
#> <td headers="Antiegalitarian_Q3" class="gt_row gt_left">Somewhat Disagree</td>
#> <td headers="Antiegalitarian_Q4" class="gt_row gt_left">Strongly Disagree</td>
#> <td headers="Antiegalitarian_Q5" class="gt_row gt_left">Strongly Agree</td>
#> <td headers="Antiegalitarian_Q6" class="gt_row gt_left">Somewhat Agree</td>
#> <td headers="Antiegalitarian_Q7" class="gt_row gt_left">Strongly Agree</td>
#> <td headers="Antiegalitarian_Q8" class="gt_row gt_left">Somewhat Agree</td>
#> <td headers="SC0" class="gt_row gt_right">89</td></tr>
#>     <tr><td headers="ID" class="gt_row gt_right">80</td>
#> <td headers="Duration..in.seconds." class="gt_row gt_right">317</td>
#> <td headers="Q1" class="gt_row gt_right">6</td>
#> <td headers="Q2" class="gt_row gt_right">5</td>
#> <td headers="Q3" class="gt_row gt_left">80</td>
#> <td headers="Q4" class="gt_row gt_left">225</td>
#> <td headers="Q5" class="gt_row gt_left">5</td>
#> <td headers="Q6" class="gt_row gt_left">66</td>
#> <td headers="Q7" class="gt_row gt_left">150</td>
#> <td headers="Intergroup_dominance_Q1" class="gt_row gt_left">Somewhat Disagree</td>
#> <td headers="Intergroup_dominance_Q2" class="gt_row gt_left">Somewhat Disagree</td>
#> <td headers="Intergroup_dominance_Q3" class="gt_row gt_left">Strongly Disagree</td>
#> <td headers="Intergroup_dominance_Q4" class="gt_row gt_left">Slightly Agree</td>
#> <td headers="Intergroup_dominance_Q5" class="gt_row gt_left">Strongly Agree</td>
#> <td headers="Intergroup_dominance_Q6" class="gt_row gt_left">Slightly Agree</td>
#> <td headers="Intergroup_dominance_Q7" class="gt_row gt_left">Strongly Agree</td>
#> <td headers="Intergroup_dominance_Q8" class="gt_row gt_left">Neutral</td>
#> <td headers="Antiegalitarian_Q1" class="gt_row gt_left">Slightly Disagree</td>
#> <td headers="Antiegalitarian_Q2" class="gt_row gt_left">Slightly Disagree</td>
#> <td headers="Antiegalitarian_Q3" class="gt_row gt_left">Slightly Agree</td>
#> <td headers="Antiegalitarian_Q4" class="gt_row gt_left">Strongly Disagree</td>
#> <td headers="Antiegalitarian_Q5" class="gt_row gt_left">Strongly Agree</td>
#> <td headers="Antiegalitarian_Q6" class="gt_row gt_left">Strongly Agree</td>
#> <td headers="Antiegalitarian_Q7" class="gt_row gt_left">Strongly Agree</td>
#> <td headers="Antiegalitarian_Q8" class="gt_row gt_left">Somewhat Agree</td>
#> <td headers="SC0" class="gt_row gt_right">85</td></tr>
#>     <tr><td headers="ID" class="gt_row gt_right">81</td>
#> <td headers="Duration..in.seconds." class="gt_row gt_right">239</td>
#> <td headers="Q1" class="gt_row gt_right">7</td>
#> <td headers="Q2" class="gt_row gt_right">7</td>
#> <td headers="Q3" class="gt_row gt_left">240</td>
#> <td headers="Q4" class="gt_row gt_left">400</td>
#> <td headers="Q5" class="gt_row gt_left">16</td>
#> <td headers="Q6" class="gt_row gt_left">5’11</td>
#> <td headers="Q7" class="gt_row gt_left">160</td>
#> <td headers="Intergroup_dominance_Q1" class="gt_row gt_left">Strongly Agree</td>
#> <td headers="Intergroup_dominance_Q2" class="gt_row gt_left">Slightly Agree</td>
#> <td headers="Intergroup_dominance_Q3" class="gt_row gt_left">Slightly Agree</td>
#> <td headers="Intergroup_dominance_Q4" class="gt_row gt_left">Slightly Agree</td>
#> <td headers="Intergroup_dominance_Q5" class="gt_row gt_left">Neutral</td>
#> <td headers="Intergroup_dominance_Q6" class="gt_row gt_left">Slightly Disagree</td>
#> <td headers="Intergroup_dominance_Q7" class="gt_row gt_left">Slightly Disagree</td>
#> <td headers="Intergroup_dominance_Q8" class="gt_row gt_left">Slightly Disagree</td>
#> <td headers="Antiegalitarian_Q1" class="gt_row gt_left">Slightly Agree</td>
#> <td headers="Antiegalitarian_Q2" class="gt_row gt_left">Somewhat Agree</td>
#> <td headers="Antiegalitarian_Q3" class="gt_row gt_left">Somewhat Agree</td>
#> <td headers="Antiegalitarian_Q4" class="gt_row gt_left">Slightly Agree</td>
#> <td headers="Antiegalitarian_Q5" class="gt_row gt_left">Neutral</td>
#> <td headers="Antiegalitarian_Q6" class="gt_row gt_left">Slightly Disagree</td>
#> <td headers="Antiegalitarian_Q7" class="gt_row gt_left">Neutral</td>
#> <td headers="Antiegalitarian_Q8" class="gt_row gt_left">Slightly Disagree</td>
#> <td headers="SC0" class="gt_row gt_right">84</td></tr>
#>     <tr><td headers="ID" class="gt_row gt_right">82</td>
#> <td headers="Duration..in.seconds." class="gt_row gt_right">521</td>
#> <td headers="Q1" class="gt_row gt_right">10</td>
#> <td headers="Q2" class="gt_row gt_right">6</td>
#> <td headers="Q3" class="gt_row gt_left">365</td>
#> <td headers="Q4" class="gt_row gt_left">655</td>
#> <td headers="Q5" class="gt_row gt_left">32</td>
#> <td headers="Q6" class="gt_row gt_left">67</td>
#> <td headers="Q7" class="gt_row gt_left">195</td>
#> <td headers="Intergroup_dominance_Q1" class="gt_row gt_left">Somewhat Disagree</td>
#> <td headers="Intergroup_dominance_Q2" class="gt_row gt_left">Somewhat Disagree</td>
#> <td headers="Intergroup_dominance_Q3" class="gt_row gt_left">Somewhat Disagree</td>
#> <td headers="Intergroup_dominance_Q4" class="gt_row gt_left">Somewhat Disagree</td>
#> <td headers="Intergroup_dominance_Q5" class="gt_row gt_left">Strongly Agree</td>
#> <td headers="Intergroup_dominance_Q6" class="gt_row gt_left">Strongly Agree</td>
#> <td headers="Intergroup_dominance_Q7" class="gt_row gt_left">Strongly Agree</td>
#> <td headers="Intergroup_dominance_Q8" class="gt_row gt_left">Somewhat Agree</td>
#> <td headers="Antiegalitarian_Q1" class="gt_row gt_left">Strongly Disagree</td>
#> <td headers="Antiegalitarian_Q2" class="gt_row gt_left">Somewhat Disagree</td>
#> <td headers="Antiegalitarian_Q3" class="gt_row gt_left">Slightly Agree</td>
#> <td headers="Antiegalitarian_Q4" class="gt_row gt_left">Slightly Disagree</td>
#> <td headers="Antiegalitarian_Q5" class="gt_row gt_left">Strongly Agree</td>
#> <td headers="Antiegalitarian_Q6" class="gt_row gt_left">Strongly Agree</td>
#> <td headers="Antiegalitarian_Q7" class="gt_row gt_left">Strongly Agree</td>
#> <td headers="Antiegalitarian_Q8" class="gt_row gt_left">Somewhat Agree</td>
#> <td headers="SC0" class="gt_row gt_right">82</td></tr>
#>     <tr><td headers="ID" class="gt_row gt_right">84</td>
#> <td headers="Duration..in.seconds." class="gt_row gt_right">168</td>
#> <td headers="Q1" class="gt_row gt_right">7</td>
#> <td headers="Q2" class="gt_row gt_right">5</td>
#> <td headers="Q3" class="gt_row gt_left">245</td>
#> <td headers="Q4" class="gt_row gt_left">405</td>
#> <td headers="Q5" class="gt_row gt_left">12</td>
#> <td headers="Q6" class="gt_row gt_left">72</td>
#> <td headers="Q7" class="gt_row gt_left">190</td>
#> <td headers="Intergroup_dominance_Q1" class="gt_row gt_left">NA</td>
#> <td headers="Intergroup_dominance_Q2" class="gt_row gt_left">NA</td>
#> <td headers="Intergroup_dominance_Q3" class="gt_row gt_left">NA</td>
#> <td headers="Intergroup_dominance_Q4" class="gt_row gt_left">NA</td>
#> <td headers="Intergroup_dominance_Q5" class="gt_row gt_left">NA</td>
#> <td headers="Intergroup_dominance_Q6" class="gt_row gt_left">NA</td>
#> <td headers="Intergroup_dominance_Q7" class="gt_row gt_left">NA</td>
#> <td headers="Intergroup_dominance_Q8" class="gt_row gt_left">NA</td>
#> <td headers="Antiegalitarian_Q1" class="gt_row gt_left">Strongly Disagree</td>
#> <td headers="Antiegalitarian_Q2" class="gt_row gt_left">Strongly Disagree</td>
#> <td headers="Antiegalitarian_Q3" class="gt_row gt_left">Strongly Disagree</td>
#> <td headers="Antiegalitarian_Q4" class="gt_row gt_left">Strongly Disagree</td>
#> <td headers="Antiegalitarian_Q5" class="gt_row gt_left">Strongly Agree</td>
#> <td headers="Antiegalitarian_Q6" class="gt_row gt_left">Strongly Agree</td>
#> <td headers="Antiegalitarian_Q7" class="gt_row gt_left">Strongly Agree</td>
#> <td headers="Antiegalitarian_Q8" class="gt_row gt_left">Neutral</td>
#> <td headers="SC0" class="gt_row gt_right">40</td></tr>
#>     <tr><td headers="ID" class="gt_row gt_right">87</td>
#> <td headers="Duration..in.seconds." class="gt_row gt_right">271</td>
#> <td headers="Q1" class="gt_row gt_right">NA</td>
#> <td headers="Q2" class="gt_row gt_right">7</td>
#> <td headers="Q3" class="gt_row gt_left">315</td>
#> <td headers="Q4" class="gt_row gt_left">415</td>
#> <td headers="Q5" class="gt_row gt_left">28</td>
#> <td headers="Q6" class="gt_row gt_left">73</td>
#> <td headers="Q7" class="gt_row gt_left">212</td>
#> <td headers="Intergroup_dominance_Q1" class="gt_row gt_left">Strongly Disagree</td>
#> <td headers="Intergroup_dominance_Q2" class="gt_row gt_left">Somewhat Disagree</td>
#> <td headers="Intergroup_dominance_Q3" class="gt_row gt_left">Strongly Disagree</td>
#> <td headers="Intergroup_dominance_Q4" class="gt_row gt_left">Slightly Disagree</td>
#> <td headers="Intergroup_dominance_Q5" class="gt_row gt_left">Strongly Agree</td>
#> <td headers="Intergroup_dominance_Q6" class="gt_row gt_left">Somewhat Agree</td>
#> <td headers="Intergroup_dominance_Q7" class="gt_row gt_left">Somewhat Agree</td>
#> <td headers="Intergroup_dominance_Q8" class="gt_row gt_left">Somewhat Agree</td>
#> <td headers="Antiegalitarian_Q1" class="gt_row gt_left">Somewhat Disagree</td>
#> <td headers="Antiegalitarian_Q2" class="gt_row gt_left">Somewhat Disagree</td>
#> <td headers="Antiegalitarian_Q3" class="gt_row gt_left">Slightly Disagree</td>
#> <td headers="Antiegalitarian_Q4" class="gt_row gt_left">Strongly Disagree</td>
#> <td headers="Antiegalitarian_Q5" class="gt_row gt_left">Somewhat Agree</td>
#> <td headers="Antiegalitarian_Q6" class="gt_row gt_left">Somewhat Agree</td>
#> <td headers="Antiegalitarian_Q7" class="gt_row gt_left">Somewhat Agree</td>
#> <td headers="Antiegalitarian_Q8" class="gt_row gt_left">Somewhat Agree</td>
#> <td headers="SC0" class="gt_row gt_right">74</td></tr>
#>     <tr><td headers="ID" class="gt_row gt_right">88</td>
#> <td headers="Duration..in.seconds." class="gt_row gt_right">176</td>
#> <td headers="Q1" class="gt_row gt_right">NA</td>
#> <td headers="Q2" class="gt_row gt_right">0</td>
#> <td headers="Q3" class="gt_row gt_left">Idk</td>
#> <td headers="Q4" class="gt_row gt_left">Idk</td>
#> <td headers="Q5" class="gt_row gt_left">Idk</td>
#> <td headers="Q6" class="gt_row gt_left">5’ 3”</td>
#> <td headers="Q7" class="gt_row gt_left">125 lbs</td>
#> <td headers="Intergroup_dominance_Q1" class="gt_row gt_left">Strongly Disagree</td>
#> <td headers="Intergroup_dominance_Q2" class="gt_row gt_left">Strongly Agree</td>
#> <td headers="Intergroup_dominance_Q3" class="gt_row gt_left">Strongly Disagree</td>
#> <td headers="Intergroup_dominance_Q4" class="gt_row gt_left">Strongly Disagree</td>
#> <td headers="Intergroup_dominance_Q5" class="gt_row gt_left">Strongly Agree</td>
#> <td headers="Intergroup_dominance_Q6" class="gt_row gt_left">Strongly Agree</td>
#> <td headers="Intergroup_dominance_Q7" class="gt_row gt_left">Strongly Agree</td>
#> <td headers="Intergroup_dominance_Q8" class="gt_row gt_left">Strongly Agree</td>
#> <td headers="Antiegalitarian_Q1" class="gt_row gt_left">Strongly Disagree</td>
#> <td headers="Antiegalitarian_Q2" class="gt_row gt_left">Strongly Disagree</td>
#> <td headers="Antiegalitarian_Q3" class="gt_row gt_left">Strongly Disagree</td>
#> <td headers="Antiegalitarian_Q4" class="gt_row gt_left">Strongly Disagree</td>
#> <td headers="Antiegalitarian_Q5" class="gt_row gt_left">Strongly Disagree</td>
#> <td headers="Antiegalitarian_Q6" class="gt_row gt_left">Strongly Agree</td>
#> <td headers="Antiegalitarian_Q7" class="gt_row gt_left">Strongly Agree</td>
#> <td headers="Antiegalitarian_Q8" class="gt_row gt_left">Strongly Agree</td>
#> <td headers="SC0" class="gt_row gt_right">73</td></tr>
#>     <tr><td headers="ID" class="gt_row gt_right">91</td>
#> <td headers="Duration..in.seconds." class="gt_row gt_right">229</td>
#> <td headers="Q1" class="gt_row gt_right">8</td>
#> <td headers="Q2" class="gt_row gt_right">5</td>
#> <td headers="Q3" class="gt_row gt_left">200</td>
#> <td headers="Q4" class="gt_row gt_left">345</td>
#> <td headers="Q5" class="gt_row gt_left">20</td>
#> <td headers="Q6" class="gt_row gt_left">70</td>
#> <td headers="Q7" class="gt_row gt_left">200</td>
#> <td headers="Intergroup_dominance_Q1" class="gt_row gt_left">Strongly Disagree</td>
#> <td headers="Intergroup_dominance_Q2" class="gt_row gt_left">Strongly Agree</td>
#> <td headers="Intergroup_dominance_Q3" class="gt_row gt_left">Strongly Disagree</td>
#> <td headers="Intergroup_dominance_Q4" class="gt_row gt_left">Somewhat Disagree</td>
#> <td headers="Intergroup_dominance_Q5" class="gt_row gt_left">Strongly Agree</td>
#> <td headers="Intergroup_dominance_Q6" class="gt_row gt_left">Somewhat Agree</td>
#> <td headers="Intergroup_dominance_Q7" class="gt_row gt_left">Strongly Agree</td>
#> <td headers="Intergroup_dominance_Q8" class="gt_row gt_left">Somewhat Agree</td>
#> <td headers="Antiegalitarian_Q1" class="gt_row gt_left">Strongly Agree</td>
#> <td headers="Antiegalitarian_Q2" class="gt_row gt_left">Somewhat Disagree</td>
#> <td headers="Antiegalitarian_Q3" class="gt_row gt_left">Strongly Agree</td>
#> <td headers="Antiegalitarian_Q4" class="gt_row gt_left">Slightly Agree</td>
#> <td headers="Antiegalitarian_Q5" class="gt_row gt_left">Neutral</td>
#> <td headers="Antiegalitarian_Q6" class="gt_row gt_left">Somewhat Disagree</td>
#> <td headers="Antiegalitarian_Q7" class="gt_row gt_left">Somewhat Agree</td>
#> <td headers="Antiegalitarian_Q8" class="gt_row gt_left">Neutral</td>
#> <td headers="SC0" class="gt_row gt_right">88</td></tr>
#>     <tr><td headers="ID" class="gt_row gt_right">93</td>
#> <td headers="Duration..in.seconds." class="gt_row gt_right">324</td>
#> <td headers="Q1" class="gt_row gt_right">8</td>
#> <td headers="Q2" class="gt_row gt_right">6</td>
#> <td headers="Q3" class="gt_row gt_left">250</td>
#> <td headers="Q4" class="gt_row gt_left">400</td>
#> <td headers="Q5" class="gt_row gt_left">20</td>
#> <td headers="Q6" class="gt_row gt_left">69</td>
#> <td headers="Q7" class="gt_row gt_left">140</td>
#> <td headers="Intergroup_dominance_Q1" class="gt_row gt_left">Strongly Agree</td>
#> <td headers="Intergroup_dominance_Q2" class="gt_row gt_left">Slightly Agree</td>
#> <td headers="Intergroup_dominance_Q3" class="gt_row gt_left">Strongly Agree</td>
#> <td headers="Intergroup_dominance_Q4" class="gt_row gt_left">Strongly Agree</td>
#> <td headers="Intergroup_dominance_Q5" class="gt_row gt_left">Somewhat Disagree</td>
#> <td headers="Intergroup_dominance_Q6" class="gt_row gt_left">Strongly Disagree</td>
#> <td headers="Intergroup_dominance_Q7" class="gt_row gt_left">Strongly Disagree</td>
#> <td headers="Intergroup_dominance_Q8" class="gt_row gt_left">Strongly Disagree</td>
#> <td headers="Antiegalitarian_Q1" class="gt_row gt_left">Strongly Agree</td>
#> <td headers="Antiegalitarian_Q2" class="gt_row gt_left">Neutral</td>
#> <td headers="Antiegalitarian_Q3" class="gt_row gt_left">Neutral</td>
#> <td headers="Antiegalitarian_Q4" class="gt_row gt_left">Neutral</td>
#> <td headers="Antiegalitarian_Q5" class="gt_row gt_left">Strongly Disagree</td>
#> <td headers="Antiegalitarian_Q6" class="gt_row gt_left">Slightly Disagree</td>
#> <td headers="Antiegalitarian_Q7" class="gt_row gt_left">Neutral</td>
#> <td headers="Antiegalitarian_Q8" class="gt_row gt_left">Somewhat Agree</td>
#> <td headers="SC0" class="gt_row gt_right">80</td></tr>
#>     <tr><td headers="ID" class="gt_row gt_right">95</td>
#> <td headers="Duration..in.seconds." class="gt_row gt_right">245</td>
#> <td headers="Q1" class="gt_row gt_right">NA</td>
#> <td headers="Q2" class="gt_row gt_right">5</td>
#> <td headers="Q3" class="gt_row gt_left">315</td>
#> <td headers="Q4" class="gt_row gt_left">405</td>
#> <td headers="Q5" class="gt_row gt_left">24</td>
#> <td headers="Q6" class="gt_row gt_left">70</td>
#> <td headers="Q7" class="gt_row gt_left">160</td>
#> <td headers="Intergroup_dominance_Q1" class="gt_row gt_left">Strongly Agree</td>
#> <td headers="Intergroup_dominance_Q2" class="gt_row gt_left">Slightly Agree</td>
#> <td headers="Intergroup_dominance_Q3" class="gt_row gt_left">Slightly Agree</td>
#> <td headers="Intergroup_dominance_Q4" class="gt_row gt_left">Strongly Agree</td>
#> <td headers="Intergroup_dominance_Q5" class="gt_row gt_left">Somewhat Disagree</td>
#> <td headers="Intergroup_dominance_Q6" class="gt_row gt_left">Slightly Disagree</td>
#> <td headers="Intergroup_dominance_Q7" class="gt_row gt_left">Somewhat Disagree</td>
#> <td headers="Intergroup_dominance_Q8" class="gt_row gt_left">Strongly Disagree</td>
#> <td headers="Antiegalitarian_Q1" class="gt_row gt_left">Strongly Agree</td>
#> <td headers="Antiegalitarian_Q2" class="gt_row gt_left">Strongly Agree</td>
#> <td headers="Antiegalitarian_Q3" class="gt_row gt_left">Strongly Agree</td>
#> <td headers="Antiegalitarian_Q4" class="gt_row gt_left">Strongly Agree</td>
#> <td headers="Antiegalitarian_Q5" class="gt_row gt_left">Slightly Disagree</td>
#> <td headers="Antiegalitarian_Q6" class="gt_row gt_left">Strongly Disagree</td>
#> <td headers="Antiegalitarian_Q7" class="gt_row gt_left">Somewhat Disagree</td>
#> <td headers="Antiegalitarian_Q8" class="gt_row gt_left">Somewhat Disagree</td>
#> <td headers="SC0" class="gt_row gt_right">80</td></tr>
#>     <tr><td headers="ID" class="gt_row gt_right">96</td>
#> <td headers="Duration..in.seconds." class="gt_row gt_right">312</td>
#> <td headers="Q1" class="gt_row gt_right">10</td>
#> <td headers="Q2" class="gt_row gt_right">5</td>
#> <td headers="Q3" class="gt_row gt_left">255</td>
#> <td headers="Q4" class="gt_row gt_left">475</td>
#> <td headers="Q5" class="gt_row gt_left">23</td>
#> <td headers="Q6" class="gt_row gt_left">69</td>
#> <td headers="Q7" class="gt_row gt_left">200</td>
#> <td headers="Intergroup_dominance_Q1" class="gt_row gt_left">Strongly Disagree</td>
#> <td headers="Intergroup_dominance_Q2" class="gt_row gt_left">Strongly Disagree</td>
#> <td headers="Intergroup_dominance_Q3" class="gt_row gt_left">Strongly Disagree</td>
#> <td headers="Intergroup_dominance_Q4" class="gt_row gt_left">Strongly Disagree</td>
#> <td headers="Intergroup_dominance_Q5" class="gt_row gt_left">Strongly Agree</td>
#> <td headers="Intergroup_dominance_Q6" class="gt_row gt_left">Strongly Agree</td>
#> <td headers="Intergroup_dominance_Q7" class="gt_row gt_left">Strongly Agree</td>
#> <td headers="Intergroup_dominance_Q8" class="gt_row gt_left">Strongly Agree</td>
#> <td headers="Antiegalitarian_Q1" class="gt_row gt_left">Strongly Disagree</td>
#> <td headers="Antiegalitarian_Q2" class="gt_row gt_left">Somewhat Disagree</td>
#> <td headers="Antiegalitarian_Q3" class="gt_row gt_left">Somewhat Disagree</td>
#> <td headers="Antiegalitarian_Q4" class="gt_row gt_left">Strongly Disagree</td>
#> <td headers="Antiegalitarian_Q5" class="gt_row gt_left">Strongly Agree</td>
#> <td headers="Antiegalitarian_Q6" class="gt_row gt_left">Strongly Agree</td>
#> <td headers="Antiegalitarian_Q7" class="gt_row gt_left">Strongly Agree</td>
#> <td headers="Antiegalitarian_Q8" class="gt_row gt_left">Strongly Agree</td>
#> <td headers="SC0" class="gt_row gt_right">79</td></tr>
#>     <tr><td headers="ID" class="gt_row gt_right">97</td>
#> <td headers="Duration..in.seconds." class="gt_row gt_right">199</td>
#> <td headers="Q1" class="gt_row gt_right">9</td>
#> <td headers="Q2" class="gt_row gt_right">6</td>
#> <td headers="Q3" class="gt_row gt_left">385</td>
#> <td headers="Q4" class="gt_row gt_left">405</td>
#> <td headers="Q5" class="gt_row gt_left">26</td>
#> <td headers="Q6" class="gt_row gt_left">73</td>
#> <td headers="Q7" class="gt_row gt_left">265</td>
#> <td headers="Intergroup_dominance_Q1" class="gt_row gt_left">Slightly Disagree</td>
#> <td headers="Intergroup_dominance_Q2" class="gt_row gt_left">Somewhat Agree</td>
#> <td headers="Intergroup_dominance_Q3" class="gt_row gt_left">Slightly Disagree</td>
#> <td headers="Intergroup_dominance_Q4" class="gt_row gt_left">Somewhat Disagree</td>
#> <td headers="Intergroup_dominance_Q5" class="gt_row gt_left">Strongly Agree</td>
#> <td headers="Intergroup_dominance_Q6" class="gt_row gt_left">Slightly Agree</td>
#> <td headers="Intergroup_dominance_Q7" class="gt_row gt_left">Strongly Agree</td>
#> <td headers="Intergroup_dominance_Q8" class="gt_row gt_left">Somewhat Agree</td>
#> <td headers="Antiegalitarian_Q1" class="gt_row gt_left">Strongly Disagree</td>
#> <td headers="Antiegalitarian_Q2" class="gt_row gt_left">Strongly Disagree</td>
#> <td headers="Antiegalitarian_Q3" class="gt_row gt_left">Somewhat Disagree</td>
#> <td headers="Antiegalitarian_Q4" class="gt_row gt_left">Strongly Disagree</td>
#> <td headers="Antiegalitarian_Q5" class="gt_row gt_left">Strongly Agree</td>
#> <td headers="Antiegalitarian_Q6" class="gt_row gt_left">Slightly Agree</td>
#> <td headers="Antiegalitarian_Q7" class="gt_row gt_left">Strongly Agree</td>
#> <td headers="Antiegalitarian_Q8" class="gt_row gt_left">Strongly Agree</td>
#> <td headers="SC0" class="gt_row gt_right">82</td></tr>
#>     <tr><td headers="ID" class="gt_row gt_right">98</td>
#> <td headers="Duration..in.seconds." class="gt_row gt_right">229</td>
#> <td headers="Q1" class="gt_row gt_right">9</td>
#> <td headers="Q2" class="gt_row gt_right">5</td>
#> <td headers="Q3" class="gt_row gt_left">315</td>
#> <td headers="Q4" class="gt_row gt_left">425</td>
#> <td headers="Q5" class="gt_row gt_left">20</td>
#> <td headers="Q6" class="gt_row gt_left">70</td>
#> <td headers="Q7" class="gt_row gt_left">190</td>
#> <td headers="Intergroup_dominance_Q1" class="gt_row gt_left">Somewhat Disagree</td>
#> <td headers="Intergroup_dominance_Q2" class="gt_row gt_left">Somewhat Agree</td>
#> <td headers="Intergroup_dominance_Q3" class="gt_row gt_left">Somewhat Disagree</td>
#> <td headers="Intergroup_dominance_Q4" class="gt_row gt_left">Slightly Disagree</td>
#> <td headers="Intergroup_dominance_Q5" class="gt_row gt_left">Somewhat Agree</td>
#> <td headers="Intergroup_dominance_Q6" class="gt_row gt_left">Neutral</td>
#> <td headers="Intergroup_dominance_Q7" class="gt_row gt_left">Somewhat Agree</td>
#> <td headers="Intergroup_dominance_Q8" class="gt_row gt_left">Somewhat Agree</td>
#> <td headers="Antiegalitarian_Q1" class="gt_row gt_left">Strongly Disagree</td>
#> <td headers="Antiegalitarian_Q2" class="gt_row gt_left">Somewhat Disagree</td>
#> <td headers="Antiegalitarian_Q3" class="gt_row gt_left">Slightly Disagree</td>
#> <td headers="Antiegalitarian_Q4" class="gt_row gt_left">Strongly Disagree</td>
#> <td headers="Antiegalitarian_Q5" class="gt_row gt_left">Somewhat Disagree</td>
#> <td headers="Antiegalitarian_Q6" class="gt_row gt_left">Somewhat Disagree</td>
#> <td headers="Antiegalitarian_Q7" class="gt_row gt_left">Strongly Agree</td>
#> <td headers="Antiegalitarian_Q8" class="gt_row gt_left">Neutral</td>
#> <td headers="SC0" class="gt_row gt_right">74</td></tr>
#>     <tr><td headers="ID" class="gt_row gt_right">101</td>
#> <td headers="Duration..in.seconds." class="gt_row gt_right">351</td>
#> <td headers="Q1" class="gt_row gt_right">4</td>
#> <td headers="Q2" class="gt_row gt_right">115</td>
#> <td headers="Q3" class="gt_row gt_left">15</td>
#> <td headers="Q4" class="gt_row gt_left">15</td>
#> <td headers="Q5" class="gt_row gt_left">3</td>
#> <td headers="Q6" class="gt_row gt_left">5</td>
#> <td headers="Q7" class="gt_row gt_left">167</td>
#> <td headers="Intergroup_dominance_Q1" class="gt_row gt_left">Strongly Disagree</td>
#> <td headers="Intergroup_dominance_Q2" class="gt_row gt_left">Neutral</td>
#> <td headers="Intergroup_dominance_Q3" class="gt_row gt_left">Strongly Disagree</td>
#> <td headers="Intergroup_dominance_Q4" class="gt_row gt_left">Somewhat Disagree</td>
#> <td headers="Intergroup_dominance_Q5" class="gt_row gt_left">Somewhat Disagree</td>
#> <td headers="Intergroup_dominance_Q6" class="gt_row gt_left">Neutral</td>
#> <td headers="Intergroup_dominance_Q7" class="gt_row gt_left">Strongly Agree</td>
#> <td headers="Intergroup_dominance_Q8" class="gt_row gt_left">Slightly Agree</td>
#> <td headers="Antiegalitarian_Q1" class="gt_row gt_left">Strongly Agree</td>
#> <td headers="Antiegalitarian_Q2" class="gt_row gt_left">Somewhat Agree</td>
#> <td headers="Antiegalitarian_Q3" class="gt_row gt_left">Slightly Agree</td>
#> <td headers="Antiegalitarian_Q4" class="gt_row gt_left">Strongly Disagree</td>
#> <td headers="Antiegalitarian_Q5" class="gt_row gt_left">Slightly Disagree</td>
#> <td headers="Antiegalitarian_Q6" class="gt_row gt_left">Strongly Agree</td>
#> <td headers="Antiegalitarian_Q7" class="gt_row gt_left">Neutral</td>
#> <td headers="Antiegalitarian_Q8" class="gt_row gt_left">Strongly Agree</td>
#> <td headers="SC0" class="gt_row gt_right">77</td></tr>
#>     <tr><td headers="ID" class="gt_row gt_right">102</td>
#> <td headers="Duration..in.seconds." class="gt_row gt_right">203</td>
#> <td headers="Q1" class="gt_row gt_right">NA</td>
#> <td headers="Q2" class="gt_row gt_right">0</td>
#> <td headers="Q3" class="gt_row gt_left">225</td>
#> <td headers="Q4" class="gt_row gt_left">315</td>
#> <td headers="Q5" class="gt_row gt_left">1</td>
#> <td headers="Q6" class="gt_row gt_left">69</td>
#> <td headers="Q7" class="gt_row gt_left">200</td>
#> <td headers="Intergroup_dominance_Q1" class="gt_row gt_left">Strongly Agree</td>
#> <td headers="Intergroup_dominance_Q2" class="gt_row gt_left">Somewhat Agree</td>
#> <td headers="Intergroup_dominance_Q3" class="gt_row gt_left">Somewhat Disagree</td>
#> <td headers="Intergroup_dominance_Q4" class="gt_row gt_left">Somewhat Agree</td>
#> <td headers="Intergroup_dominance_Q5" class="gt_row gt_left">Strongly Agree</td>
#> <td headers="Intergroup_dominance_Q6" class="gt_row gt_left">Somewhat Agree</td>
#> <td headers="Intergroup_dominance_Q7" class="gt_row gt_left">Somewhat Agree</td>
#> <td headers="Intergroup_dominance_Q8" class="gt_row gt_left">Slightly Agree</td>
#> <td headers="Antiegalitarian_Q1" class="gt_row gt_left">Strongly Disagree</td>
#> <td headers="Antiegalitarian_Q2" class="gt_row gt_left">Strongly Disagree</td>
#> <td headers="Antiegalitarian_Q3" class="gt_row gt_left">Slightly Disagree</td>
#> <td headers="Antiegalitarian_Q4" class="gt_row gt_left">Strongly Disagree</td>
#> <td headers="Antiegalitarian_Q5" class="gt_row gt_left">Strongly Agree</td>
#> <td headers="Antiegalitarian_Q6" class="gt_row gt_left">Strongly Agree</td>
#> <td headers="Antiegalitarian_Q7" class="gt_row gt_left">Strongly Agree</td>
#> <td headers="Antiegalitarian_Q8" class="gt_row gt_left">Somewhat Agree</td>
#> <td headers="SC0" class="gt_row gt_right">86</td></tr>
#>     <tr><td headers="ID" class="gt_row gt_right">104</td>
#> <td headers="Duration..in.seconds." class="gt_row gt_right">282</td>
#> <td headers="Q1" class="gt_row gt_right">7</td>
#> <td headers="Q2" class="gt_row gt_right">5</td>
#> <td headers="Q3" class="gt_row gt_left">135</td>
#> <td headers="Q4" class="gt_row gt_left">225</td>
#> <td headers="Q5" class="gt_row gt_left">10</td>
#> <td headers="Q6" class="gt_row gt_left">63</td>
#> <td headers="Q7" class="gt_row gt_left">130</td>
#> <td headers="Intergroup_dominance_Q1" class="gt_row gt_left">Slightly Agree</td>
#> <td headers="Intergroup_dominance_Q2" class="gt_row gt_left">Strongly Disagree</td>
#> <td headers="Intergroup_dominance_Q3" class="gt_row gt_left">Slightly Agree</td>
#> <td headers="Intergroup_dominance_Q4" class="gt_row gt_left">Slightly Agree</td>
#> <td headers="Intergroup_dominance_Q5" class="gt_row gt_left">Strongly Agree</td>
#> <td headers="Intergroup_dominance_Q6" class="gt_row gt_left">Strongly Agree</td>
#> <td headers="Intergroup_dominance_Q7" class="gt_row gt_left">Strongly Agree</td>
#> <td headers="Intergroup_dominance_Q8" class="gt_row gt_left">Strongly Agree</td>
#> <td headers="Antiegalitarian_Q1" class="gt_row gt_left">Strongly Disagree</td>
#> <td headers="Antiegalitarian_Q2" class="gt_row gt_left">Strongly Disagree</td>
#> <td headers="Antiegalitarian_Q3" class="gt_row gt_left">Strongly Disagree</td>
#> <td headers="Antiegalitarian_Q4" class="gt_row gt_left">Strongly Disagree</td>
#> <td headers="Antiegalitarian_Q5" class="gt_row gt_left">Strongly Agree</td>
#> <td headers="Antiegalitarian_Q6" class="gt_row gt_left">Strongly Agree</td>
#> <td headers="Antiegalitarian_Q7" class="gt_row gt_left">Strongly Agree</td>
#> <td headers="Antiegalitarian_Q8" class="gt_row gt_left">Strongly Agree</td>
#> <td headers="SC0" class="gt_row gt_right">86</td></tr>
#>     <tr><td headers="ID" class="gt_row gt_right">105</td>
#> <td headers="Duration..in.seconds." class="gt_row gt_right">425</td>
#> <td headers="Q1" class="gt_row gt_right">8</td>
#> <td headers="Q2" class="gt_row gt_right">5</td>
#> <td headers="Q3" class="gt_row gt_left">100 lbs</td>
#> <td headers="Q4" class="gt_row gt_left">125</td>
#> <td headers="Q5" class="gt_row gt_left">0</td>
#> <td headers="Q6" class="gt_row gt_left">5’6</td>
#> <td headers="Q7" class="gt_row gt_left">200</td>
#> <td headers="Intergroup_dominance_Q1" class="gt_row gt_left">Somewhat Disagree</td>
#> <td headers="Intergroup_dominance_Q2" class="gt_row gt_left">Somewhat Disagree</td>
#> <td headers="Intergroup_dominance_Q3" class="gt_row gt_left">Strongly Disagree</td>
#> <td headers="Intergroup_dominance_Q4" class="gt_row gt_left">Neutral</td>
#> <td headers="Intergroup_dominance_Q5" class="gt_row gt_left">Strongly Agree</td>
#> <td headers="Intergroup_dominance_Q6" class="gt_row gt_left">Strongly Agree</td>
#> <td headers="Intergroup_dominance_Q7" class="gt_row gt_left">Strongly Agree</td>
#> <td headers="Intergroup_dominance_Q8" class="gt_row gt_left">Strongly Agree</td>
#> <td headers="Antiegalitarian_Q1" class="gt_row gt_left">Strongly Disagree</td>
#> <td headers="Antiegalitarian_Q2" class="gt_row gt_left">Strongly Disagree</td>
#> <td headers="Antiegalitarian_Q3" class="gt_row gt_left">Strongly Disagree</td>
#> <td headers="Antiegalitarian_Q4" class="gt_row gt_left">Strongly Disagree</td>
#> <td headers="Antiegalitarian_Q5" class="gt_row gt_left">Strongly Agree</td>
#> <td headers="Antiegalitarian_Q6" class="gt_row gt_left">Strongly Agree</td>
#> <td headers="Antiegalitarian_Q7" class="gt_row gt_left">Strongly Agree</td>
#> <td headers="Antiegalitarian_Q8" class="gt_row gt_left">Neutral</td>
#> <td headers="SC0" class="gt_row gt_right">82</td></tr>
#>     <tr><td headers="ID" class="gt_row gt_right">106</td>
#> <td headers="Duration..in.seconds." class="gt_row gt_right">312</td>
#> <td headers="Q1" class="gt_row gt_right">7</td>
#> <td headers="Q2" class="gt_row gt_right">5</td>
#> <td headers="Q3" class="gt_row gt_left">No idea</td>
#> <td headers="Q4" class="gt_row gt_left">NA</td>
#> <td headers="Q5" class="gt_row gt_left">Na</td>
#> <td headers="Q6" class="gt_row gt_left">63</td>
#> <td headers="Q7" class="gt_row gt_left">150</td>
#> <td headers="Intergroup_dominance_Q1" class="gt_row gt_left">Somewhat Disagree</td>
#> <td headers="Intergroup_dominance_Q2" class="gt_row gt_left">Strongly Disagree</td>
#> <td headers="Intergroup_dominance_Q3" class="gt_row gt_left">Somewhat Disagree</td>
#> <td headers="Intergroup_dominance_Q4" class="gt_row gt_left">Somewhat Agree</td>
#> <td headers="Intergroup_dominance_Q5" class="gt_row gt_left">Somewhat Agree</td>
#> <td headers="Intergroup_dominance_Q6" class="gt_row gt_left">Somewhat Agree</td>
#> <td headers="Intergroup_dominance_Q7" class="gt_row gt_left">Somewhat Agree</td>
#> <td headers="Intergroup_dominance_Q8" class="gt_row gt_left">Somewhat Agree</td>
#> <td headers="Antiegalitarian_Q1" class="gt_row gt_left">Somewhat Disagree</td>
#> <td headers="Antiegalitarian_Q2" class="gt_row gt_left">Somewhat Agree</td>
#> <td headers="Antiegalitarian_Q3" class="gt_row gt_left">Strongly Agree</td>
#> <td headers="Antiegalitarian_Q4" class="gt_row gt_left">Somewhat Agree</td>
#> <td headers="Antiegalitarian_Q5" class="gt_row gt_left">Somewhat Agree</td>
#> <td headers="Antiegalitarian_Q6" class="gt_row gt_left">Somewhat Agree</td>
#> <td headers="Antiegalitarian_Q7" class="gt_row gt_left">Strongly Agree</td>
#> <td headers="Antiegalitarian_Q8" class="gt_row gt_left">Slightly Agree</td>
#> <td headers="SC0" class="gt_row gt_right">91</td></tr>
#>     <tr><td headers="ID" class="gt_row gt_right">107</td>
#> <td headers="Duration..in.seconds." class="gt_row gt_right">244</td>
#> <td headers="Q1" class="gt_row gt_right">8</td>
#> <td headers="Q2" class="gt_row gt_right">6</td>
#> <td headers="Q3" class="gt_row gt_left">335</td>
#> <td headers="Q4" class="gt_row gt_left">505</td>
#> <td headers="Q5" class="gt_row gt_left">23</td>
#> <td headers="Q6" class="gt_row gt_left">60</td>
#> <td headers="Q7" class="gt_row gt_left">216</td>
#> <td headers="Intergroup_dominance_Q1" class="gt_row gt_left">Slightly Agree</td>
#> <td headers="Intergroup_dominance_Q2" class="gt_row gt_left">Slightly Agree</td>
#> <td headers="Intergroup_dominance_Q3" class="gt_row gt_left">Somewhat Agree</td>
#> <td headers="Intergroup_dominance_Q4" class="gt_row gt_left">Slightly Agree</td>
#> <td headers="Intergroup_dominance_Q5" class="gt_row gt_left">Slightly Agree</td>
#> <td headers="Intergroup_dominance_Q6" class="gt_row gt_left">Somewhat Agree</td>
#> <td headers="Intergroup_dominance_Q7" class="gt_row gt_left">Strongly Agree</td>
#> <td headers="Intergroup_dominance_Q8" class="gt_row gt_left">Neutral</td>
#> <td headers="Antiegalitarian_Q1" class="gt_row gt_left">Somewhat Agree</td>
#> <td headers="Antiegalitarian_Q2" class="gt_row gt_left">Somewhat Agree</td>
#> <td headers="Antiegalitarian_Q3" class="gt_row gt_left">Strongly Agree</td>
#> <td headers="Antiegalitarian_Q4" class="gt_row gt_left">Strongly Agree</td>
#> <td headers="Antiegalitarian_Q5" class="gt_row gt_left">Neutral</td>
#> <td headers="Antiegalitarian_Q6" class="gt_row gt_left">Neutral</td>
#> <td headers="Antiegalitarian_Q7" class="gt_row gt_left">Strongly Agree</td>
#> <td headers="Antiegalitarian_Q8" class="gt_row gt_left">Neutral</td>
#> <td headers="SC0" class="gt_row gt_right">98</td></tr>
#>     <tr><td headers="ID" class="gt_row gt_right">109</td>
#> <td headers="Duration..in.seconds." class="gt_row gt_right">233</td>
#> <td headers="Q1" class="gt_row gt_right">NA</td>
#> <td headers="Q2" class="gt_row gt_right">5</td>
#> <td headers="Q3" class="gt_row gt_left">250</td>
#> <td headers="Q4" class="gt_row gt_left">325</td>
#> <td headers="Q5" class="gt_row gt_left">23</td>
#> <td headers="Q6" class="gt_row gt_left">66</td>
#> <td headers="Q7" class="gt_row gt_left">160</td>
#> <td headers="Intergroup_dominance_Q1" class="gt_row gt_left">Somewhat Disagree</td>
#> <td headers="Intergroup_dominance_Q2" class="gt_row gt_left">Strongly Disagree</td>
#> <td headers="Intergroup_dominance_Q3" class="gt_row gt_left">Somewhat Disagree</td>
#> <td headers="Intergroup_dominance_Q4" class="gt_row gt_left">Slightly Disagree</td>
#> <td headers="Intergroup_dominance_Q5" class="gt_row gt_left">Strongly Agree</td>
#> <td headers="Intergroup_dominance_Q6" class="gt_row gt_left">Somewhat Disagree</td>
#> <td headers="Intergroup_dominance_Q7" class="gt_row gt_left">Somewhat Agree</td>
#> <td headers="Intergroup_dominance_Q8" class="gt_row gt_left">Somewhat Agree</td>
#> <td headers="Antiegalitarian_Q1" class="gt_row gt_left">Somewhat Disagree</td>
#> <td headers="Antiegalitarian_Q2" class="gt_row gt_left">Strongly Disagree</td>
#> <td headers="Antiegalitarian_Q3" class="gt_row gt_left">Somewhat Disagree</td>
#> <td headers="Antiegalitarian_Q4" class="gt_row gt_left">Strongly Disagree</td>
#> <td headers="Antiegalitarian_Q5" class="gt_row gt_left">Strongly Agree</td>
#> <td headers="Antiegalitarian_Q6" class="gt_row gt_left">Strongly Agree</td>
#> <td headers="Antiegalitarian_Q7" class="gt_row gt_left">Somewhat Agree</td>
#> <td headers="Antiegalitarian_Q8" class="gt_row gt_left">Somewhat Agree</td>
#> <td headers="SC0" class="gt_row gt_right">76</td></tr>
#>     <tr><td headers="ID" class="gt_row gt_right">111</td>
#> <td headers="Duration..in.seconds." class="gt_row gt_right">225</td>
#> <td headers="Q1" class="gt_row gt_right">8</td>
#> <td headers="Q2" class="gt_row gt_right">8</td>
#> <td headers="Q3" class="gt_row gt_left">255</td>
#> <td headers="Q4" class="gt_row gt_left">455</td>
#> <td headers="Q5" class="gt_row gt_left">25</td>
#> <td headers="Q6" class="gt_row gt_left">73</td>
#> <td headers="Q7" class="gt_row gt_left">200</td>
#> <td headers="Intergroup_dominance_Q1" class="gt_row gt_left">Somewhat Agree</td>
#> <td headers="Intergroup_dominance_Q2" class="gt_row gt_left">Strongly Agree</td>
#> <td headers="Intergroup_dominance_Q3" class="gt_row gt_left">Strongly Agree</td>
#> <td headers="Intergroup_dominance_Q4" class="gt_row gt_left">Strongly Agree</td>
#> <td headers="Intergroup_dominance_Q5" class="gt_row gt_left">Neutral</td>
#> <td headers="Intergroup_dominance_Q6" class="gt_row gt_left">Slightly Disagree</td>
#> <td headers="Intergroup_dominance_Q7" class="gt_row gt_left">Somewhat Disagree</td>
#> <td headers="Intergroup_dominance_Q8" class="gt_row gt_left">Somewhat Disagree</td>
#> <td headers="Antiegalitarian_Q1" class="gt_row gt_left">Strongly Disagree</td>
#> <td headers="Antiegalitarian_Q2" class="gt_row gt_left">Somewhat Agree</td>
#> <td headers="Antiegalitarian_Q3" class="gt_row gt_left">Strongly Agree</td>
#> <td headers="Antiegalitarian_Q4" class="gt_row gt_left">Somewhat Disagree</td>
#> <td headers="Antiegalitarian_Q5" class="gt_row gt_left">Strongly Agree</td>
#> <td headers="Antiegalitarian_Q6" class="gt_row gt_left">Slightly Agree</td>
#> <td headers="Antiegalitarian_Q7" class="gt_row gt_left">Strongly Agree</td>
#> <td headers="Antiegalitarian_Q8" class="gt_row gt_left">Slightly Disagree</td>
#> <td headers="SC0" class="gt_row gt_right">93</td></tr>
#>     <tr><td headers="ID" class="gt_row gt_right">113</td>
#> <td headers="Duration..in.seconds." class="gt_row gt_right">274</td>
#> <td headers="Q1" class="gt_row gt_right">5</td>
#> <td headers="Q2" class="gt_row gt_right">0</td>
#> <td headers="Q3" class="gt_row gt_left">No idea, but not much</td>
#> <td headers="Q4" class="gt_row gt_left">No idea, but very little</td>
#> <td headers="Q5" class="gt_row gt_left">0.  I've never been able to do 1</td>
#> <td headers="Q6" class="gt_row gt_left">72</td>
#> <td headers="Q7" class="gt_row gt_left">230</td>
#> <td headers="Intergroup_dominance_Q1" class="gt_row gt_left">Somewhat Disagree</td>
#> <td headers="Intergroup_dominance_Q2" class="gt_row gt_left">Slightly Agree</td>
#> <td headers="Intergroup_dominance_Q3" class="gt_row gt_left">Slightly Disagree</td>
#> <td headers="Intergroup_dominance_Q4" class="gt_row gt_left">Neutral</td>
#> <td headers="Intergroup_dominance_Q5" class="gt_row gt_left">Strongly Agree</td>
#> <td headers="Intergroup_dominance_Q6" class="gt_row gt_left">Neutral</td>
#> <td headers="Intergroup_dominance_Q7" class="gt_row gt_left">Slightly Agree</td>
#> <td headers="Intergroup_dominance_Q8" class="gt_row gt_left">Slightly Agree</td>
#> <td headers="Antiegalitarian_Q1" class="gt_row gt_left">Slightly Agree</td>
#> <td headers="Antiegalitarian_Q2" class="gt_row gt_left">Slightly Disagree</td>
#> <td headers="Antiegalitarian_Q3" class="gt_row gt_left">Somewhat Disagree</td>
#> <td headers="Antiegalitarian_Q4" class="gt_row gt_left">Slightly Disagree</td>
#> <td headers="Antiegalitarian_Q5" class="gt_row gt_left">Somewhat Agree</td>
#> <td headers="Antiegalitarian_Q6" class="gt_row gt_left">Strongly Agree</td>
#> <td headers="Antiegalitarian_Q7" class="gt_row gt_left">Strongly Agree</td>
#> <td headers="Antiegalitarian_Q8" class="gt_row gt_left">Somewhat Agree</td>
#> <td headers="SC0" class="gt_row gt_right">85</td></tr>
#>     <tr><td headers="ID" class="gt_row gt_right">116</td>
#> <td headers="Duration..in.seconds." class="gt_row gt_right">138</td>
#> <td headers="Q1" class="gt_row gt_right">5</td>
#> <td headers="Q2" class="gt_row gt_right">5</td>
#> <td headers="Q3" class="gt_row gt_left">.</td>
#> <td headers="Q4" class="gt_row gt_left">.</td>
#> <td headers="Q5" class="gt_row gt_left">0</td>
#> <td headers="Q6" class="gt_row gt_left">68</td>
#> <td headers="Q7" class="gt_row gt_left">140</td>
#> <td headers="Intergroup_dominance_Q1" class="gt_row gt_left">Strongly Disagree</td>
#> <td headers="Intergroup_dominance_Q2" class="gt_row gt_left">Strongly Disagree</td>
#> <td headers="Intergroup_dominance_Q3" class="gt_row gt_left">Strongly Disagree</td>
#> <td headers="Intergroup_dominance_Q4" class="gt_row gt_left">Slightly Disagree</td>
#> <td headers="Intergroup_dominance_Q5" class="gt_row gt_left">Strongly Agree</td>
#> <td headers="Intergroup_dominance_Q6" class="gt_row gt_left">Strongly Agree</td>
#> <td headers="Intergroup_dominance_Q7" class="gt_row gt_left">Strongly Agree</td>
#> <td headers="Intergroup_dominance_Q8" class="gt_row gt_left">Strongly Agree</td>
#> <td headers="Antiegalitarian_Q1" class="gt_row gt_left">Strongly Disagree</td>
#> <td headers="Antiegalitarian_Q2" class="gt_row gt_left">Strongly Disagree</td>
#> <td headers="Antiegalitarian_Q3" class="gt_row gt_left">Slightly Disagree</td>
#> <td headers="Antiegalitarian_Q4" class="gt_row gt_left">Strongly Disagree</td>
#> <td headers="Antiegalitarian_Q5" class="gt_row gt_left">Strongly Agree</td>
#> <td headers="Antiegalitarian_Q6" class="gt_row gt_left">Strongly Agree</td>
#> <td headers="Antiegalitarian_Q7" class="gt_row gt_left">Strongly Agree</td>
#> <td headers="Antiegalitarian_Q8" class="gt_row gt_left">Strongly Agree</td>
#> <td headers="SC0" class="gt_row gt_right">77</td></tr>
#>     <tr><td headers="ID" class="gt_row gt_right">118</td>
#> <td headers="Duration..in.seconds." class="gt_row gt_right">353</td>
#> <td headers="Q1" class="gt_row gt_right">5</td>
#> <td headers="Q2" class="gt_row gt_right">5</td>
#> <td headers="Q3" class="gt_row gt_left">?</td>
#> <td headers="Q4" class="gt_row gt_left">?</td>
#> <td headers="Q5" class="gt_row gt_left">?</td>
#> <td headers="Q6" class="gt_row gt_left">6</td>
#> <td headers="Q7" class="gt_row gt_left">200</td>
#> <td headers="Intergroup_dominance_Q1" class="gt_row gt_left">Somewhat Disagree</td>
#> <td headers="Intergroup_dominance_Q2" class="gt_row gt_left">Somewhat Disagree</td>
#> <td headers="Intergroup_dominance_Q3" class="gt_row gt_left">Strongly Disagree</td>
#> <td headers="Intergroup_dominance_Q4" class="gt_row gt_left">Slightly Agree</td>
#> <td headers="Intergroup_dominance_Q5" class="gt_row gt_left">Somewhat Agree</td>
#> <td headers="Intergroup_dominance_Q6" class="gt_row gt_left">Somewhat Agree</td>
#> <td headers="Intergroup_dominance_Q7" class="gt_row gt_left">Strongly Agree</td>
#> <td headers="Intergroup_dominance_Q8" class="gt_row gt_left">Slightly Agree</td>
#> <td headers="Antiegalitarian_Q1" class="gt_row gt_left">Strongly Disagree</td>
#> <td headers="Antiegalitarian_Q2" class="gt_row gt_left">Strongly Disagree</td>
#> <td headers="Antiegalitarian_Q3" class="gt_row gt_left">Somewhat Disagree</td>
#> <td headers="Antiegalitarian_Q4" class="gt_row gt_left">Strongly Disagree</td>
#> <td headers="Antiegalitarian_Q5" class="gt_row gt_left">Strongly Agree</td>
#> <td headers="Antiegalitarian_Q6" class="gt_row gt_left">Strongly Agree</td>
#> <td headers="Antiegalitarian_Q7" class="gt_row gt_left">Strongly Agree</td>
#> <td headers="Antiegalitarian_Q8" class="gt_row gt_left">Strongly Agree</td>
#> <td headers="SC0" class="gt_row gt_right">79</td></tr>
#>     <tr><td headers="ID" class="gt_row gt_right">121</td>
#> <td headers="Duration..in.seconds." class="gt_row gt_right">356</td>
#> <td headers="Q1" class="gt_row gt_right">7</td>
#> <td headers="Q2" class="gt_row gt_right">5</td>
#> <td headers="Q3" class="gt_row gt_left">Unknown</td>
#> <td headers="Q4" class="gt_row gt_left">Unknown</td>
#> <td headers="Q5" class="gt_row gt_left">25</td>
#> <td headers="Q6" class="gt_row gt_left">69</td>
#> <td headers="Q7" class="gt_row gt_left">190</td>
#> <td headers="Intergroup_dominance_Q1" class="gt_row gt_left">Neutral</td>
#> <td headers="Intergroup_dominance_Q2" class="gt_row gt_left">Slightly Agree</td>
#> <td headers="Intergroup_dominance_Q3" class="gt_row gt_left">Slightly Agree</td>
#> <td headers="Intergroup_dominance_Q4" class="gt_row gt_left">Slightly Agree</td>
#> <td headers="Intergroup_dominance_Q5" class="gt_row gt_left">Strongly Agree</td>
#> <td headers="Intergroup_dominance_Q6" class="gt_row gt_left">Strongly Agree</td>
#> <td headers="Intergroup_dominance_Q7" class="gt_row gt_left">Strongly Agree</td>
#> <td headers="Intergroup_dominance_Q8" class="gt_row gt_left">Strongly Disagree</td>
#> <td headers="Antiegalitarian_Q1" class="gt_row gt_left">Strongly Disagree</td>
#> <td headers="Antiegalitarian_Q2" class="gt_row gt_left">Strongly Disagree</td>
#> <td headers="Antiegalitarian_Q3" class="gt_row gt_left">Strongly Disagree</td>
#> <td headers="Antiegalitarian_Q4" class="gt_row gt_left">Strongly Disagree</td>
#> <td headers="Antiegalitarian_Q5" class="gt_row gt_left">Neutral</td>
#> <td headers="Antiegalitarian_Q6" class="gt_row gt_left">Somewhat Disagree</td>
#> <td headers="Antiegalitarian_Q7" class="gt_row gt_left">Slightly Agree</td>
#> <td headers="Antiegalitarian_Q8" class="gt_row gt_left">Slightly Disagree</td>
#> <td headers="SC0" class="gt_row gt_right">70</td></tr>
#>     <tr><td headers="ID" class="gt_row gt_right">123</td>
#> <td headers="Duration..in.seconds." class="gt_row gt_right">384</td>
#> <td headers="Q1" class="gt_row gt_right">6</td>
#> <td headers="Q2" class="gt_row gt_right">5</td>
#> <td headers="Q3" class="gt_row gt_left">?</td>
#> <td headers="Q4" class="gt_row gt_left">?</td>
#> <td headers="Q5" class="gt_row gt_left">?</td>
#> <td headers="Q6" class="gt_row gt_left">74</td>
#> <td headers="Q7" class="gt_row gt_left">228</td>
#> <td headers="Intergroup_dominance_Q1" class="gt_row gt_left">Neutral</td>
#> <td headers="Intergroup_dominance_Q2" class="gt_row gt_left">Slightly Agree</td>
#> <td headers="Intergroup_dominance_Q3" class="gt_row gt_left">Slightly Disagree</td>
#> <td headers="Intergroup_dominance_Q4" class="gt_row gt_left">Somewhat Agree</td>
#> <td headers="Intergroup_dominance_Q5" class="gt_row gt_left">Somewhat Agree</td>
#> <td headers="Intergroup_dominance_Q6" class="gt_row gt_left">Somewhat Agree</td>
#> <td headers="Intergroup_dominance_Q7" class="gt_row gt_left">Slightly Disagree</td>
#> <td headers="Intergroup_dominance_Q8" class="gt_row gt_left">Neutral</td>
#> <td headers="Antiegalitarian_Q1" class="gt_row gt_left">Strongly Disagree</td>
#> <td headers="Antiegalitarian_Q2" class="gt_row gt_left">Somewhat Disagree</td>
#> <td headers="Antiegalitarian_Q3" class="gt_row gt_left">Neutral</td>
#> <td headers="Antiegalitarian_Q4" class="gt_row gt_left">Neutral</td>
#> <td headers="Antiegalitarian_Q5" class="gt_row gt_left">Neutral</td>
#> <td headers="Antiegalitarian_Q6" class="gt_row gt_left">Strongly Agree</td>
#> <td headers="Antiegalitarian_Q7" class="gt_row gt_left">Neutral</td>
#> <td headers="Antiegalitarian_Q8" class="gt_row gt_left">Neutral</td>
#> <td headers="SC0" class="gt_row gt_right">79</td></tr>
#>     <tr><td headers="ID" class="gt_row gt_right">124</td>
#> <td headers="Duration..in.seconds." class="gt_row gt_right">231</td>
#> <td headers="Q1" class="gt_row gt_right">7</td>
#> <td headers="Q2" class="gt_row gt_right">5</td>
#> <td headers="Q3" class="gt_row gt_left">385</td>
#> <td headers="Q4" class="gt_row gt_left">405</td>
#> <td headers="Q5" class="gt_row gt_left">20</td>
#> <td headers="Q6" class="gt_row gt_left">71</td>
#> <td headers="Q7" class="gt_row gt_left">245</td>
#> <td headers="Intergroup_dominance_Q1" class="gt_row gt_left">Slightly Agree</td>
#> <td headers="Intergroup_dominance_Q2" class="gt_row gt_left">Slightly Agree</td>
#> <td headers="Intergroup_dominance_Q3" class="gt_row gt_left">Slightly Agree</td>
#> <td headers="Intergroup_dominance_Q4" class="gt_row gt_left">Somewhat Agree</td>
#> <td headers="Intergroup_dominance_Q5" class="gt_row gt_left">Strongly Agree</td>
#> <td headers="Intergroup_dominance_Q6" class="gt_row gt_left">Strongly Agree</td>
#> <td headers="Intergroup_dominance_Q7" class="gt_row gt_left">Strongly Agree</td>
#> <td headers="Intergroup_dominance_Q8" class="gt_row gt_left">Somewhat Agree</td>
#> <td headers="Antiegalitarian_Q1" class="gt_row gt_left">Slightly Disagree</td>
#> <td headers="Antiegalitarian_Q2" class="gt_row gt_left">Strongly Disagree</td>
#> <td headers="Antiegalitarian_Q3" class="gt_row gt_left">Slightly Agree</td>
#> <td headers="Antiegalitarian_Q4" class="gt_row gt_left">Somewhat Disagree</td>
#> <td headers="Antiegalitarian_Q5" class="gt_row gt_left">Somewhat Disagree</td>
#> <td headers="Antiegalitarian_Q6" class="gt_row gt_left">Neutral</td>
#> <td headers="Antiegalitarian_Q7" class="gt_row gt_left">Strongly Agree</td>
#> <td headers="Antiegalitarian_Q8" class="gt_row gt_left">Slightly Agree</td>
#> <td headers="SC0" class="gt_row gt_right">86</td></tr>
#>     <tr><td headers="ID" class="gt_row gt_right">125</td>
#> <td headers="Duration..in.seconds." class="gt_row gt_right">237</td>
#> <td headers="Q1" class="gt_row gt_right">NA</td>
#> <td headers="Q2" class="gt_row gt_right">5</td>
#> <td headers="Q3" class="gt_row gt_left">70</td>
#> <td headers="Q4" class="gt_row gt_left">150</td>
#> <td headers="Q5" class="gt_row gt_left">3</td>
#> <td headers="Q6" class="gt_row gt_left">62</td>
#> <td headers="Q7" class="gt_row gt_left">140</td>
#> <td headers="Intergroup_dominance_Q1" class="gt_row gt_left">Somewhat Disagree</td>
#> <td headers="Intergroup_dominance_Q2" class="gt_row gt_left">Strongly Agree</td>
#> <td headers="Intergroup_dominance_Q3" class="gt_row gt_left">Somewhat Disagree</td>
#> <td headers="Intergroup_dominance_Q4" class="gt_row gt_left">Somewhat Disagree</td>
#> <td headers="Intergroup_dominance_Q5" class="gt_row gt_left">Strongly Agree</td>
#> <td headers="Intergroup_dominance_Q6" class="gt_row gt_left">Strongly Agree</td>
#> <td headers="Intergroup_dominance_Q7" class="gt_row gt_left">Strongly Agree</td>
#> <td headers="Intergroup_dominance_Q8" class="gt_row gt_left">Strongly Agree</td>
#> <td headers="Antiegalitarian_Q1" class="gt_row gt_left">Strongly Disagree</td>
#> <td headers="Antiegalitarian_Q2" class="gt_row gt_left">Somewhat Disagree</td>
#> <td headers="Antiegalitarian_Q3" class="gt_row gt_left">Neutral</td>
#> <td headers="Antiegalitarian_Q4" class="gt_row gt_left">Strongly Disagree</td>
#> <td headers="Antiegalitarian_Q5" class="gt_row gt_left">Somewhat Agree</td>
#> <td headers="Antiegalitarian_Q6" class="gt_row gt_left">Neutral</td>
#> <td headers="Antiegalitarian_Q7" class="gt_row gt_left">Strongly Agree</td>
#> <td headers="Antiegalitarian_Q8" class="gt_row gt_left">Strongly Agree</td>
#> <td headers="SC0" class="gt_row gt_right">84</td></tr>
#>     <tr><td headers="ID" class="gt_row gt_right">126</td>
#> <td headers="Duration..in.seconds." class="gt_row gt_right">632</td>
#> <td headers="Q1" class="gt_row gt_right">10</td>
#> <td headers="Q2" class="gt_row gt_right">6</td>
#> <td headers="Q3" class="gt_row gt_left">260</td>
#> <td headers="Q4" class="gt_row gt_left">280</td>
#> <td headers="Q5" class="gt_row gt_left">16</td>
#> <td headers="Q6" class="gt_row gt_left">67</td>
#> <td headers="Q7" class="gt_row gt_left">210</td>
#> <td headers="Intergroup_dominance_Q1" class="gt_row gt_left">Slightly Disagree</td>
#> <td headers="Intergroup_dominance_Q2" class="gt_row gt_left">Strongly Agree</td>
#> <td headers="Intergroup_dominance_Q3" class="gt_row gt_left">Slightly Disagree</td>
#> <td headers="Intergroup_dominance_Q4" class="gt_row gt_left">Slightly Agree</td>
#> <td headers="Intergroup_dominance_Q5" class="gt_row gt_left">Neutral</td>
#> <td headers="Intergroup_dominance_Q6" class="gt_row gt_left">Slightly Agree</td>
#> <td headers="Intergroup_dominance_Q7" class="gt_row gt_left">Strongly Agree</td>
#> <td headers="Intergroup_dominance_Q8" class="gt_row gt_left">Slightly Agree</td>
#> <td headers="Antiegalitarian_Q1" class="gt_row gt_left">Slightly Agree</td>
#> <td headers="Antiegalitarian_Q2" class="gt_row gt_left">Slightly Disagree</td>
#> <td headers="Antiegalitarian_Q3" class="gt_row gt_left">Neutral</td>
#> <td headers="Antiegalitarian_Q4" class="gt_row gt_left">Slightly Disagree</td>
#> <td headers="Antiegalitarian_Q5" class="gt_row gt_left">Somewhat Agree</td>
#> <td headers="Antiegalitarian_Q6" class="gt_row gt_left">Strongly Agree</td>
#> <td headers="Antiegalitarian_Q7" class="gt_row gt_left">Somewhat Agree</td>
#> <td headers="Antiegalitarian_Q8" class="gt_row gt_left">Somewhat Agree</td>
#> <td headers="SC0" class="gt_row gt_right">91</td></tr>
#>     <tr><td headers="ID" class="gt_row gt_right">127</td>
#> <td headers="Duration..in.seconds." class="gt_row gt_right">310</td>
#> <td headers="Q1" class="gt_row gt_right">NA</td>
#> <td headers="Q2" class="gt_row gt_right">5</td>
#> <td headers="Q3" class="gt_row gt_left">275</td>
#> <td headers="Q4" class="gt_row gt_left">585</td>
#> <td headers="Q5" class="gt_row gt_left">15</td>
#> <td headers="Q6" class="gt_row gt_left">71</td>
#> <td headers="Q7" class="gt_row gt_left">205</td>
#> <td headers="Intergroup_dominance_Q1" class="gt_row gt_left">Strongly Agree</td>
#> <td headers="Intergroup_dominance_Q2" class="gt_row gt_left">Strongly Agree</td>
#> <td headers="Intergroup_dominance_Q3" class="gt_row gt_left">Strongly Agree</td>
#> <td headers="Intergroup_dominance_Q4" class="gt_row gt_left">Strongly Agree</td>
#> <td headers="Intergroup_dominance_Q5" class="gt_row gt_left">Strongly Agree</td>
#> <td headers="Intergroup_dominance_Q6" class="gt_row gt_left">Strongly Disagree</td>
#> <td headers="Intergroup_dominance_Q7" class="gt_row gt_left">Strongly Agree</td>
#> <td headers="Intergroup_dominance_Q8" class="gt_row gt_left">Strongly Disagree</td>
#> <td headers="Antiegalitarian_Q1" class="gt_row gt_left">Strongly Disagree</td>
#> <td headers="Antiegalitarian_Q2" class="gt_row gt_left">Somewhat Disagree</td>
#> <td headers="Antiegalitarian_Q3" class="gt_row gt_left">Somewhat Agree</td>
#> <td headers="Antiegalitarian_Q4" class="gt_row gt_left">Strongly Disagree</td>
#> <td headers="Antiegalitarian_Q5" class="gt_row gt_left">Strongly Agree</td>
#> <td headers="Antiegalitarian_Q6" class="gt_row gt_left">Strongly Agree</td>
#> <td headers="Antiegalitarian_Q7" class="gt_row gt_left">Strongly Agree</td>
#> <td headers="Antiegalitarian_Q8" class="gt_row gt_left">Strongly Agree</td>
#> <td headers="SC0" class="gt_row gt_right">102</td></tr>
#>     <tr><td headers="ID" class="gt_row gt_right">129</td>
#> <td headers="Duration..in.seconds." class="gt_row gt_right">295</td>
#> <td headers="Q1" class="gt_row gt_right">5</td>
#> <td headers="Q2" class="gt_row gt_right">5</td>
#> <td headers="Q3" class="gt_row gt_left">120</td>
#> <td headers="Q4" class="gt_row gt_left">Dont do this type of activity</td>
#> <td headers="Q5" class="gt_row gt_left">Do do this type of activity</td>
#> <td headers="Q6" class="gt_row gt_left">67</td>
#> <td headers="Q7" class="gt_row gt_left">235</td>
#> <td headers="Intergroup_dominance_Q1" class="gt_row gt_left">Neutral</td>
#> <td headers="Intergroup_dominance_Q2" class="gt_row gt_left">Strongly Disagree</td>
#> <td headers="Intergroup_dominance_Q3" class="gt_row gt_left">Strongly Disagree</td>
#> <td headers="Intergroup_dominance_Q4" class="gt_row gt_left">Neutral</td>
#> <td headers="Intergroup_dominance_Q5" class="gt_row gt_left">Somewhat Agree</td>
#> <td headers="Intergroup_dominance_Q6" class="gt_row gt_left">Strongly Disagree</td>
#> <td headers="Intergroup_dominance_Q7" class="gt_row gt_left">Somewhat Agree</td>
#> <td headers="Intergroup_dominance_Q8" class="gt_row gt_left">Strongly Agree</td>
#> <td headers="Antiegalitarian_Q1" class="gt_row gt_left">Strongly Disagree</td>
#> <td headers="Antiegalitarian_Q2" class="gt_row gt_left">Strongly Disagree</td>
#> <td headers="Antiegalitarian_Q3" class="gt_row gt_left">Strongly Disagree</td>
#> <td headers="Antiegalitarian_Q4" class="gt_row gt_left">Strongly Disagree</td>
#> <td headers="Antiegalitarian_Q5" class="gt_row gt_left">Strongly Agree</td>
#> <td headers="Antiegalitarian_Q6" class="gt_row gt_left">Strongly Agree</td>
#> <td headers="Antiegalitarian_Q7" class="gt_row gt_left">Strongly Agree</td>
#> <td headers="Antiegalitarian_Q8" class="gt_row gt_left">NA</td>
#> <td headers="SC0" class="gt_row gt_right">67</td></tr>
#>     <tr><td headers="ID" class="gt_row gt_right">130</td>
#> <td headers="Duration..in.seconds." class="gt_row gt_right">430</td>
#> <td headers="Q1" class="gt_row gt_right">7</td>
#> <td headers="Q2" class="gt_row gt_right">5</td>
#> <td headers="Q3" class="gt_row gt_left">265</td>
#> <td headers="Q4" class="gt_row gt_left">405</td>
#> <td headers="Q5" class="gt_row gt_left">28</td>
#> <td headers="Q6" class="gt_row gt_left">68</td>
#> <td headers="Q7" class="gt_row gt_left">165</td>
#> <td headers="Intergroup_dominance_Q1" class="gt_row gt_left">Somewhat Disagree</td>
#> <td headers="Intergroup_dominance_Q2" class="gt_row gt_left">Strongly Agree</td>
#> <td headers="Intergroup_dominance_Q3" class="gt_row gt_left">Strongly Agree</td>
#> <td headers="Intergroup_dominance_Q4" class="gt_row gt_left">Strongly Agree</td>
#> <td headers="Intergroup_dominance_Q5" class="gt_row gt_left">Strongly Agree</td>
#> <td headers="Intergroup_dominance_Q6" class="gt_row gt_left">Strongly Disagree</td>
#> <td headers="Intergroup_dominance_Q7" class="gt_row gt_left">Strongly Agree</td>
#> <td headers="Intergroup_dominance_Q8" class="gt_row gt_left">Strongly Disagree</td>
#> <td headers="Antiegalitarian_Q1" class="gt_row gt_left">Strongly Agree</td>
#> <td headers="Antiegalitarian_Q2" class="gt_row gt_left">Somewhat Agree</td>
#> <td headers="Antiegalitarian_Q3" class="gt_row gt_left">Somewhat Agree</td>
#> <td headers="Antiegalitarian_Q4" class="gt_row gt_left">Strongly Disagree</td>
#> <td headers="Antiegalitarian_Q5" class="gt_row gt_left">Strongly Agree</td>
#> <td headers="Antiegalitarian_Q6" class="gt_row gt_left">Strongly Agree</td>
#> <td headers="Antiegalitarian_Q7" class="gt_row gt_left">Strongly Agree</td>
#> <td headers="Antiegalitarian_Q8" class="gt_row gt_left">Strongly Agree</td>
#> <td headers="SC0" class="gt_row gt_right">98</td></tr>
#>     <tr><td headers="ID" class="gt_row gt_right">131</td>
#> <td headers="Duration..in.seconds." class="gt_row gt_right">243</td>
#> <td headers="Q1" class="gt_row gt_right">8</td>
#> <td headers="Q2" class="gt_row gt_right">5</td>
#> <td headers="Q3" class="gt_row gt_left">?</td>
#> <td headers="Q4" class="gt_row gt_left">?</td>
#> <td headers="Q5" class="gt_row gt_left">6</td>
#> <td headers="Q6" class="gt_row gt_left">65</td>
#> <td headers="Q7" class="gt_row gt_left">140</td>
#> <td headers="Intergroup_dominance_Q1" class="gt_row gt_left">Strongly Disagree</td>
#> <td headers="Intergroup_dominance_Q2" class="gt_row gt_left">Strongly Disagree</td>
#> <td headers="Intergroup_dominance_Q3" class="gt_row gt_left">Strongly Disagree</td>
#> <td headers="Intergroup_dominance_Q4" class="gt_row gt_left">Slightly Disagree</td>
#> <td headers="Intergroup_dominance_Q5" class="gt_row gt_left">Strongly Agree</td>
#> <td headers="Intergroup_dominance_Q6" class="gt_row gt_left">Strongly Agree</td>
#> <td headers="Intergroup_dominance_Q7" class="gt_row gt_left">Strongly Agree</td>
#> <td headers="Intergroup_dominance_Q8" class="gt_row gt_left">Strongly Agree</td>
#> <td headers="Antiegalitarian_Q1" class="gt_row gt_left">Strongly Disagree</td>
#> <td headers="Antiegalitarian_Q2" class="gt_row gt_left">Strongly Disagree</td>
#> <td headers="Antiegalitarian_Q3" class="gt_row gt_left">Strongly Disagree</td>
#> <td headers="Antiegalitarian_Q4" class="gt_row gt_left">Strongly Disagree</td>
#> <td headers="Antiegalitarian_Q5" class="gt_row gt_left">Strongly Agree</td>
#> <td headers="Antiegalitarian_Q6" class="gt_row gt_left">Strongly Agree</td>
#> <td headers="Antiegalitarian_Q7" class="gt_row gt_left">Strongly Agree</td>
#> <td headers="Antiegalitarian_Q8" class="gt_row gt_left">Strongly Agree</td>
#> <td headers="SC0" class="gt_row gt_right">74</td></tr>
#>     <tr><td headers="ID" class="gt_row gt_right">133</td>
#> <td headers="Duration..in.seconds." class="gt_row gt_right">2637</td>
#> <td headers="Q1" class="gt_row gt_right">5</td>
#> <td headers="Q2" class="gt_row gt_right">5</td>
#> <td headers="Q3" class="gt_row gt_left">225</td>
#> <td headers="Q4" class="gt_row gt_left">330</td>
#> <td headers="Q5" class="gt_row gt_left">13</td>
#> <td headers="Q6" class="gt_row gt_left">77</td>
#> <td headers="Q7" class="gt_row gt_left">245</td>
#> <td headers="Intergroup_dominance_Q1" class="gt_row gt_left">Strongly Agree</td>
#> <td headers="Intergroup_dominance_Q2" class="gt_row gt_left">Strongly Agree</td>
#> <td headers="Intergroup_dominance_Q3" class="gt_row gt_left">Strongly Agree</td>
#> <td headers="Intergroup_dominance_Q4" class="gt_row gt_left">Strongly Agree</td>
#> <td headers="Intergroup_dominance_Q5" class="gt_row gt_left">Strongly Agree</td>
#> <td headers="Intergroup_dominance_Q6" class="gt_row gt_left">Strongly Agree</td>
#> <td headers="Intergroup_dominance_Q7" class="gt_row gt_left">Strongly Agree</td>
#> <td headers="Intergroup_dominance_Q8" class="gt_row gt_left">Strongly Disagree</td>
#> <td headers="Antiegalitarian_Q1" class="gt_row gt_left">Strongly Disagree</td>
#> <td headers="Antiegalitarian_Q2" class="gt_row gt_left">Strongly Disagree</td>
#> <td headers="Antiegalitarian_Q3" class="gt_row gt_left">Strongly Disagree</td>
#> <td headers="Antiegalitarian_Q4" class="gt_row gt_left">Strongly Disagree</td>
#> <td headers="Antiegalitarian_Q5" class="gt_row gt_left">Neutral</td>
#> <td headers="Antiegalitarian_Q6" class="gt_row gt_left">Strongly Agree</td>
#> <td headers="Antiegalitarian_Q7" class="gt_row gt_left">Strongly Agree</td>
#> <td headers="Antiegalitarian_Q8" class="gt_row gt_left">Strongly Agree</td>
#> <td headers="SC0" class="gt_row gt_right">89</td></tr>
#>     <tr><td headers="ID" class="gt_row gt_right">134</td>
#> <td headers="Duration..in.seconds." class="gt_row gt_right">243</td>
#> <td headers="Q1" class="gt_row gt_right">NA</td>
#> <td headers="Q2" class="gt_row gt_right">5</td>
#> <td headers="Q3" class="gt_row gt_left">260</td>
#> <td headers="Q4" class="gt_row gt_left">365</td>
#> <td headers="Q5" class="gt_row gt_left">28</td>
#> <td headers="Q6" class="gt_row gt_left">71</td>
#> <td headers="Q7" class="gt_row gt_left">172</td>
#> <td headers="Intergroup_dominance_Q1" class="gt_row gt_left">Slightly Agree</td>
#> <td headers="Intergroup_dominance_Q2" class="gt_row gt_left">Somewhat Agree</td>
#> <td headers="Intergroup_dominance_Q3" class="gt_row gt_left">Strongly Agree</td>
#> <td headers="Intergroup_dominance_Q4" class="gt_row gt_left">Strongly Agree</td>
#> <td headers="Intergroup_dominance_Q5" class="gt_row gt_left">Strongly Agree</td>
#> <td headers="Intergroup_dominance_Q6" class="gt_row gt_left">Somewhat Disagree</td>
#> <td headers="Intergroup_dominance_Q7" class="gt_row gt_left">Neutral</td>
#> <td headers="Intergroup_dominance_Q8" class="gt_row gt_left">Somewhat Disagree</td>
#> <td headers="Antiegalitarian_Q1" class="gt_row gt_left">Strongly Disagree</td>
#> <td headers="Antiegalitarian_Q2" class="gt_row gt_left">Somewhat Agree</td>
#> <td headers="Antiegalitarian_Q3" class="gt_row gt_left">Neutral</td>
#> <td headers="Antiegalitarian_Q4" class="gt_row gt_left">Somewhat Agree</td>
#> <td headers="Antiegalitarian_Q5" class="gt_row gt_left">Slightly Disagree</td>
#> <td headers="Antiegalitarian_Q6" class="gt_row gt_left">Neutral</td>
#> <td headers="Antiegalitarian_Q7" class="gt_row gt_left">Strongly Agree</td>
#> <td headers="Antiegalitarian_Q8" class="gt_row gt_left">Neutral</td>
#> <td headers="SC0" class="gt_row gt_right">95</td></tr>
#>     <tr><td headers="ID" class="gt_row gt_right">135</td>
#> <td headers="Duration..in.seconds." class="gt_row gt_right">255</td>
#> <td headers="Q1" class="gt_row gt_right">NA</td>
#> <td headers="Q2" class="gt_row gt_right">7</td>
#> <td headers="Q3" class="gt_row gt_left">90</td>
#> <td headers="Q4" class="gt_row gt_left">110</td>
#> <td headers="Q5" class="gt_row gt_left">5</td>
#> <td headers="Q6" class="gt_row gt_left">68</td>
#> <td headers="Q7" class="gt_row gt_left">180</td>
#> <td headers="Intergroup_dominance_Q1" class="gt_row gt_left">Neutral</td>
#> <td headers="Intergroup_dominance_Q2" class="gt_row gt_left">Neutral</td>
#> <td headers="Intergroup_dominance_Q3" class="gt_row gt_left">Neutral</td>
#> <td headers="Intergroup_dominance_Q4" class="gt_row gt_left">Neutral</td>
#> <td headers="Intergroup_dominance_Q5" class="gt_row gt_left">Strongly Agree</td>
#> <td headers="Intergroup_dominance_Q6" class="gt_row gt_left">Neutral</td>
#> <td headers="Intergroup_dominance_Q7" class="gt_row gt_left">Strongly Agree</td>
#> <td headers="Intergroup_dominance_Q8" class="gt_row gt_left">Neutral</td>
#> <td headers="Antiegalitarian_Q1" class="gt_row gt_left">Neutral</td>
#> <td headers="Antiegalitarian_Q2" class="gt_row gt_left">Neutral</td>
#> <td headers="Antiegalitarian_Q3" class="gt_row gt_left">Neutral</td>
#> <td headers="Antiegalitarian_Q4" class="gt_row gt_left">Neutral</td>
#> <td headers="Antiegalitarian_Q5" class="gt_row gt_left">Neutral</td>
#> <td headers="Antiegalitarian_Q6" class="gt_row gt_left">Neutral</td>
#> <td headers="Antiegalitarian_Q7" class="gt_row gt_left">Neutral</td>
#> <td headers="Antiegalitarian_Q8" class="gt_row gt_left">Neutral</td>
#> <td headers="SC0" class="gt_row gt_right">82</td></tr>
#>     <tr><td headers="ID" class="gt_row gt_right">136</td>
#> <td headers="Duration..in.seconds." class="gt_row gt_right">246</td>
#> <td headers="Q1" class="gt_row gt_right">7</td>
#> <td headers="Q2" class="gt_row gt_right">5</td>
#> <td headers="Q3" class="gt_row gt_left">I don't bench</td>
#> <td headers="Q4" class="gt_row gt_left">I don't Deadlift</td>
#> <td headers="Q5" class="gt_row gt_left">6</td>
#> <td headers="Q6" class="gt_row gt_left">5'4</td>
#> <td headers="Q7" class="gt_row gt_left">200</td>
#> <td headers="Intergroup_dominance_Q1" class="gt_row gt_left">Neutral</td>
#> <td headers="Intergroup_dominance_Q2" class="gt_row gt_left">Somewhat Disagree</td>
#> <td headers="Intergroup_dominance_Q3" class="gt_row gt_left">Neutral</td>
#> <td headers="Intergroup_dominance_Q4" class="gt_row gt_left">Neutral</td>
#> <td headers="Intergroup_dominance_Q5" class="gt_row gt_left">Strongly Agree</td>
#> <td headers="Intergroup_dominance_Q6" class="gt_row gt_left">Strongly Agree</td>
#> <td headers="Intergroup_dominance_Q7" class="gt_row gt_left">Strongly Agree</td>
#> <td headers="Intergroup_dominance_Q8" class="gt_row gt_left">Neutral</td>
#> <td headers="Antiegalitarian_Q1" class="gt_row gt_left">Strongly Disagree</td>
#> <td headers="Antiegalitarian_Q2" class="gt_row gt_left">Somewhat Disagree</td>
#> <td headers="Antiegalitarian_Q3" class="gt_row gt_left">Somewhat Disagree</td>
#> <td headers="Antiegalitarian_Q4" class="gt_row gt_left">Strongly Disagree</td>
#> <td headers="Antiegalitarian_Q5" class="gt_row gt_left">Strongly Agree</td>
#> <td headers="Antiegalitarian_Q6" class="gt_row gt_left">Somewhat Agree</td>
#> <td headers="Antiegalitarian_Q7" class="gt_row gt_left">Strongly Agree</td>
#> <td headers="Antiegalitarian_Q8" class="gt_row gt_left">Somewhat Agree</td>
#> <td headers="SC0" class="gt_row gt_right">88</td></tr>
#>     <tr><td headers="ID" class="gt_row gt_right">137</td>
#> <td headers="Duration..in.seconds." class="gt_row gt_right">186</td>
#> <td headers="Q1" class="gt_row gt_right">NA</td>
#> <td headers="Q2" class="gt_row gt_right">7</td>
#> <td headers="Q3" class="gt_row gt_left">225</td>
#> <td headers="Q4" class="gt_row gt_left">315</td>
#> <td headers="Q5" class="gt_row gt_left">21</td>
#> <td headers="Q6" class="gt_row gt_left">71</td>
#> <td headers="Q7" class="gt_row gt_left">190</td>
#> <td headers="Intergroup_dominance_Q1" class="gt_row gt_left">Strongly Agree</td>
#> <td headers="Intergroup_dominance_Q2" class="gt_row gt_left">Strongly Agree</td>
#> <td headers="Intergroup_dominance_Q3" class="gt_row gt_left">Strongly Agree</td>
#> <td headers="Intergroup_dominance_Q4" class="gt_row gt_left">Strongly Agree</td>
#> <td headers="Intergroup_dominance_Q5" class="gt_row gt_left">Strongly Agree</td>
#> <td headers="Intergroup_dominance_Q6" class="gt_row gt_left">Somewhat Agree</td>
#> <td headers="Intergroup_dominance_Q7" class="gt_row gt_left">Somewhat Disagree</td>
#> <td headers="Intergroup_dominance_Q8" class="gt_row gt_left">Strongly Disagree</td>
#> <td headers="Antiegalitarian_Q1" class="gt_row gt_left">Slightly Agree</td>
#> <td headers="Antiegalitarian_Q2" class="gt_row gt_left">Slightly Agree</td>
#> <td headers="Antiegalitarian_Q3" class="gt_row gt_left">Somewhat Agree</td>
#> <td headers="Antiegalitarian_Q4" class="gt_row gt_left">Slightly Agree</td>
#> <td headers="Antiegalitarian_Q5" class="gt_row gt_left">Somewhat Disagree</td>
#> <td headers="Antiegalitarian_Q6" class="gt_row gt_left">Slightly Disagree</td>
#> <td headers="Antiegalitarian_Q7" class="gt_row gt_left">Somewhat Agree</td>
#> <td headers="Antiegalitarian_Q8" class="gt_row gt_left">Somewhat Disagree</td>
#> <td headers="SC0" class="gt_row gt_right">88</td></tr>
#>     <tr><td headers="ID" class="gt_row gt_right">138</td>
#> <td headers="Duration..in.seconds." class="gt_row gt_right">388</td>
#> <td headers="Q1" class="gt_row gt_right">5</td>
#> <td headers="Q2" class="gt_row gt_right">7</td>
#> <td headers="Q3" class="gt_row gt_left">Dont know</td>
#> <td headers="Q4" class="gt_row gt_left">70 yrs old dont do this</td>
#> <td headers="Q5" class="gt_row gt_left">0</td>
#> <td headers="Q6" class="gt_row gt_left">5'3"</td>
#> <td headers="Q7" class="gt_row gt_left">130</td>
#> <td headers="Intergroup_dominance_Q1" class="gt_row gt_left">Strongly Disagree</td>
#> <td headers="Intergroup_dominance_Q2" class="gt_row gt_left">Somewhat Disagree</td>
#> <td headers="Intergroup_dominance_Q3" class="gt_row gt_left">Somewhat Agree</td>
#> <td headers="Intergroup_dominance_Q4" class="gt_row gt_left">Somewhat Agree</td>
#> <td headers="Intergroup_dominance_Q5" class="gt_row gt_left">Neutral</td>
#> <td headers="Intergroup_dominance_Q6" class="gt_row gt_left">Slightly Disagree</td>
#> <td headers="Intergroup_dominance_Q7" class="gt_row gt_left">Slightly Disagree</td>
#> <td headers="Intergroup_dominance_Q8" class="gt_row gt_left">Somewhat Disagree</td>
#> <td headers="Antiegalitarian_Q1" class="gt_row gt_left">Strongly Disagree</td>
#> <td headers="Antiegalitarian_Q2" class="gt_row gt_left">Strongly Disagree</td>
#> <td headers="Antiegalitarian_Q3" class="gt_row gt_left">Strongly Disagree</td>
#> <td headers="Antiegalitarian_Q4" class="gt_row gt_left">Strongly Disagree</td>
#> <td headers="Antiegalitarian_Q5" class="gt_row gt_left">Slightly Disagree</td>
#> <td headers="Antiegalitarian_Q6" class="gt_row gt_left">Strongly Agree</td>
#> <td headers="Antiegalitarian_Q7" class="gt_row gt_left">Strongly Agree</td>
#> <td headers="Antiegalitarian_Q8" class="gt_row gt_left">Somewhat Agree</td>
#> <td headers="SC0" class="gt_row gt_right">64</td></tr>
#>     <tr><td headers="ID" class="gt_row gt_right">139</td>
#> <td headers="Duration..in.seconds." class="gt_row gt_right">268</td>
#> <td headers="Q1" class="gt_row gt_right">7</td>
#> <td headers="Q2" class="gt_row gt_right">7</td>
#> <td headers="Q3" class="gt_row gt_left">150</td>
#> <td headers="Q4" class="gt_row gt_left">300</td>
#> <td headers="Q5" class="gt_row gt_left">2</td>
#> <td headers="Q6" class="gt_row gt_left">65</td>
#> <td headers="Q7" class="gt_row gt_left">185</td>
#> <td headers="Intergroup_dominance_Q1" class="gt_row gt_left">Neutral</td>
#> <td headers="Intergroup_dominance_Q2" class="gt_row gt_left">Strongly Agree</td>
#> <td headers="Intergroup_dominance_Q3" class="gt_row gt_left">Slightly Agree</td>
#> <td headers="Intergroup_dominance_Q4" class="gt_row gt_left">Strongly Agree</td>
#> <td headers="Intergroup_dominance_Q5" class="gt_row gt_left">Somewhat Agree</td>
#> <td headers="Intergroup_dominance_Q6" class="gt_row gt_left">Slightly Agree</td>
#> <td headers="Intergroup_dominance_Q7" class="gt_row gt_left">Somewhat Disagree</td>
#> <td headers="Intergroup_dominance_Q8" class="gt_row gt_left">Neutral</td>
#> <td headers="Antiegalitarian_Q1" class="gt_row gt_left">Somewhat Agree</td>
#> <td headers="Antiegalitarian_Q2" class="gt_row gt_left">Somewhat Agree</td>
#> <td headers="Antiegalitarian_Q3" class="gt_row gt_left">Somewhat Agree</td>
#> <td headers="Antiegalitarian_Q4" class="gt_row gt_left">Strongly Agree</td>
#> <td headers="Antiegalitarian_Q5" class="gt_row gt_left">Neutral</td>
#> <td headers="Antiegalitarian_Q6" class="gt_row gt_left">Neutral</td>
#> <td headers="Antiegalitarian_Q7" class="gt_row gt_left">Somewhat Disagree</td>
#> <td headers="Antiegalitarian_Q8" class="gt_row gt_left">Neutral</td>
#> <td headers="SC0" class="gt_row gt_right">92</td></tr>
#>     <tr><td headers="ID" class="gt_row gt_right">140</td>
#> <td headers="Duration..in.seconds." class="gt_row gt_right">209</td>
#> <td headers="Q1" class="gt_row gt_right">9</td>
#> <td headers="Q2" class="gt_row gt_right">5</td>
#> <td headers="Q3" class="gt_row gt_left">255</td>
#> <td headers="Q4" class="gt_row gt_left">415</td>
#> <td headers="Q5" class="gt_row gt_left">12</td>
#> <td headers="Q6" class="gt_row gt_left">72</td>
#> <td headers="Q7" class="gt_row gt_left">230</td>
#> <td headers="Intergroup_dominance_Q1" class="gt_row gt_left">Strongly Disagree</td>
#> <td headers="Intergroup_dominance_Q2" class="gt_row gt_left">Strongly Disagree</td>
#> <td headers="Intergroup_dominance_Q3" class="gt_row gt_left">Strongly Disagree</td>
#> <td headers="Intergroup_dominance_Q4" class="gt_row gt_left">Strongly Disagree</td>
#> <td headers="Intergroup_dominance_Q5" class="gt_row gt_left">Strongly Agree</td>
#> <td headers="Intergroup_dominance_Q6" class="gt_row gt_left">Somewhat Agree</td>
#> <td headers="Intergroup_dominance_Q7" class="gt_row gt_left">Strongly Agree</td>
#> <td headers="Intergroup_dominance_Q8" class="gt_row gt_left">Somewhat Agree</td>
#> <td headers="Antiegalitarian_Q1" class="gt_row gt_left">Strongly Disagree</td>
#> <td headers="Antiegalitarian_Q2" class="gt_row gt_left">Strongly Disagree</td>
#> <td headers="Antiegalitarian_Q3" class="gt_row gt_left">Strongly Disagree</td>
#> <td headers="Antiegalitarian_Q4" class="gt_row gt_left">Strongly Disagree</td>
#> <td headers="Antiegalitarian_Q5" class="gt_row gt_left">Strongly Agree</td>
#> <td headers="Antiegalitarian_Q6" class="gt_row gt_left">Strongly Agree</td>
#> <td headers="Antiegalitarian_Q7" class="gt_row gt_left">Strongly Agree</td>
#> <td headers="Antiegalitarian_Q8" class="gt_row gt_left">Strongly Agree</td>
#> <td headers="SC0" class="gt_row gt_right">73</td></tr>
#>   </tbody>
#>   
#>   
#> </table>
#> </div>
```
