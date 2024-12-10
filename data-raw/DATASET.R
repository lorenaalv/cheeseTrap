# birth data sheet
birth <- read.csv("./data-raw/Birth.csv")
usethis::use_data(birth, overwrite = TRUE)

# body weight data sheet
body_weight <- read.csv("./data-raw/Body_Weight.csv")

# wrangling

# renaming columns for better use
colnames(body_weight)[2] <- "Body_Weight_1"
colnames(body_weight)[3] <- "Date_Body_Weight_1"
colnames(body_weight)[4] <- "Body_Weight_2"
colnames(body_weight)[5] <- "Date_Body_Weight_2"
colnames(body_weight)[6] <- "Body_Weight_3"
# this was an incorrect column name! issue with the dataset.
colnames(body_weight)[7] <- "Date_Body_Weight_3"

# dropping unnecessary columns and NA rows
body_weight <- body_weight |>
  dplyr::select(ID, Body_Weight_1, Date_Body_Weight_1, Body_Weight_2, Date_Body_Weight_2, Body_Weight_3, Date_Body_Weight_3) |>
  na.omit()

usethis::use_data(body_weight, overwrite = TRUE)

# outcome data sheet
outcome <- read.csv("./data-raw/Outcome.csv")

# wrangling

# renaming columns for better use
colnames(outcome)[2] <- "Outcome_1"
# this was an incorrect column name! issue with the dataset.
colnames(outcome)[3] <- "Date_Outcome_1"
colnames(outcome)[4] <- "Outcome_2"
colnames(outcome)[5] <- "Date_Outcome_2"
colnames(outcome)[6] <- "Outcome_3"
colnames(outcome)[7] <- "Date_Outcome_3"

# dropping unnecessary columns and NA rows
outcome <- outcome |>
  dplyr::select(Subject_ID, Outcome_1, Date_Outcome_1, Outcome_2, Date_Outcome_2, Outcome_3, Date_Outcome_3)

usethis::use_data(outcome, overwrite = TRUE)

# social dominance data set
social_dominance <- read.csv("./data-raw/social_dominance.csv")
usethis::use_data(social_dominance, overwrite = TRUE)
