setwd(WebPlotDigitizerDirectory)
####################

##########################################################
# Read WebPlotDigitizer data extracted from NASSS graphs #
##########################################################

#############
# 2019 data #
#############

# Load data
WPD.2019.7DA.filename <- "2019 Ambulance bulletin - cardiac - 7 day average.csv"
WPD.2019.baseline.filename <- "2019 Ambulance bulletin - cardiac - baseline.csv"
cardiac.2019.7DA <- read.csv(WPD.2019.7DA.filename,header = FALSE, sep = ",")
cardiac.2019.baseline <- read.csv(WPD.2019.baseline.filename,header = FALSE, sep = ",")

# Change column names
column.names <- c("Date","Calls")
colnames(cardiac.2019.7DA) <- column.names
colnames(cardiac.2019.baseline) <- column.names

# Convert date formats
cardiac.2019.7DA$Date <- as_date(cardiac.2019.7DA$Date)
cardiac.2019.baseline$Date <- as_date(cardiac.2019.baseline$Date)

# Chop off data in baseline which extends beyond 7DA data
cardiac.2019.baseline <- filter(cardiac.2019.baseline, Date <= max(cardiac.2019.7DA$Date))

# Remove duplicates
cardiac.2019.7DA <- cardiac.2019.7DA[!duplicated(cardiac.2019.7DA$Date), ]
cardiac.2019.baseline <- cardiac.2019.baseline[!duplicated(cardiac.2019.baseline$Date), ]

cardiac.2019 <- full_join(cardiac.2019.7DA,cardiac.2019.baseline,by = "Date")
colnames.cardiac <- c("Date","SevenDayAverage","Baseline")
colnames(cardiac.2019) <- colnames.cardiac
# cardiac.2019 <- drop_na(cardiac.2019) # Removes rows where there's only one value available.
# This is due to the overlapping lines in the original plots.

#############
# 2020 data #
#############

# Load data
WPD.2020.7DA.filename <- "2020 Ambulance bulletin - cardiac - 7 day average.csv"
WPD.2020.baseline.filename <- "2020 Ambulance bulletin - cardiac - baseline.csv"
cardiac.2020.7DA <- read.csv(WPD.2020.7DA.filename,header = FALSE, sep = ",")
cardiac.2020.baseline <- read.csv(WPD.2020.baseline.filename,header = FALSE, sep = ",")

# Change column names
column.names <- c("Date","Calls")
colnames(cardiac.2020.7DA) <- column.names
colnames(cardiac.2020.baseline) <- column.names

# Convert date formats
cardiac.2020.7DA$Date <- as_date(cardiac.2020.7DA$Date)
cardiac.2020.baseline$Date <- as_date(cardiac.2020.baseline$Date)

# Remove duplicates
cardiac.2020.7DA <- cardiac.2020.7DA[!duplicated(cardiac.2020.7DA$Date), ]
cardiac.2020.baseline <- cardiac.2020.baseline[!duplicated(cardiac.2020.baseline$Date), ]

# Chop off data in baseline which extends beyond 7DA data
cardiac.2020.baseline <- filter(cardiac.2020.baseline, Date <= max(cardiac.2020.7DA$Date))

cardiac.2020 <- full_join(cardiac.2020.7DA,cardiac.2020.baseline,by = "Date")
colnames.cardiac <- c("Date","SevenDayAverage","Baseline")
colnames(cardiac.2020) <- colnames.cardiac
# cardiac.2020 <- drop_na(cardiac.2020) # Removes rows where there's only one value available.
# This is due to the overlapping lines in the original plots.

#####################
# 2020 week 10 data #
#####################

# Load data
WPD.2020wk10.7DA.filename <- "2020 week 10 Ambulance bulletin - cardiac - 7 day average.csv"
WPD.2020wk10.baseline.filename <- "2020 week 10 Ambulance bulletin - cardiac - baseline.csv"
cardiac.2020wk10.7DA <- read.csv(WPD.2020wk10.7DA.filename,header = FALSE, sep = ",")
cardiac.2020wk10.baseline <- read.csv(WPD.2020wk10.baseline.filename,header = FALSE, sep = ",")

# Change column names
column.names <- c("Date","Calls")
colnames(cardiac.2020wk10.7DA) <- column.names
colnames(cardiac.2020wk10.baseline) <- column.names

# Convert date formats
cardiac.2020wk10.7DA$Date <- as_date(cardiac.2020wk10.7DA$Date)
cardiac.2020wk10.baseline$Date <- as_date(cardiac.2020wk10.baseline$Date)

# Chop off data in baseline which extends beyond 7DA data
cardiac.2020wk10.baseline <- filter(cardiac.2020wk10.baseline, Date <= max(cardiac.2020wk10.7DA$Date))

# Remove duplicates
cardiac.2020wk10.7DA <- cardiac.2020wk10.7DA[!duplicated(cardiac.2020wk10.7DA$Date), ]
cardiac.2020wk10.baseline <- cardiac.2020wk10.baseline[!duplicated(cardiac.2020wk10.baseline$Date), ]

cardiac.2020wk10 <- full_join(cardiac.2020wk10.7DA,cardiac.2020wk10.baseline,by = "Date")
colnames.cardiac <- c("Date","SevenDayAverage","Baseline")
colnames(cardiac.2020wk10) <- colnames.cardiac
# cardiac.2020wk10 <- drop_na(cardiac.2020wk10) # Removes rows where there's only one value available.
# This is due to the overlapping lines in the original plots.

#############
# 2021 data #
#############

# Load data
WPD.2021.7DA.filename <- "2021 Ambulance bulletin - cardiac - 7 day average.csv"
WPD.2021.baseline.filename <- "2021 Ambulance bulletin - cardiac - baseline.csv"
cardiac.2021.7DA <- read.csv(WPD.2021.7DA.filename,header = FALSE, sep = ",")
cardiac.2021.baseline <- read.csv(WPD.2021.baseline.filename,header = FALSE, sep = ",")

# Change column names
column.names <- c("Date","Calls")
colnames(cardiac.2021.7DA) <- column.names
colnames(cardiac.2021.baseline) <- column.names

# Convert date formats
cardiac.2021.7DA$Date <- as_date(cardiac.2021.7DA$Date)
cardiac.2021.baseline$Date <- as_date(cardiac.2021.baseline$Date)

# Chop off data in baseline which extends beyond 7DA data
cardiac.2021.baseline <- filter(cardiac.2021.baseline, Date <= max(cardiac.2021.7DA$Date))

# Remove duplicates
cardiac.2021.7DA <- cardiac.2021.7DA[!duplicated(cardiac.2021.7DA$Date), ]
cardiac.2021.baseline <- cardiac.2021.baseline[!duplicated(cardiac.2021.baseline$Date), ]

cardiac.2021 <- full_join(cardiac.2021.7DA,cardiac.2021.baseline,by = "Date")
colnames.cardiac <- c("Date","SevenDayAverage","Baseline")
colnames(cardiac.2021) <- colnames.cardiac
# cardiac.2021 <- drop_na(cardiac.2021) # Removes rows where there's only one value available.
# This is due to the overlapping lines in the original plots.

#####################
# 2021 week 08 data #
#####################

# Load data
WPD.2021wk08.7DA.filename <- "2021 week 08 Ambulance bulletin - cardiac - 7 day average.csv"
WPD.2021wk08.baseline.filename <- "2021 week 08 Ambulance bulletin - cardiac - baseline.csv"
cardiac.2021wk08.7DA <- read.csv(WPD.2021wk08.7DA.filename,header = FALSE, sep = ",")
cardiac.2021wk08.baseline <- read.csv(WPD.2021wk08.baseline.filename,header = FALSE, sep = ",")

# Change column names
column.names <- c("Date","Calls")
colnames(cardiac.2021wk08.7DA) <- column.names
colnames(cardiac.2021wk08.baseline) <- column.names

# Convert date formats
cardiac.2021wk08.7DA$Date <- as_date(cardiac.2021wk08.7DA$Date)
cardiac.2021wk08.baseline$Date <- as_date(cardiac.2021wk08.baseline$Date)

# Chop off data in baseline which extends beyond 7DA data
cardiac.2021wk08.baseline <- filter(cardiac.2021wk08.baseline, Date <= max(cardiac.2021wk08.7DA$Date))

# Remove duplicates
cardiac.2021wk08.7DA <- cardiac.2021wk08.7DA[!duplicated(cardiac.2021wk08.7DA$Date), ]
cardiac.2021wk08.baseline <- cardiac.2021wk08.baseline[!duplicated(cardiac.2021wk08.baseline$Date), ]

cardiac.2021wk08 <- full_join(cardiac.2021wk08.7DA,cardiac.2021wk08.baseline,by = "Date")
colnames.cardiac <- c("Date","SevenDayAverage","Baseline")
colnames(cardiac.2021wk08) <- colnames.cardiac
# cardiac.2021wk08 <- drop_na(cardiac.2021wk08) # Removes rows where there's only one value available.
# This is due to the overlapping lines in the original plots.

#############
# 2022 data #
#############

# Load data
WPD.2022.7DA.filename <- "2022 Ambulance bulletin - cardiac - 7 day average.csv"
WPD.2022.baseline.filename <- "2022 Ambulance bulletin - cardiac - baseline.csv"
cardiac.2022.7DA <- read.csv(WPD.2022.7DA.filename,header = FALSE, sep = ",")
cardiac.2022.baseline <- read.csv(WPD.2022.baseline.filename,header = FALSE, sep = ",")

# Change column names
column.names <- c("Date","Calls")
colnames(cardiac.2022.7DA) <- column.names
colnames(cardiac.2022.baseline) <- column.names

# Convert date formats
cardiac.2022.7DA$Date <- as_date(cardiac.2022.7DA$Date)
cardiac.2022.baseline$Date <- as_date(cardiac.2022.baseline$Date)

# Remove duplicates
cardiac.2022.7DA <- cardiac.2022.7DA[!duplicated(cardiac.2022.7DA$Date), ]
cardiac.2022.baseline <- cardiac.2022.baseline[!duplicated(cardiac.2022.baseline$Date), ]

cardiac.2022 <- full_join(cardiac.2022.7DA,cardiac.2022.baseline,by = "Date")
colnames.cardiac <- c("Date","SevenDayAverage","Baseline")
colnames(cardiac.2022) <- colnames.cardiac

# Split off end portion of data as baseline data extends beyond 2022 seven day average data.
cardiac.2022.end <- filter(cardiac.2022,Date >= as.Date("2022-01-20"))
cardiac.2022.rest <- cardiac.2022 %>%
  filter(Date < as.Date("2022-01-20")) %>%
  arrange(Date)

# cardiac.2022.SevenDayAverage.filled <- na.spline(cardiac.2022.rest$SevenDayAverage)
# cardiac.2022.rest$SevenDayAverage <- cardiac.2022.SevenDayAverage.filled

cardiac.2022 <- rbind.data.frame(cardiac.2022.rest,cardiac.2022.end)


#####################
# 2022 week 12 data #
#####################

# Load data
WPD.2022wk12.7DA.filename <- "2022 week 12 Ambulance bulletin - cardiac - 7 day average.csv"
WPD.2022wk12.baseline.filename <- "2022 week 12 Ambulance bulletin - cardiac - baseline.csv"
cardiac.2022wk12.7DA <- read.csv(WPD.2022wk12.7DA.filename,header = FALSE, sep = ",")
cardiac.2022wk12.baseline <- read.csv(WPD.2022wk12.baseline.filename,header = FALSE, sep = ",")

# Change column names
column.names <- c("Date","Calls")
colnames(cardiac.2022wk12.7DA) <- column.names
colnames(cardiac.2022wk12.baseline) <- column.names

# Convert date formats
cardiac.2022wk12.7DA$Date <- as_date(cardiac.2022wk12.7DA$Date)
cardiac.2022wk12.baseline$Date <- as_date(cardiac.2022wk12.baseline$Date)

# Remove duplicates
cardiac.2022wk12.7DA <- cardiac.2022wk12.7DA[!duplicated(cardiac.2022wk12.7DA$Date), ]
cardiac.2022wk12.baseline <- cardiac.2022wk12.baseline[!duplicated(cardiac.2022wk12.baseline$Date), ]

cardiac.2022wk12 <- full_join(cardiac.2022wk12.7DA,cardiac.2022wk12.baseline,by = "Date")
colnames.cardiac <- c("Date","SevenDayAverage","Baseline")
colnames(cardiac.2022wk12) <- colnames.cardiac

# Split off end portion of data as baseline data extends beyond 2022 seven day average data.
cardiac.2022wk12.end <- filter(cardiac.2022,Date >= as.Date("2022-01-20"))
cardiac.2022wk12.rest <- cardiac.2022wk12 %>%
  filter(Date < as.Date("2022-03-02")) %>%
  arrange(Date)

# cardiac.2022wk12.SevenDayAverage.filled <- na.spline(cardiac.2022wk12.rest$SevenDayAverage)
# cardiac.2022wk12.rest$SevenDayAverage <- cardiac.2022wk12.SevenDayAverage.filled

cardiac.2022wk12 <- rbind.data.frame(cardiac.2022wk12.rest,cardiac.2022wk12.end)


#############
# 2023 data #
#############

# Load data
WPD.2023.7DA.filename <- "2023 week 08 Ambulance bulletin - cardiac - 7 day average.csv"
WPD.2023.baseline.filename <- "2023 week 08 Ambulance bulletin - cardiac - baseline.csv"
cardiac.2023.7DA <- read.csv(WPD.2023.7DA.filename,header = FALSE, sep = ",")
cardiac.2023.baseline <- read.csv(WPD.2023.baseline.filename,header = FALSE, sep = ",")

# Change column names
column.names <- c("Date","Calls")
colnames(cardiac.2023.7DA) <- column.names
colnames(cardiac.2023.baseline) <- column.names

# Convert date formats
cardiac.2023.7DA$Date <- as_date(cardiac.2023.7DA$Date)
cardiac.2023.baseline$Date <- as_date(cardiac.2023.baseline$Date)

# Remove duplicates
cardiac.2023.7DA <- cardiac.2023.7DA[!duplicated(cardiac.2023.7DA$Date), ]
cardiac.2023.baseline <- cardiac.2023.baseline[!duplicated(cardiac.2023.baseline$Date), ]

cardiac.2023 <- full_join(cardiac.2023.7DA,cardiac.2023.baseline,by = "Date")
colnames.cardiac <- c("Date","SevenDayAverage","Baseline")
colnames(cardiac.2023) <- colnames.cardiac

# Split off end portion of data as baseline data extends beyond 2023 seven day average data.
cardiac.2023.end <- filter(cardiac.2023,Date >= as.Date("2023-01-20"))
cardiac.2023.rest <- cardiac.2023 %>%
  filter(Date < as.Date("2023-01-20")) %>%
  arrange(Date)

# cardiac.2023.SevenDayAverage.filled <- na.spline(cardiac.2023.rest$SevenDayAverage)
# cardiac.2023.rest$SevenDayAverage <- cardiac.2023.SevenDayAverage.filled

cardiac.2023 <- rbind.data.frame(cardiac.2023.rest,cardiac.2023.end)


######################################################
# Filter out duplicated date ranges from each report #
######################################################

cardiac.2019.filter <- filter(cardiac.2019,Date <= min(cardiac.2020$Date))

# Keep all of 2020 report data

# Keep segment between end of 2020 report and start of 2021 report from 2020wk10 report
cardiac.2020wk10.filter <- filter(cardiac.2020wk10,Date >= max(cardiac.2020$Date) & Date <= min(cardiac.2021$Date)) 

# Keep all of 2021 report data

# Keep segment between end of 2021 report and start of 2022 report from 2021wk08 report
cardiac.2021wk08.filter <- filter(cardiac.2021wk08,Date >= max(cardiac.2021$Date) & Date <= min(cardiac.2022$Date)) 

# Keep all of 2022 report data

# Keep segment between end of 2022 report and start of 2023 report from 2022wk12 report
# cardiac.2022wk12.filter <- filter(cardiac.2022wk12,Date >= max(cardiac.2022$Date) & Date <= min(cardiac.2023$Date)) 


# Pivot the datasets to make them longer
cardiac.2019.long <- cardiac.2019.filter %>%
  # mutate(SevenDayAverage = na.spline(SevenDayAverage,maxgap = 30)) %>%
  # mutate(Baseline = na.spline(Baseline,maxgap = 30)) %>%
  pivot_longer(SevenDayAverage:Baseline,names_to = "Type",values_to = "Calls") %>%
  mutate(Report = "2019wk52")

cardiac.2020.long <- cardiac.2020 %>%
  # mutate(SevenDayAverage = na.spline(SevenDayAverage)) %>%
  # mutate(Baseline = na.spline(Baseline)) %>%
  pivot_longer(SevenDayAverage:Baseline,names_to = "Type",values_to = "Calls") %>%
  mutate(Report = "2020wk03")

cardiac.2020wk10.long <- cardiac.2020wk10.filter %>%
  # mutate(SevenDayAverage = na.spline(SevenDayAverage)) %>%
  # mutate(Baseline = na.spline(Baseline)) %>%
  pivot_longer(SevenDayAverage:Baseline,names_to = "Type",values_to = "Calls") %>%
  mutate(Report = "2020wk10")

cardiac.2021.long <- cardiac.2021 %>%
  # mutate(SevenDayAverage = na.spline(SevenDayAverage)) %>%
  # mutate(Baseline = na.spline(Baseline)) %>%
  pivot_longer(SevenDayAverage:Baseline,names_to = "Type",values_to = "Calls") %>%
  mutate(Report = "2021wk02")

cardiac.2021wk08.long <- cardiac.2021wk08.filter %>%
  # mutate(SevenDayAverage = na.spline(SevenDayAverage)) %>%
  # mutate(Baseline = na.spline(Baseline)) %>%
  pivot_longer(SevenDayAverage:Baseline,names_to = "Type",values_to = "Calls") %>%
  mutate(Report = "2021wk08")

cardiac.2022.long <- cardiac.2022 %>%
  # mutate(SevenDayAverage = na.spline(SevenDayAverage)) %>%
  # mutate(Baseline = na.spline(Baseline)) %>%
  pivot_longer(SevenDayAverage:Baseline,names_to = "Type",values_to = "Calls") %>%
  mutate(Report = "2022wk03")

cardiac.2022wk12.long <- cardiac.2022wk12 %>%
  # mutate(SevenDayAverage = na.spline(SevenDayAverage)) %>%
  # mutate(Baseline = na.spline(Baseline)) %>%
  pivot_longer(SevenDayAverage:Baseline,names_to = "Type",values_to = "Calls") %>%
  mutate(Report = "2022wk12")

cardiac.2023.long <- cardiac.2023 %>%
  # mutate(SevenDayAverage = na.spline(SevenDayAverage)) %>%
  # mutate(Baseline = na.spline(Baseline)) %>%
  pivot_longer(SevenDayAverage:Baseline,names_to = "Type",values_to = "Calls") %>%
  mutate(Report = "2023wk08")

##################################################################################
# Interpolate (approx, linear) between points in baseline and 7 day average data #
# This will yield modelled daily data for each data type.                        #
##################################################################################

# Calculate baseline approximation
cardiac.2019_2023 <- rbind.data.frame(cardiac.2019.filter,
                                      cardiac.2020,
                                      cardiac.2020wk10.filter,
                                      cardiac.2021,
                                      cardiac.2021wk08.filter,
                                      cardiac.2022,
                                      cardiac.2023)
# Remove duplicates
cardiac.2019_2023 <- cardiac.2019_2023[!duplicated(cardiac.2019_2023$Date), ]

date.range.baseline <- seq(min(cardiac.2019$Date),max(cardiac.2019_2023$Date),1) # Start sequence at 01/01/2019 because cardiac.2019 starts at 02/01/2019.
# date.range.baseline <- seq(min(cardiac.2019_2023$Date),max(cardiac.2019_2023$Date),1)
#day.seq.baseline.full <- seq(1,length(date.range.baseline),1)
cardiac.2019_2023.baseline.approx <- approx(cardiac.2019_2023$Date,
                                            cardiac.2019_2023$Baseline,
                                            method = "linear",
                                            n = length(date.range.baseline))
cardiac.2019_2023.baseline.approx <- cbind.data.frame(date.range.baseline,cardiac.2019_2023.baseline.approx$y)
colnames(cardiac.2019_2023.baseline.approx) <- c("Date","Baseline")

# Calculate seven day average approximation (different date range)
cardiac.2019_2023.sevendayaverage <- cbind.data.frame(cardiac.2019_2023$Date,
                                                      cardiac.2019_2023$SevenDayAverage)
colnames(cardiac.2019_2023.sevendayaverage) <- c("Date","SevenDayAverage")
cardiac.2019_2023.sevendayaverage <- cardiac.2019_2023.sevendayaverage %>%
  filter(!is.na(SevenDayAverage)) # Remove rows with NA values.
date.range.sevendayaverage <- seq(min(cardiac.2019_2023.sevendayaverage$Date),max(cardiac.2019_2023.sevendayaverage$Date),1)
cardiac.2019_2023.sevendayaverage.approx <- approx(cardiac.2019_2023.sevendayaverage$Date,
                                                   cardiac.2019_2023.sevendayaverage$SevenDayAverage,
                                                   method = "linear",
                                                   n = length(date.range.sevendayaverage))
cardiac.2019_2023.sevendayaverage.approx <- cbind.data.frame(date.range.sevendayaverage,cardiac.2019_2023.sevendayaverage.approx$y)
colnames(cardiac.2019_2023.sevendayaverage.approx) <- c("Date","SevenDayAverage")


cardiac.2019_2023.approx <- full_join(cardiac.2019_2023.baseline.approx,cardiac.2019_2023.sevendayaverage.approx)

#####################
# Combine datasets  #
#####################

# cardiac.calls <- rbind.data.frame(cardiac.2019.long,cardiac.2021.long,cardiac.2022.long) # Non-interpolated data
cardiac.calls <- cardiac.2019_2023.approx %>%
  pivot_longer(SevenDayAverage:Baseline,names_to = "Type",values_to = "Calls")

cardiac.calls.report.graphs <- rbind.data.frame(cardiac.2019.long,
                                                cardiac.2020.long,
                                                cardiac.2020wk10.long,
                                                cardiac.2021.long,
                                                cardiac.2021wk08.long,
                                                cardiac.2022.long,
                                                cardiac.2022wk12.long,
                                                cardiac.2023.long)

cardiac.calls.report.graphs <- drop_na(cardiac.calls.report.graphs) # Remove all NA values.
####################
setwd(RootDirectory)