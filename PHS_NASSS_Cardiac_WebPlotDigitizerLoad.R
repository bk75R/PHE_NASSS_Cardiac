setwd(WebPlotDigitizerDirectory)
####################

##########################################################
# Read WebPlotDigitizer data extracted from NASSS graphs #
##########################################################

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

# Keep only 2019 data
cardiac.2020 <- filter(cardiac.2020,Date <= as.Date("2020-01-01"))

# Pivot the datasets to make them longer
cardiac.2020.long <- cardiac.2020 %>%
  mutate(SevenDayAverage = na.spline(SevenDayAverage)) %>%
  pivot_longer(SevenDayAverage:Baseline,names_to = "Type",values_to = "Calls")

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
  pivot_longer(SevenDayAverage:Baseline,names_to = "Type",values_to = "Calls")

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
  pivot_longer(SevenDayAverage:Baseline,names_to = "Type",values_to = "Calls")

#####################
# Combine datasets  #
#####################

cardiac.calls <- rbind.data.frame(cardiac.2020.long,cardiac.2021.long,cardiac.2022.long)

# Remove redundant data frames
rm(cardiac.2020,cardiac.2020.7DA,cardiac.2020.baseline,cardiac.2020.long,
   cardiac.2021,cardiac.2021.7DA,cardiac.2021.baseline,cardiac.2021.long,
   cardiac.2022,cardiac.2022.7DA,cardiac.2022.baseline,cardiac.2022.long)

####################
setwd(RootDirectory)