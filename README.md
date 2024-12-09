
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
#> Installing package into 'C:/Users/alvlo/AppData/Local/Temp/RtmpUlB0Th/temp_libpath3b5421b3755b'
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
#> The number of rows is different: df1 = 32 and inner_join = 30 
#>  Revise if any IDs were incorrectly modified and/or mispelled between 'df1' and 'df2'.Rows from 'df1' not included in the inner join by ID  are printed in the following table:
```

<div id="lomkcwfoys" style="padding-left:0px;padding-right:0px;padding-top:10px;padding-bottom:10px;overflow-x:auto;overflow-y:auto;width:auto;height:auto;">
<style>#lomkcwfoys table {
  font-family: system-ui, 'Segoe UI', Roboto, Helvetica, Arial, sans-serif, 'Apple Color Emoji', 'Segoe UI Emoji', 'Segoe UI Symbol', 'Noto Color Emoji';
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
}
&#10;#lomkcwfoys thead, #lomkcwfoys tbody, #lomkcwfoys tfoot, #lomkcwfoys tr, #lomkcwfoys td, #lomkcwfoys th {
  border-style: none;
}
&#10;#lomkcwfoys p {
  margin: 0;
  padding: 0;
}
&#10;#lomkcwfoys .gt_table {
  display: table;
  border-collapse: collapse;
  line-height: normal;
  margin-left: auto;
  margin-right: auto;
  color: #333333;
  font-size: 16px;
  font-weight: normal;
  font-style: normal;
  background-color: #FFFFFF;
  width: auto;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #A8A8A8;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #A8A8A8;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
}
&#10;#lomkcwfoys .gt_caption {
  padding-top: 4px;
  padding-bottom: 4px;
}
&#10;#lomkcwfoys .gt_title {
  color: #333333;
  font-size: 125%;
  font-weight: initial;
  padding-top: 4px;
  padding-bottom: 4px;
  padding-left: 5px;
  padding-right: 5px;
  border-bottom-color: #FFFFFF;
  border-bottom-width: 0;
}
&#10;#lomkcwfoys .gt_subtitle {
  color: #333333;
  font-size: 85%;
  font-weight: initial;
  padding-top: 3px;
  padding-bottom: 5px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-color: #FFFFFF;
  border-top-width: 0;
}
&#10;#lomkcwfoys .gt_heading {
  background-color: #FFFFFF;
  text-align: center;
  border-bottom-color: #FFFFFF;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
}
&#10;#lomkcwfoys .gt_bottom_border {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}
&#10;#lomkcwfoys .gt_col_headings {
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
}
&#10;#lomkcwfoys .gt_col_heading {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: normal;
  text-transform: inherit;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: bottom;
  padding-top: 5px;
  padding-bottom: 6px;
  padding-left: 5px;
  padding-right: 5px;
  overflow-x: hidden;
}
&#10;#lomkcwfoys .gt_column_spanner_outer {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: normal;
  text-transform: inherit;
  padding-top: 0;
  padding-bottom: 0;
  padding-left: 4px;
  padding-right: 4px;
}
&#10;#lomkcwfoys .gt_column_spanner_outer:first-child {
  padding-left: 0;
}
&#10;#lomkcwfoys .gt_column_spanner_outer:last-child {
  padding-right: 0;
}
&#10;#lomkcwfoys .gt_column_spanner {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  vertical-align: bottom;
  padding-top: 5px;
  padding-bottom: 5px;
  overflow-x: hidden;
  display: inline-block;
  width: 100%;
}
&#10;#lomkcwfoys .gt_spanner_row {
  border-bottom-style: hidden;
}
&#10;#lomkcwfoys .gt_group_heading {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: middle;
  text-align: left;
}
&#10;#lomkcwfoys .gt_empty_group_heading {
  padding: 0.5px;
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  vertical-align: middle;
}
&#10;#lomkcwfoys .gt_from_md > :first-child {
  margin-top: 0;
}
&#10;#lomkcwfoys .gt_from_md > :last-child {
  margin-bottom: 0;
}
&#10;#lomkcwfoys .gt_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  margin: 10px;
  border-top-style: solid;
  border-top-width: 1px;
  border-top-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: middle;
  overflow-x: hidden;
}
&#10;#lomkcwfoys .gt_stub {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-right-style: solid;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  padding-left: 5px;
  padding-right: 5px;
}
&#10;#lomkcwfoys .gt_stub_row_group {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-right-style: solid;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  padding-left: 5px;
  padding-right: 5px;
  vertical-align: top;
}
&#10;#lomkcwfoys .gt_row_group_first td {
  border-top-width: 2px;
}
&#10;#lomkcwfoys .gt_row_group_first th {
  border-top-width: 2px;
}
&#10;#lomkcwfoys .gt_summary_row {
  color: #333333;
  background-color: #FFFFFF;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}
&#10;#lomkcwfoys .gt_first_summary_row {
  border-top-style: solid;
  border-top-color: #D3D3D3;
}
&#10;#lomkcwfoys .gt_first_summary_row.thick {
  border-top-width: 2px;
}
&#10;#lomkcwfoys .gt_last_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}
&#10;#lomkcwfoys .gt_grand_summary_row {
  color: #333333;
  background-color: #FFFFFF;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}
&#10;#lomkcwfoys .gt_first_grand_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-style: double;
  border-top-width: 6px;
  border-top-color: #D3D3D3;
}
&#10;#lomkcwfoys .gt_last_grand_summary_row_top {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-bottom-style: double;
  border-bottom-width: 6px;
  border-bottom-color: #D3D3D3;
}
&#10;#lomkcwfoys .gt_striped {
  background-color: rgba(128, 128, 128, 0.05);
}
&#10;#lomkcwfoys .gt_table_body {
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}
&#10;#lomkcwfoys .gt_footnotes {
  color: #333333;
  background-color: #FFFFFF;
  border-bottom-style: none;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
}
&#10;#lomkcwfoys .gt_footnote {
  margin: 0px;
  font-size: 90%;
  padding-top: 4px;
  padding-bottom: 4px;
  padding-left: 5px;
  padding-right: 5px;
}
&#10;#lomkcwfoys .gt_sourcenotes {
  color: #333333;
  background-color: #FFFFFF;
  border-bottom-style: none;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
}
&#10;#lomkcwfoys .gt_sourcenote {
  font-size: 90%;
  padding-top: 4px;
  padding-bottom: 4px;
  padding-left: 5px;
  padding-right: 5px;
}
&#10;#lomkcwfoys .gt_left {
  text-align: left;
}
&#10;#lomkcwfoys .gt_center {
  text-align: center;
}
&#10;#lomkcwfoys .gt_right {
  text-align: right;
  font-variant-numeric: tabular-nums;
}
&#10;#lomkcwfoys .gt_font_normal {
  font-weight: normal;
}
&#10;#lomkcwfoys .gt_font_bold {
  font-weight: bold;
}
&#10;#lomkcwfoys .gt_font_italic {
  font-style: italic;
}
&#10;#lomkcwfoys .gt_super {
  font-size: 65%;
}
&#10;#lomkcwfoys .gt_footnote_marks {
  font-size: 75%;
  vertical-align: 0.4em;
  position: initial;
}
&#10;#lomkcwfoys .gt_asterisk {
  font-size: 100%;
  vertical-align: 0;
}
&#10;#lomkcwfoys .gt_indent_1 {
  text-indent: 5px;
}
&#10;#lomkcwfoys .gt_indent_2 {
  text-indent: 10px;
}
&#10;#lomkcwfoys .gt_indent_3 {
  text-indent: 15px;
}
&#10;#lomkcwfoys .gt_indent_4 {
  text-indent: 20px;
}
&#10;#lomkcwfoys .gt_indent_5 {
  text-indent: 25px;
}
&#10;#lomkcwfoys .katex-display {
  display: inline-flex !important;
  margin-bottom: 0.75em !important;
}
&#10;#lomkcwfoys div.Reactable > div.rt-table > div.rt-thead > div.rt-tr.rt-tr-group-header > div.rt-th-group:after {
  height: 0px !important;
}
</style>
<table class="gt_table" data-quarto-disable-processing="false" data-quarto-bootstrap="false">
  <thead>
    <tr class="gt_heading">
      <td colspan="5" class="gt_heading gt_title gt_font_normal gt_bottom_border" style>Mislabeled Observation IDs</td>
    </tr>
    &#10;    <tr class="gt_col_headings">
      <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1" scope="col" id="a::stub"></th>
      <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1" scope="col" id="ID">ID</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1" scope="col" id="Sex">Sex</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="Num">Num</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1" scope="col" id="Treatment">Treatment</th>
    </tr>
  </thead>
  <tbody class="gt_table_body">
    <tr><th id="stub_1_1" scope="row" class="gt_row gt_right gt_stub">1</th>
<td headers="stub_1_1 ID" class="gt_row gt_left">C57BL6J_M_5</td>
<td headers="stub_1_1 Sex" class="gt_row gt_left">M</td>
<td headers="stub_1_1 Num" class="gt_row gt_right">5</td>
<td headers="stub_1_1 Treatment" class="gt_row gt_left">Plac</td></tr>
    <tr><th id="stub_1_2" scope="row" class="gt_row gt_right gt_stub">2</th>
<td headers="stub_1_2 ID" class="gt_row gt_left">C57BL6J_F_26</td>
<td headers="stub_1_2 Sex" class="gt_row gt_left">F</td>
<td headers="stub_1_2 Num" class="gt_row gt_right">26</td>
<td headers="stub_1_2 Treatment" class="gt_row gt_left">Tmt</td></tr>
  </tbody>
  &#10;  
</table>
</div>

In the context of mouse data, the researcher might mistype a character
when inputting data for a numeric mouse body weight. To flag such
issues, data_formatter() can be used to output a table of the rows where
non-numeric data is found.

``` r
data_formatter(body_weight, c("Body_Weight_1", "Body_Weight_2", "Body_Weight_3"))
#> [1] "There are some columns identified with rows containing potential non-numeric values:"
#> <div id="cmswrkxprl" style="padding-left:0px;padding-right:0px;padding-top:10px;padding-bottom:10px;overflow-x:auto;overflow-y:auto;width:auto;height:auto;">
#>   <style>#cmswrkxprl table {
#>   font-family: system-ui, 'Segoe UI', Roboto, Helvetica, Arial, sans-serif, 'Apple Color Emoji', 'Segoe UI Emoji', 'Segoe UI Symbol', 'Noto Color Emoji';
#>   -webkit-font-smoothing: antialiased;
#>   -moz-osx-font-smoothing: grayscale;
#> }
#> 
#> #cmswrkxprl thead, #cmswrkxprl tbody, #cmswrkxprl tfoot, #cmswrkxprl tr, #cmswrkxprl td, #cmswrkxprl th {
#>   border-style: none;
#> }
#> 
#> #cmswrkxprl p {
#>   margin: 0;
#>   padding: 0;
#> }
#> 
#> #cmswrkxprl .gt_table {
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
#> #cmswrkxprl .gt_caption {
#>   padding-top: 4px;
#>   padding-bottom: 4px;
#> }
#> 
#> #cmswrkxprl .gt_title {
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
#> #cmswrkxprl .gt_subtitle {
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
#> #cmswrkxprl .gt_heading {
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
#> #cmswrkxprl .gt_bottom_border {
#>   border-bottom-style: solid;
#>   border-bottom-width: 2px;
#>   border-bottom-color: #D3D3D3;
#> }
#> 
#> #cmswrkxprl .gt_col_headings {
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
#> #cmswrkxprl .gt_col_heading {
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
#> #cmswrkxprl .gt_column_spanner_outer {
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
#> #cmswrkxprl .gt_column_spanner_outer:first-child {
#>   padding-left: 0;
#> }
#> 
#> #cmswrkxprl .gt_column_spanner_outer:last-child {
#>   padding-right: 0;
#> }
#> 
#> #cmswrkxprl .gt_column_spanner {
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
#> #cmswrkxprl .gt_spanner_row {
#>   border-bottom-style: hidden;
#> }
#> 
#> #cmswrkxprl .gt_group_heading {
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
#> #cmswrkxprl .gt_empty_group_heading {
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
#> #cmswrkxprl .gt_from_md > :first-child {
#>   margin-top: 0;
#> }
#> 
#> #cmswrkxprl .gt_from_md > :last-child {
#>   margin-bottom: 0;
#> }
#> 
#> #cmswrkxprl .gt_row {
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
#> #cmswrkxprl .gt_stub {
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
#> #cmswrkxprl .gt_stub_row_group {
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
#> #cmswrkxprl .gt_row_group_first td {
#>   border-top-width: 2px;
#> }
#> 
#> #cmswrkxprl .gt_row_group_first th {
#>   border-top-width: 2px;
#> }
#> 
#> #cmswrkxprl .gt_summary_row {
#>   color: #333333;
#>   background-color: #FFFFFF;
#>   text-transform: inherit;
#>   padding-top: 8px;
#>   padding-bottom: 8px;
#>   padding-left: 5px;
#>   padding-right: 5px;
#> }
#> 
#> #cmswrkxprl .gt_first_summary_row {
#>   border-top-style: solid;
#>   border-top-color: #D3D3D3;
#> }
#> 
#> #cmswrkxprl .gt_first_summary_row.thick {
#>   border-top-width: 2px;
#> }
#> 
#> #cmswrkxprl .gt_last_summary_row {
#>   padding-top: 8px;
#>   padding-bottom: 8px;
#>   padding-left: 5px;
#>   padding-right: 5px;
#>   border-bottom-style: solid;
#>   border-bottom-width: 2px;
#>   border-bottom-color: #D3D3D3;
#> }
#> 
#> #cmswrkxprl .gt_grand_summary_row {
#>   color: #333333;
#>   background-color: #FFFFFF;
#>   text-transform: inherit;
#>   padding-top: 8px;
#>   padding-bottom: 8px;
#>   padding-left: 5px;
#>   padding-right: 5px;
#> }
#> 
#> #cmswrkxprl .gt_first_grand_summary_row {
#>   padding-top: 8px;
#>   padding-bottom: 8px;
#>   padding-left: 5px;
#>   padding-right: 5px;
#>   border-top-style: double;
#>   border-top-width: 6px;
#>   border-top-color: #D3D3D3;
#> }
#> 
#> #cmswrkxprl .gt_last_grand_summary_row_top {
#>   padding-top: 8px;
#>   padding-bottom: 8px;
#>   padding-left: 5px;
#>   padding-right: 5px;
#>   border-bottom-style: double;
#>   border-bottom-width: 6px;
#>   border-bottom-color: #D3D3D3;
#> }
#> 
#> #cmswrkxprl .gt_striped {
#>   background-color: rgba(128, 128, 128, 0.05);
#> }
#> 
#> #cmswrkxprl .gt_table_body {
#>   border-top-style: solid;
#>   border-top-width: 2px;
#>   border-top-color: #D3D3D3;
#>   border-bottom-style: solid;
#>   border-bottom-width: 2px;
#>   border-bottom-color: #D3D3D3;
#> }
#> 
#> #cmswrkxprl .gt_footnotes {
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
#> #cmswrkxprl .gt_footnote {
#>   margin: 0px;
#>   font-size: 90%;
#>   padding-top: 4px;
#>   padding-bottom: 4px;
#>   padding-left: 5px;
#>   padding-right: 5px;
#> }
#> 
#> #cmswrkxprl .gt_sourcenotes {
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
#> #cmswrkxprl .gt_sourcenote {
#>   font-size: 90%;
#>   padding-top: 4px;
#>   padding-bottom: 4px;
#>   padding-left: 5px;
#>   padding-right: 5px;
#> }
#> 
#> #cmswrkxprl .gt_left {
#>   text-align: left;
#> }
#> 
#> #cmswrkxprl .gt_center {
#>   text-align: center;
#> }
#> 
#> #cmswrkxprl .gt_right {
#>   text-align: right;
#>   font-variant-numeric: tabular-nums;
#> }
#> 
#> #cmswrkxprl .gt_font_normal {
#>   font-weight: normal;
#> }
#> 
#> #cmswrkxprl .gt_font_bold {
#>   font-weight: bold;
#> }
#> 
#> #cmswrkxprl .gt_font_italic {
#>   font-style: italic;
#> }
#> 
#> #cmswrkxprl .gt_super {
#>   font-size: 65%;
#> }
#> 
#> #cmswrkxprl .gt_footnote_marks {
#>   font-size: 75%;
#>   vertical-align: 0.4em;
#>   position: initial;
#> }
#> 
#> #cmswrkxprl .gt_asterisk {
#>   font-size: 100%;
#>   vertical-align: 0;
#> }
#> 
#> #cmswrkxprl .gt_indent_1 {
#>   text-indent: 5px;
#> }
#> 
#> #cmswrkxprl .gt_indent_2 {
#>   text-indent: 10px;
#> }
#> 
#> #cmswrkxprl .gt_indent_3 {
#>   text-indent: 15px;
#> }
#> 
#> #cmswrkxprl .gt_indent_4 {
#>   text-indent: 20px;
#> }
#> 
#> #cmswrkxprl .gt_indent_5 {
#>   text-indent: 25px;
#> }
#> 
#> #cmswrkxprl .katex-display {
#>   display: inline-flex !important;
#>   margin-bottom: 0.75em !important;
#> }
#> 
#> #cmswrkxprl div.Reactable > div.rt-table > div.rt-thead > div.rt-tr.rt-tr-group-header > div.rt-th-group:after {
#>   height: 0px !important;
#> }
#> </style>
#>   <table class="gt_table" data-quarto-disable-processing="false" data-quarto-bootstrap="false">
#>   <thead>
#>     <tr class="gt_heading">
#>       <td colspan="8" class="gt_heading gt_title gt_font_normal gt_bottom_border" style>Rows Containing Non-Numeric Values</td>
#>     </tr>
#>     
#>     <tr class="gt_col_headings">
#>       <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1" scope="col" id="a::stub"></th>
#>       <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1" scope="col" id="ID">ID</th>
#>       <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="Body_Weight_1">Body_Weight_1</th>
#>       <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="Date_Body_Weight_1">Date_Body_Weight_1</th>
#>       <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="Body_Weight_2">Body_Weight_2</th>
#>       <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="Date_Body_Weight_2">Date_Body_Weight_2</th>
#>       <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1" scope="col" id="Body_Weight_3">Body_Weight_3</th>
#>       <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="Date_Body_Weight_3">Date_Body_Weight_3</th>
#>     </tr>
#>   </thead>
#>   <tbody class="gt_table_body">
#>     <tr><th id="stub_1_1" scope="row" class="gt_row gt_right gt_stub">1</th>
#> <td headers="stub_1_1 ID" class="gt_row gt_left">C57BL6J_F_15</td>
#> <td headers="stub_1_1 Body_Weight_1" class="gt_row gt_right">'20.01614</td>
#> <td headers="stub_1_1 Date_Body_Weight_1" class="gt_row gt_right">10/5/2024</td>
#> <td headers="stub_1_1 Body_Weight_2" class="gt_row gt_right">19.65</td>
#> <td headers="stub_1_1 Date_Body_Weight_2" class="gt_row gt_right">10/12/2024</td>
#> <td headers="stub_1_1 Body_Weight_3" class="gt_row gt_left">20.42</td>
#> <td headers="stub_1_1 Date_Body_Weight_3" class="gt_row gt_right">10/19/2024</td></tr>
#>     <tr><th id="stub_1_2" scope="row" class="gt_row gt_right gt_stub">2</th>
#> <td headers="stub_1_2 ID" class="gt_row gt_left">C57BL6J_F_31</td>
#> <td headers="stub_1_2 Body_Weight_1" class="gt_row gt_right">20.79</td>
#> <td headers="stub_1_2 Date_Body_Weight_1" class="gt_row gt_right">10/5/2024</td>
#> <td headers="stub_1_2 Body_Weight_2" class="gt_row gt_right">20.84</td>
#> <td headers="stub_1_2 Date_Body_Weight_2" class="gt_row gt_right">10/12/2024</td>
#> <td headers="stub_1_2 Body_Weight_3" class="gt_row gt_left">Dead</td>
#> <td headers="stub_1_2 Date_Body_Weight_3" class="gt_row gt_right">10/19/2024</td></tr>
#>   </tbody>
#>   
#>   
#> </table>
#> </div>
```

In the context of mouse data, if a mice is particularly large or small,
this could indicate to scientists that they should check on this mouse
to ensure that it has proper cage functioning and to consider possibly
excluding this mouse from the data analysis. To detect such outliers,
outlier_detector() can be applied.

``` r
outlier_detector(data=body_weight, y_var="Body_Weight_1")
#> Warning in outlier_detector(data = body_weight, y_var = "Body_Weight_1"): NAs
#> introduced by coercion
#> Warning: One or more of the rows in the specified column contains a character.
#>  outlier_detector will drop this row as an NA and continue calculating outliers.
#> 
#> Your inputted column is suspected of containing outliers.
#>  Outliers were calculated as any values being 2.5 standard deviations away from the mean.
#>  The suspected outliers and their corresponding Row_Number are printed in the following table.
#>  Additionally review the scatterplot for confirmation.
#> <div id="bafsyshahc" style="padding-left:0px;padding-right:0px;padding-top:10px;padding-bottom:10px;overflow-x:auto;overflow-y:auto;width:auto;height:auto;">
#>   <style>#bafsyshahc table {
#>   font-family: system-ui, 'Segoe UI', Roboto, Helvetica, Arial, sans-serif, 'Apple Color Emoji', 'Segoe UI Emoji', 'Segoe UI Symbol', 'Noto Color Emoji';
#>   -webkit-font-smoothing: antialiased;
#>   -moz-osx-font-smoothing: grayscale;
#> }
#> 
#> #bafsyshahc thead, #bafsyshahc tbody, #bafsyshahc tfoot, #bafsyshahc tr, #bafsyshahc td, #bafsyshahc th {
#>   border-style: none;
#> }
#> 
#> #bafsyshahc p {
#>   margin: 0;
#>   padding: 0;
#> }
#> 
#> #bafsyshahc .gt_table {
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
#> #bafsyshahc .gt_caption {
#>   padding-top: 4px;
#>   padding-bottom: 4px;
#> }
#> 
#> #bafsyshahc .gt_title {
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
#> #bafsyshahc .gt_subtitle {
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
#> #bafsyshahc .gt_heading {
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
#> #bafsyshahc .gt_bottom_border {
#>   border-bottom-style: solid;
#>   border-bottom-width: 2px;
#>   border-bottom-color: #D3D3D3;
#> }
#> 
#> #bafsyshahc .gt_col_headings {
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
#> #bafsyshahc .gt_col_heading {
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
#> #bafsyshahc .gt_column_spanner_outer {
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
#> #bafsyshahc .gt_column_spanner_outer:first-child {
#>   padding-left: 0;
#> }
#> 
#> #bafsyshahc .gt_column_spanner_outer:last-child {
#>   padding-right: 0;
#> }
#> 
#> #bafsyshahc .gt_column_spanner {
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
#> #bafsyshahc .gt_spanner_row {
#>   border-bottom-style: hidden;
#> }
#> 
#> #bafsyshahc .gt_group_heading {
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
#> #bafsyshahc .gt_empty_group_heading {
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
#> #bafsyshahc .gt_from_md > :first-child {
#>   margin-top: 0;
#> }
#> 
#> #bafsyshahc .gt_from_md > :last-child {
#>   margin-bottom: 0;
#> }
#> 
#> #bafsyshahc .gt_row {
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
#> #bafsyshahc .gt_stub {
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
#> #bafsyshahc .gt_stub_row_group {
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
#> #bafsyshahc .gt_row_group_first td {
#>   border-top-width: 2px;
#> }
#> 
#> #bafsyshahc .gt_row_group_first th {
#>   border-top-width: 2px;
#> }
#> 
#> #bafsyshahc .gt_summary_row {
#>   color: #333333;
#>   background-color: #FFFFFF;
#>   text-transform: inherit;
#>   padding-top: 8px;
#>   padding-bottom: 8px;
#>   padding-left: 5px;
#>   padding-right: 5px;
#> }
#> 
#> #bafsyshahc .gt_first_summary_row {
#>   border-top-style: solid;
#>   border-top-color: #D3D3D3;
#> }
#> 
#> #bafsyshahc .gt_first_summary_row.thick {
#>   border-top-width: 2px;
#> }
#> 
#> #bafsyshahc .gt_last_summary_row {
#>   padding-top: 8px;
#>   padding-bottom: 8px;
#>   padding-left: 5px;
#>   padding-right: 5px;
#>   border-bottom-style: solid;
#>   border-bottom-width: 2px;
#>   border-bottom-color: #D3D3D3;
#> }
#> 
#> #bafsyshahc .gt_grand_summary_row {
#>   color: #333333;
#>   background-color: #FFFFFF;
#>   text-transform: inherit;
#>   padding-top: 8px;
#>   padding-bottom: 8px;
#>   padding-left: 5px;
#>   padding-right: 5px;
#> }
#> 
#> #bafsyshahc .gt_first_grand_summary_row {
#>   padding-top: 8px;
#>   padding-bottom: 8px;
#>   padding-left: 5px;
#>   padding-right: 5px;
#>   border-top-style: double;
#>   border-top-width: 6px;
#>   border-top-color: #D3D3D3;
#> }
#> 
#> #bafsyshahc .gt_last_grand_summary_row_top {
#>   padding-top: 8px;
#>   padding-bottom: 8px;
#>   padding-left: 5px;
#>   padding-right: 5px;
#>   border-bottom-style: double;
#>   border-bottom-width: 6px;
#>   border-bottom-color: #D3D3D3;
#> }
#> 
#> #bafsyshahc .gt_striped {
#>   background-color: rgba(128, 128, 128, 0.05);
#> }
#> 
#> #bafsyshahc .gt_table_body {
#>   border-top-style: solid;
#>   border-top-width: 2px;
#>   border-top-color: #D3D3D3;
#>   border-bottom-style: solid;
#>   border-bottom-width: 2px;
#>   border-bottom-color: #D3D3D3;
#> }
#> 
#> #bafsyshahc .gt_footnotes {
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
#> #bafsyshahc .gt_footnote {
#>   margin: 0px;
#>   font-size: 90%;
#>   padding-top: 4px;
#>   padding-bottom: 4px;
#>   padding-left: 5px;
#>   padding-right: 5px;
#> }
#> 
#> #bafsyshahc .gt_sourcenotes {
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
#> #bafsyshahc .gt_sourcenote {
#>   font-size: 90%;
#>   padding-top: 4px;
#>   padding-bottom: 4px;
#>   padding-left: 5px;
#>   padding-right: 5px;
#> }
#> 
#> #bafsyshahc .gt_left {
#>   text-align: left;
#> }
#> 
#> #bafsyshahc .gt_center {
#>   text-align: center;
#> }
#> 
#> #bafsyshahc .gt_right {
#>   text-align: right;
#>   font-variant-numeric: tabular-nums;
#> }
#> 
#> #bafsyshahc .gt_font_normal {
#>   font-weight: normal;
#> }
#> 
#> #bafsyshahc .gt_font_bold {
#>   font-weight: bold;
#> }
#> 
#> #bafsyshahc .gt_font_italic {
#>   font-style: italic;
#> }
#> 
#> #bafsyshahc .gt_super {
#>   font-size: 65%;
#> }
#> 
#> #bafsyshahc .gt_footnote_marks {
#>   font-size: 75%;
#>   vertical-align: 0.4em;
#>   position: initial;
#> }
#> 
#> #bafsyshahc .gt_asterisk {
#>   font-size: 100%;
#>   vertical-align: 0;
#> }
#> 
#> #bafsyshahc .gt_indent_1 {
#>   text-indent: 5px;
#> }
#> 
#> #bafsyshahc .gt_indent_2 {
#>   text-indent: 10px;
#> }
#> 
#> #bafsyshahc .gt_indent_3 {
#>   text-indent: 15px;
#> }
#> 
#> #bafsyshahc .gt_indent_4 {
#>   text-indent: 20px;
#> }
#> 
#> #bafsyshahc .gt_indent_5 {
#>   text-indent: 25px;
#> }
#> 
#> #bafsyshahc .katex-display {
#>   display: inline-flex !important;
#>   margin-bottom: 0.75em !important;
#> }
#> 
#> #bafsyshahc div.Reactable > div.rt-table > div.rt-thead > div.rt-tr.rt-tr-group-header > div.rt-th-group:after {
#>   height: 0px !important;
#> }
#> </style>
#>   <table class="gt_table" data-quarto-disable-processing="false" data-quarto-bootstrap="false">
#>   <thead>
#>     <tr class="gt_heading">
#>       <td colspan="2" class="gt_heading gt_title gt_font_normal gt_bottom_border" style>Outlier Detection Results</td>
#>     </tr>
#>     
#>     <tr class="gt_col_headings gt_spanner_row">
#>       <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="2" scope="colgroup" id="Outliers">
#>         <div class="gt_column_spanner">Outliers</div>
#>       </th>
#>     </tr>
#>     <tr class="gt_col_headings">
#>       <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="Row_Number">Row_Number</th>
#>       <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="Body_Weight_1">Body_Weight_1</th>
#>     </tr>
#>   </thead>
#>   <tbody class="gt_table_body">
#>     <tr><td headers="Row_Number" class="gt_row gt_right">32</td>
#> <td headers="Body_Weight_1" class="gt_row gt_right">31.03</td></tr>
#>   </tbody>
#>   
#>   
#> </table>
#> </div>
```

In the context of mouse data, typo_flagger() may be effectively used on
a column describing if the mouse received “Tmt” or “Plac”. Any spelling
errors or additional descriptors added by another team researcher would
be flagged.

``` r
typo_flagger(data = birth, column = "Treatment", correct_inputs = c("Plac", "Tmt"))
#> [1] "There are potential spelling errors detected in the column. Revise them in the following table:"
#> <div id="aduvhpztov" style="padding-left:0px;padding-right:0px;padding-top:10px;padding-bottom:10px;overflow-x:auto;overflow-y:auto;width:auto;height:auto;">
#>   <style>#aduvhpztov table {
#>   font-family: system-ui, 'Segoe UI', Roboto, Helvetica, Arial, sans-serif, 'Apple Color Emoji', 'Segoe UI Emoji', 'Segoe UI Symbol', 'Noto Color Emoji';
#>   -webkit-font-smoothing: antialiased;
#>   -moz-osx-font-smoothing: grayscale;
#> }
#> 
#> #aduvhpztov thead, #aduvhpztov tbody, #aduvhpztov tfoot, #aduvhpztov tr, #aduvhpztov td, #aduvhpztov th {
#>   border-style: none;
#> }
#> 
#> #aduvhpztov p {
#>   margin: 0;
#>   padding: 0;
#> }
#> 
#> #aduvhpztov .gt_table {
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
#> #aduvhpztov .gt_caption {
#>   padding-top: 4px;
#>   padding-bottom: 4px;
#> }
#> 
#> #aduvhpztov .gt_title {
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
#> #aduvhpztov .gt_subtitle {
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
#> #aduvhpztov .gt_heading {
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
#> #aduvhpztov .gt_bottom_border {
#>   border-bottom-style: solid;
#>   border-bottom-width: 2px;
#>   border-bottom-color: #D3D3D3;
#> }
#> 
#> #aduvhpztov .gt_col_headings {
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
#> #aduvhpztov .gt_col_heading {
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
#> #aduvhpztov .gt_column_spanner_outer {
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
#> #aduvhpztov .gt_column_spanner_outer:first-child {
#>   padding-left: 0;
#> }
#> 
#> #aduvhpztov .gt_column_spanner_outer:last-child {
#>   padding-right: 0;
#> }
#> 
#> #aduvhpztov .gt_column_spanner {
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
#> #aduvhpztov .gt_spanner_row {
#>   border-bottom-style: hidden;
#> }
#> 
#> #aduvhpztov .gt_group_heading {
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
#> #aduvhpztov .gt_empty_group_heading {
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
#> #aduvhpztov .gt_from_md > :first-child {
#>   margin-top: 0;
#> }
#> 
#> #aduvhpztov .gt_from_md > :last-child {
#>   margin-bottom: 0;
#> }
#> 
#> #aduvhpztov .gt_row {
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
#> #aduvhpztov .gt_stub {
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
#> #aduvhpztov .gt_stub_row_group {
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
#> #aduvhpztov .gt_row_group_first td {
#>   border-top-width: 2px;
#> }
#> 
#> #aduvhpztov .gt_row_group_first th {
#>   border-top-width: 2px;
#> }
#> 
#> #aduvhpztov .gt_summary_row {
#>   color: #333333;
#>   background-color: #FFFFFF;
#>   text-transform: inherit;
#>   padding-top: 8px;
#>   padding-bottom: 8px;
#>   padding-left: 5px;
#>   padding-right: 5px;
#> }
#> 
#> #aduvhpztov .gt_first_summary_row {
#>   border-top-style: solid;
#>   border-top-color: #D3D3D3;
#> }
#> 
#> #aduvhpztov .gt_first_summary_row.thick {
#>   border-top-width: 2px;
#> }
#> 
#> #aduvhpztov .gt_last_summary_row {
#>   padding-top: 8px;
#>   padding-bottom: 8px;
#>   padding-left: 5px;
#>   padding-right: 5px;
#>   border-bottom-style: solid;
#>   border-bottom-width: 2px;
#>   border-bottom-color: #D3D3D3;
#> }
#> 
#> #aduvhpztov .gt_grand_summary_row {
#>   color: #333333;
#>   background-color: #FFFFFF;
#>   text-transform: inherit;
#>   padding-top: 8px;
#>   padding-bottom: 8px;
#>   padding-left: 5px;
#>   padding-right: 5px;
#> }
#> 
#> #aduvhpztov .gt_first_grand_summary_row {
#>   padding-top: 8px;
#>   padding-bottom: 8px;
#>   padding-left: 5px;
#>   padding-right: 5px;
#>   border-top-style: double;
#>   border-top-width: 6px;
#>   border-top-color: #D3D3D3;
#> }
#> 
#> #aduvhpztov .gt_last_grand_summary_row_top {
#>   padding-top: 8px;
#>   padding-bottom: 8px;
#>   padding-left: 5px;
#>   padding-right: 5px;
#>   border-bottom-style: double;
#>   border-bottom-width: 6px;
#>   border-bottom-color: #D3D3D3;
#> }
#> 
#> #aduvhpztov .gt_striped {
#>   background-color: rgba(128, 128, 128, 0.05);
#> }
#> 
#> #aduvhpztov .gt_table_body {
#>   border-top-style: solid;
#>   border-top-width: 2px;
#>   border-top-color: #D3D3D3;
#>   border-bottom-style: solid;
#>   border-bottom-width: 2px;
#>   border-bottom-color: #D3D3D3;
#> }
#> 
#> #aduvhpztov .gt_footnotes {
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
#> #aduvhpztov .gt_footnote {
#>   margin: 0px;
#>   font-size: 90%;
#>   padding-top: 4px;
#>   padding-bottom: 4px;
#>   padding-left: 5px;
#>   padding-right: 5px;
#> }
#> 
#> #aduvhpztov .gt_sourcenotes {
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
#> #aduvhpztov .gt_sourcenote {
#>   font-size: 90%;
#>   padding-top: 4px;
#>   padding-bottom: 4px;
#>   padding-left: 5px;
#>   padding-right: 5px;
#> }
#> 
#> #aduvhpztov .gt_left {
#>   text-align: left;
#> }
#> 
#> #aduvhpztov .gt_center {
#>   text-align: center;
#> }
#> 
#> #aduvhpztov .gt_right {
#>   text-align: right;
#>   font-variant-numeric: tabular-nums;
#> }
#> 
#> #aduvhpztov .gt_font_normal {
#>   font-weight: normal;
#> }
#> 
#> #aduvhpztov .gt_font_bold {
#>   font-weight: bold;
#> }
#> 
#> #aduvhpztov .gt_font_italic {
#>   font-style: italic;
#> }
#> 
#> #aduvhpztov .gt_super {
#>   font-size: 65%;
#> }
#> 
#> #aduvhpztov .gt_footnote_marks {
#>   font-size: 75%;
#>   vertical-align: 0.4em;
#>   position: initial;
#> }
#> 
#> #aduvhpztov .gt_asterisk {
#>   font-size: 100%;
#>   vertical-align: 0;
#> }
#> 
#> #aduvhpztov .gt_indent_1 {
#>   text-indent: 5px;
#> }
#> 
#> #aduvhpztov .gt_indent_2 {
#>   text-indent: 10px;
#> }
#> 
#> #aduvhpztov .gt_indent_3 {
#>   text-indent: 15px;
#> }
#> 
#> #aduvhpztov .gt_indent_4 {
#>   text-indent: 20px;
#> }
#> 
#> #aduvhpztov .gt_indent_5 {
#>   text-indent: 25px;
#> }
#> 
#> #aduvhpztov .katex-display {
#>   display: inline-flex !important;
#>   margin-bottom: 0.75em !important;
#> }
#> 
#> #aduvhpztov div.Reactable > div.rt-table > div.rt-thead > div.rt-tr.rt-tr-group-header > div.rt-th-group:after {
#>   height: 0px !important;
#> }
#> </style>
#>   <table class="gt_table" data-quarto-disable-processing="false" data-quarto-bootstrap="false">
#>   <thead>
#>     <tr class="gt_heading">
#>       <td colspan="4" class="gt_heading gt_title gt_font_normal gt_bottom_border" style>Incorrect Values in "Treatment" Column</td>
#>     </tr>
#>     
#>     <tr class="gt_col_headings">
#>       <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1" scope="col" id="ID">ID</th>
#>       <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1" scope="col" id="Sex">Sex</th>
#>       <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="Num">Num</th>
#>       <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1" scope="col" id="Treatment">Treatment</th>
#>     </tr>
#>   </thead>
#>   <tbody class="gt_table_body">
#>     <tr><td headers="ID" class="gt_row gt_left">C57BL6J_F_11</td>
#> <td headers="Sex" class="gt_row gt_left">F</td>
#> <td headers="Num" class="gt_row gt_right">11</td>
#> <td headers="Treatment" class="gt_row gt_left">Placobo</td></tr>
#>     <tr><td headers="ID" class="gt_row gt_left">C57BL6J_M_20</td>
#> <td headers="Sex" class="gt_row gt_left">M</td>
#> <td headers="Num" class="gt_row gt_right">20</td>
#> <td headers="Treatment" class="gt_row gt_left">Trmt</td></tr>
#>   </tbody>
#>   
#>   
#> </table>
#> </div>
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
