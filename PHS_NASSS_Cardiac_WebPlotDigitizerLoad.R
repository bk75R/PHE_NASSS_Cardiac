setwd(WebPlotDigitizerDirectory)
####################

#########################################################
# Read WebPlotDigitizer data extracted from NASSS graph #
#########################################################

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

# Pivot the datasets to make them longer
cardiac.2021.long <- cardiac.2021 %>%
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
cardiac.2022 <- drop_na(cardiac.2022) # Removes rows where there's only one value available.
# This is due to the overlapping lines in the original plots.

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