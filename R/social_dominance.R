#' Social Dominance Data Set
#'
#' In order to assess an individual’s Social Dominance Orientation they were asked a series of questions about their views of Intergroup Dominance and Anti-Egalitarianism. Each of these questions had a score associated with if they agreed or disagreed and if that meant they had a high or low Social Dominance Orientation. These scores were later averaged and scaled 0 (low-SDO) to 1 (high-SDO). Additionally, this data was used to compare physical strength (Q1 - Q7) to SDO.
#'
#' @format A tibble with 140 rows and 26 variables:
#' \describe{
#'   \item{Q1}{On a scale 0 - 10, how physically strong are you for your age? 0 being not strong at all, 5 being average strength, 10 being extremely above average.}
#'   \item{Q2}{How often do you engage in physical activity? 0 - 7 days a week.}
#'   \item{Q3}{How much weight (in lbs) can you bench press for a 1-rep max?}
#'   \item{Q4}{How much weight (in lbs) can you deadlift for a 1-rep max?}
#'   \item{Q5}{How many pull-ups/chin-ups can you do without taking a break?}
#'   \item{Q6}{How tall are you in inches?}
#'   \item{Q7}{How much do you weigh in pounds?}
#'   \item{Intergroup_dominance_Q1}{We should not push for group equality.}
#'   \item{Intergroup_dominance_Q2}{We shouldn't try to guarantee that every group has the same quality of life.}
#'   \item{Intergroup_dominance_Q3}{It is unjust to try to make groups equal.}
#'   \item{Intergroup_dominance_Q4}{Group equality should not be our primary goal.}
#'   \item{Intergroup_dominance_Q5}{We should work to give all groups an equal chance to succeed.}
#'   \item{Intergroup_dominance_Q6}{We should do what we can to equalize conditions for different groups.}
#'   \item{Intergroup_dominance_Q7}{No matter how much effort it takes, we ought to strive to ensure that all groups have the same chance in life.}
#'   \item{Intergroup_dominance_Q8}{Group equality should be our ideal.}
#'   \item{Antiegalitarian_Q1}{Some groups of people must be kept in their place.}
#'   \item{Antiegalitarian_Q2}{It's probably a good thing that certain groups are at the top and other groups are at the bottom.}
#'   \item{Antiegalitarian_Q3}{An ideal society requires some groups to be on top and others to be on the bottom.}
#'   \item{Antiegalitarian_Q4}{Some groups of people are simply inferior to other groups.}
#'   \item{Antiegalitarian_Q5}{Groups at the bottom are just as deserving as groups at the top.}
#'   \item{Antiegalitarian_Q6}{No one group should dominate in society.}
#'   \item{Antiegalitarian_Q7}{Groups at the bottom should not have to stay in their place.}
#'   \item{Antiegalitarian_Q8}{Group dominance is a poor principle.}
#'   \item{SC0}{Score before statistical conversion.}
#' }
#' @source Vanessa Valverde Qualtrics Survey Data from Political Psychology Course
"social_dominance"
