setwd(DataDirectory)
####################

##################################################################
# Write WebPlotDigitizer data in a more analysis-friendly format #
##################################################################

# As used in R with three columns, Date, Type and Value
# "Long" format
write.csv(cardiac.calls,file = "2019-2022 NASSS Cardiac calls (long).csv",
          row.names = FALSE)

# Spreadsheet-friendly format with three columns: Date, Baseline and Calls
write.csv(cardiac.2020_2022.approx,file = "2019-2022 NASSS Cardiac calls (spreadsheet).csv",
          row.names = FALSE)

# Output summary totals for each year.
# Recall that cardiac.2020.summary contains the dataset for the January 2020 report,
# so cardiac.2020.summary contains the totals for 2019 (and so on for the other similar summary data)

cardiac.2020.summary <- cardiac.2020_2022.approx %>%
  filter(Date <= as.Date("2019-12-31")) %>%
  summarise(Daily = sum(SevenDayAverage,na.rm = TRUE),Baseline = sum(Baseline))

cardiac.2021.summary <- cardiac.2020_2022.approx %>%
  filter(Date >= as.Date("2020-01-01") & Date <= as.Date("2020-12-31")) %>%
  summarise(Daily = sum(SevenDayAverage,na.rm = TRUE),Baseline = sum(Baseline))

cardiac.2022.summary <- cardiac.2020_2022.approx %>%
  filter(Date >= as.Date("2021-01-01")) %>%
  summarise(Daily = sum(SevenDayAverage,na.rm = TRUE),Baseline = sum(Baseline))

# Remove redundant data frames
rm(cardiac.2020,cardiac.2020.7DA,cardiac.2020.baseline,cardiac.2020.long,
   cardiac.2021,cardiac.2021.7DA,cardiac.2021.baseline,cardiac.2021.long,
   cardiac.2022,cardiac.2022.7DA,cardiac.2022.baseline,cardiac.2022.long)

####################
setwd(RootDirectory)