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

# Remove duplicates
cardiac.2019.7DA <- cardiac.2019.7DA[!duplicated(cardiac.2019.7DA$Date), ]
cardiac.2019.baseline <- cardiac.2019.baseline[!duplicated(cardiac.2019.baseline$Date), ]

cardiac.2019 <- right_join(cardiac.2019.7DA,cardiac.2019.baseline,by = "Date")
colnames.cardiac <- c("Date","SevenDayAverage","Baseline")
colnames(cardiac.2019) <- colnames.cardiac
# cardiac.2019 <- drop_na(cardiac.2019) # Removes rows where there's only one value available.
# This is due to the overlapping lines in the original plots.

# Keep only January 2019 data
cardiac.2019 <- filter(cardiac.2019,Date >= as.Date("2019-01-01") & Date <= as.Date("2019-01-25")) # Min date of 2020 report is 26/01/19.

# Pivot the datasets to make them longer
cardiac.2019.long <- cardiac.2019 %>%
  mutate(SevenDayAverage = na.spline(SevenDayAverage)) %>%
  pivot_longer(SevenDayAverage:Baseline,names_to = "Type",values_to = "Calls") %>%
  mutate(Report = "2019")


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

cardiac.2020 <- right_join(cardiac.2020.7DA,cardiac.2020.baseline,by = "Date")
colnames.cardiac <- c("Date","SevenDayAverage","Baseline")
colnames(cardiac.2020) <- colnames.cardiac
cardiac.2020 <- drop_na(cardiac.2020) # Removes rows where there's only one value available.
# This is due to the overlapping lines in the original plots.

# Pivot the datasets to make them longer
cardiac.2020.long <- cardiac.2020 %>%
  mutate(SevenDayAverage = na.spline(SevenDayAverage)) %>%
  pivot_longer(SevenDayAverage:Baseline,names_to = "Type",values_to = "Calls") %>%
  mutate(Report = "2020")

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

# Remove duplicates
cardiac.2020wk10.7DA <- cardiac.2020wk10.7DA[!duplicated(cardiac.2020wk10.7DA$Date), ]
cardiac.2020wk10.baseline <- cardiac.2020wk10.baseline[!duplicated(cardiac.2020wk10.baseline$Date), ]

cardiac.2020wk10 <- right_join(cardiac.2020wk10.7DA,cardiac.2020wk10.baseline,by = "Date")
colnames.cardiac <- c("Date","SevenDayAverage","Baseline")
colnames(cardiac.2020wk10) <- colnames.cardiac
cardiac.2020wk10 <- drop_na(cardiac.2020wk10) # Removes rows where there's only one value available.
# This is due to the overlapping lines in the original plots.

# Pivot the datasets to make them longer
cardiac.2020wk10.long <- cardiac.2020wk10 %>%
  mutate(SevenDayAverage = na.spline(SevenDayAverage)) %>%
  pivot_longer(SevenDayAverage:Baseline,names_to = "Type",values_to = "Calls") %>%
  mutate(Report = "2020wk10")

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

# Remove duplicates
cardiac.2021.7DA <- cardiac.2021.7DA[!duplicated(cardiac.2021.7DA$Date), ]
cardiac.2021.baseline <- cardiac.2021.baseline[!duplicated(cardiac.2021.baseline$Date), ]

cardiac.2021 <- right_join(cardiac.2021.7DA,cardiac.2021.baseline,by = "Date")
colnames.cardiac <- c("Date","SevenDayAverage","Baseline")
colnames(cardiac.2021) <- colnames.cardiac
cardiac.2021 <- drop_na(cardiac.2021) # Removes rows where there's only one value available.
# This is due to the overlapping lines in the original plots.

# Keep only 2020 data
cardiac.2021 <- filter(cardiac.2021,Date <= as.Date("2021-01-01"))

# Pivot the datasets to make them longer
cardiac.2021.long <- cardiac.2021 %>%
  mutate(SevenDayAverage = na.spline(SevenDayAverage)) %>%
  pivot_longer(SevenDayAverage:Baseline,names_to = "Type",values_to = "Calls") %>%
  mutate(Report = "2021")

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

# Remove duplicates
cardiac.2021wk08.7DA <- cardiac.2021wk08.7DA[!duplicated(cardiac.2021wk08.7DA$Date), ]
cardiac.2021wk08.baseline <- cardiac.2021wk08.baseline[!duplicated(cardiac.2021wk08.baseline$Date), ]

cardiac.2021wk08 <- right_join(cardiac.2021wk08.7DA,cardiac.2021wk08.baseline,by = "Date")
colnames.cardiac <- c("Date","SevenDayAverage","Baseline")
colnames(cardiac.2021wk08) <- colnames.cardiac
cardiac.2021wk08 <- drop_na(cardiac.2021wk08) # Removes rows where there's only one value available.
# This is due to the overlapping lines in the original plots.

# Keep only 2020 data
# cardiac.2021wk08 <- filter(cardiac.2021wk08,Date <= as.Date("2021-01-01"))

# Pivot the datasets to make them longer
cardiac.2021wk08.long <- cardiac.2021wk08 %>%
  mutate(SevenDayAverage = na.spline(SevenDayAverage)) %>%
  pivot_longer(SevenDayAverage:Baseline,names_to = "Type",values_to = "Calls") %>%
  mutate(Report = "2021wk08")


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

cardiac.2022 <- right_join(cardiac.2022.7DA,cardiac.2022.baseline,by = "Date")
colnames.cardiac <- c("Date","SevenDayAverage","Baseline")
colnames(cardiac.2022) <- colnames.cardiac

# Fill NA values using na.spline() function
# Split off end portion of data as baseline data extends beyond 2022 seven day average data.
cardiac.2022.end <- filter(cardiac.2022,Date >= as.Date("2022-01-20"))
cardiac.2022.rest <- cardiac.2022 %>%
  filter(Date < as.Date("2022-01-20")) %>%
  arrange(Date)

cardiac.2022.SevenDayAverage.filled <- na.spline(cardiac.2022.rest$SevenDayAverage)
cardiac.2022.rest$SevenDayAverage <- cardiac.2022.SevenDayAverage.filled

cardiac.2022 <- rbind.data.frame(cardiac.2022.rest,cardiac.2022.end)

# Pivot the datasets to make them longer
cardiac.2022.long <- cardiac.2022 %>%
  pivot_longer(SevenDayAverage:Baseline,names_to = "Type",values_to = "Calls") %>%
  mutate(Report = "2022")


###########################################################################
# Interpolate (approx, linear) between baseline and 7 day average points. #
# This will yield modelled daily data for each data type.                 #
###########################################################################

# Keep only early 2020 data from 2019 report
#cardiac.2019 <- filter(cardiac.2019,Date >= min(cardiac.2020$Date))

# Baseline data has different date range to seven day average data.

# Calculate baseline approximation
cardiac.2019_2022 <- rbind.data.frame(cardiac.2019,cardiac.2020,cardiac.2020wk10,cardiac.2021,cardiac.2021wk08,cardiac.2022)
# Remove duplicates
cardiac.2019_2022 <- cardiac.2019_2022[!duplicated(cardiac.2019_2022$Date), ]

date.range.baseline <- seq(as.Date("2019-01-01"),max(cardiac.2019_2022$Date),1) # Start sequence at 01/01/2019 because cardiac.2019 starts at 02/01/2019.
# date.range.baseline <- seq(min(cardiac.2019_2022$Date),max(cardiac.2019_2022$Date),1)
#day.seq.baseline.full <- seq(1,length(date.range.baseline),1)
cardiac.2019_2022.baseline.approx <- approx(cardiac.2019_2022$Date,
                                            cardiac.2019_2022$Baseline,
                                            method = "linear",
                                            n = length(date.range.baseline))
cardiac.2019_2022.baseline.approx <- cbind.data.frame(date.range.baseline,cardiac.2019_2022.baseline.approx$y)
colnames(cardiac.2019_2022.baseline.approx) <- c("Date","Baseline")

# Calculate seven day average approximation (different date range)
cardiac.2019_2022.sevendayaverage <- cbind.data.frame(cardiac.2019_2022$Date,
                                                      cardiac.2019_2022$SevenDayAverage)
colnames(cardiac.2019_2022.sevendayaverage) <- c("Date","SevenDayAverage")
cardiac.2019_2022.sevendayaverage <- cardiac.2019_2022.sevendayaverage %>%
  filter(!is.na(SevenDayAverage)) # Remove rows with NA values.
date.range.sevendayaverage <- seq(min(cardiac.2019_2022.sevendayaverage$Date),max(cardiac.2019_2022.sevendayaverage$Date),1)
cardiac.2019_2022.sevendayaverage.approx <- approx(cardiac.2019_2022.sevendayaverage$Date,
                                                   cardiac.2019_2022.sevendayaverage$SevenDayAverage,
                                                   method = "linear",
                                                   n = length(date.range.sevendayaverage))
cardiac.2019_2022.sevendayaverage.approx <- cbind.data.frame(date.range.sevendayaverage,cardiac.2019_2022.sevendayaverage.approx$y)
colnames(cardiac.2019_2022.sevendayaverage.approx) <- c("Date","SevenDayAverage")


cardiac.2019_2022.approx <- full_join(cardiac.2019_2022.baseline.approx,cardiac.2019_2022.sevendayaverage.approx)

#####################
# Combine datasets  #
#####################

# cardiac.calls <- rbind.data.frame(cardiac.2019.long,cardiac.2021.long,cardiac.2022.long) # Non-interpolated data
cardiac.calls <- cardiac.2019_2022.approx %>%
  pivot_longer(SevenDayAverage:Baseline,names_to = "Type",values_to = "Calls")

cardiac.calls.report.graphs <- rbind.data.frame(cardiac.2019.long,
                                                cardiac.2020.long,
                                                cardiac.2020wk10.long,
                                                cardiac.2021.long,
                                                cardiac.2021wk08.long,
                                                cardiac.2022.long)

####################
setwd(RootDirectory)