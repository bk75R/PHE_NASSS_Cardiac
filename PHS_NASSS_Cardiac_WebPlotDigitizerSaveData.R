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
cardiac.calls.spreadsheet <- rbind.data.frame(cardiac.2020,cardiac.2021,cardiac.2022)
write.csv(cardiac.calls.spreadsheet,file = "2019-2022 NASSS Cardiac calls (spreadsheet).csv",
          row.names = FALSE)

# Output summary totals for each year.
# Recall that cardiac.2020 is the dataset for the January 2020 report,
# so cardiac.2020 contains the totals for 2019 (and so on for the other similar data frames)

cardiac.2020 %>%
  summarise(Daily = sum(SevenDayAverage,na.rm = TRUE),Baseline = sum(Baseline))

cardiac.2021 %>%
  summarise(Daily = sum(SevenDayAverage,na.rm = TRUE),Baseline = sum(Baseline))

cardiac.2022 %>%
  summarise(Daily = sum(SevenDayAverage,na.rm = TRUE),Baseline = sum(Baseline))

# Remove redundant data frames
rm(cardiac.2020,cardiac.2020.7DA,cardiac.2020.baseline,cardiac.2020.long,
   cardiac.2021,cardiac.2021.7DA,cardiac.2021.baseline,cardiac.2021.long,
   cardiac.2022,cardiac.2022.7DA,cardiac.2022.baseline,cardiac.2022.long)

####################
setwd(RootDirectory)