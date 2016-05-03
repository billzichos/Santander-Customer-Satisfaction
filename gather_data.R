wd <- "~/GitHub/Santander-Customer-Satisfaction"

setwd(wd)

# The following files are provided
#   - train.csv
#   - test.csv
#   - sample_submission.csv

source("~/GitHub/Get-Raw-Data/download.R")
downloadSingleKaggleZip("santander-customer-satisfaction", "train.csv.zip", "train.csv")
downloadSingleKaggleZip("santander-customer-satisfaction", "test.csv.zip", "test.csv")
downloadSingleKaggleZip("santander-customer-satisfaction", "sample_submission.csv.zip", "sample_submission.csv")