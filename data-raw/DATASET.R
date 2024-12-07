# birth sheet
birth <- readxl::read_excel("./data-raw/mousedata.xlsx", sheet=1)
usethis::use_data(birth, overwrite = TRUE)

# body weight sheet
body_weight <- readxl::read_excel("./data-raw/mousedata.xlsx", sheet=2)

# wrangling dataset

# renaming columns for better use
colnames(body_weight)[2] <- "Body_Weight_1"
colnames(body_weight)[3] <- "Date_Body_Weight_1"
colnames(body_weight)[4] <- "Body_Weight_2"
colnames(body_weight)[5] <- "Date_Body_Weight_2"
colnames(body_weight)[6] <- "Body_Weight_3"
# this was an incorrect column name! issue with the dataset.
colnames(body_weight)[7] <- "Body_Weight_3"

usethis::use_data(body_weight, overwrite = TRUE)

# outcome sheet
outcome <- readxl::read_excel("./data-raw/mousedata.xlsx", sheet=3)

# wrangling

# renaming columns for better use
colnames(outcome)[2] <- "Outcome_1"
# this was an incorrect column name! issue with the dataset.
colnames(outcome)[3] <- "Date_Outcome_1"
colnames(outcome)[4] <- "Outcome_2"
colnames(outcome)[5] <- "Date_Outcome_2"
colnames(outcome)[6] <- "Outcome_3"
colnames(outcome)[7] <- "Date_Outcome_3"

usethis::use_data(outcome, overwrite = TRUE)
