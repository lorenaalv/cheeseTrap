% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/outlier_detector.R
\name{outlier_detector}
\alias{outlier_detector}
\title{Outlier Detector Function}
\usage{
outlier_detector(data, y_var)
}
\arguments{
\item{data}{the dataset for the function to act on}

\item{y_var}{the variable/column for the function to act on. should be quantitative, but the function handles this as well through coercion.}
}
\value{
the function will return an interactive plot where the user can identify on their own end any outliers. the function also returns a gt() table of the flagged outliers and a message on how they were calculated.
}
\description{
Will identify any numerical outliers in the data and flag them to the user. Outliers are +- 2.5 standard deviations from mean.
}
\examples{
outlier_detector(data=body_weight, y_var="Body_Weight_1")
}
