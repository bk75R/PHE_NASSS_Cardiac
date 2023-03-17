setwd(DataDirectory)
####################

##################################################################
# Write WebPlotDigitizer data in a more analysis-friendly format #
##################################################################

# As used in R with three columns, Date, Type and Value
# "Long" format
write.csv(cardiac.calls,file = "2019-2023 NASSS Cardiac calls (long).csv",
          row.names = FALSE)

# Spreadsheet-friendly format with three columns: Date, Baseline and Calls
write.csv(cardiac.2019_2023.approx,file = "2019-2023 NASSS Cardiac calls (spreadsheet).csv",
          row.names = FALSE)

# Output summary totals for each year.
# Recall that cardiac.2020.summary contains the dataset for the January 2020 report,
# so cardiac.2020.summary contains the totals for 2019 (and so on for the other similar summary data)

# cardiac.2019.summary <- cardiac.2019_2022.approx %>%
#   filter(Date >= as.Date("2018-01-01") & Date <= as.Date("2018-12-31")) %>%
#   summarise(Daily = sum(SevenDayAverage,na.rm = TRUE),Baseline = sum(Baseline))

cardiac.2019.summary <- cardiac.2019_2023.approx %>%
  filter(Date >= as.Date("2019-01-01") & Date <= as.Date("2019-12-31")) %>%
  summarise(Daily = sum(SevenDayAverage,na.rm = TRUE),Baseline = sum(Baseline))

cardiac.2020.summary <- cardiac.2019_2023.approx %>%
  filter(Date >= as.Date("2020-01-01") & Date <= as.Date("2020-12-31")) %>%
  summarise(Daily = sum(SevenDayAverage,na.rm = TRUE),Baseline = sum(Baseline))

cardiac.2021.summary <- cardiac.2019_2023.approx %>%
  filter(Date >= as.Date("2021-01-01") & Date <= as.Date("2021-12-31")) %>%
  summarise(Daily = sum(SevenDayAverage,na.rm = TRUE),Baseline = sum(Baseline))

cardiac.2022.summary <- cardiac.2019_2023.approx %>%
  filter(Date >= as.Date("2022-01-01") & Date <= as.Date("2022-12-31")) %>%
  summarise(Daily = sum(SevenDayAverage,na.rm = TRUE),Baseline = sum(Baseline))

# These give different results to the cumsum() calculations in cardiac.calls.report.graphs.7DayAverage
# Redo to check.

cardiac.2019.summary.check <- cardiac.2019_2023.approx %>%
  filter(Date >= as.Date("2019-01-02") & Date <= as.Date("2019-12-31")) %>%
  mutate(SevenDayAverage.cum = cumsum(SevenDayAverage),
         Baseline.cum = cumsum(Baseline))# %>%
  #summarise(Daily = sum(SevenDayAverage,na.rm = TRUE),Baseline = sum(Baseline,na.rm = TRUE))
# The cumulative sum graph is wrong - cumulative figures are too small. Recheck graph code.

# Graph cumsum code
# cardiac.calls.report.graphs.7DayAverage <- cardiac.calls.report.graphs.7DayAverage %>%
#   arrange(., Year,Date, by_group = TRUE) %>%
#   group_by(Year,Type) %>%
#   # order_by(Year) %>%
#   mutate(CallsCum=cumsum(Calls))
# Adapt to cardiac.2019_2023.approx which uses the same data without report tags
cumsumcheck <- cardiac.2019_2023.approx %>%
  filter(Date >= as.Date("2019-01-02")) %>% # 2019-01-01 has no value in SevenDayAverage column
  mutate(Year = year(Date)) %>%
  arrange(., Year,Date, by_group = TRUE) %>%
  group_by(Year) %>%
  # order_by(Year) %>%
  mutate(BaselineCum=cumsum(Baseline),
         SevenDayAverageCum = cumsum(SevenDayAverage))
# 2019 cumsum is ~101,000 for 7 day average.
# This makes sense. Why is the graph wrong?
# cardiac.calls.report.graphs.7DayAverage has several missing days. This reduces the cumulative sum.
# Redo this dataset to include missing data.
# cardiac.2019.summary etc as above are correct.


# Remove redundant data frames
rm(cardiac.2020,cardiac.2020.7DA,cardiac.2020.baseline,cardiac.2020.long,
   cardiac.2021,cardiac.2021.7DA,cardiac.2021.baseline,cardiac.2021.long,
   cardiac.2022,cardiac.2022.7DA,cardiac.2022.baseline,cardiac.2022.long,
   cardiac.2023.baseline,cardiac.2023.long)

####################
setwd(RootDirectory)