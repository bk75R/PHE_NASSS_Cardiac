setwd(WebPlotDigitizerDirectory)
####################

#######################################################
# Read WebPlotDigitizer data extracted from PHS graph #
#######################################################

WebPlotDigitizerData_AllCause_Filename <- "AllCause.csv"
WebPlotDigitizerData_COVID_Filename <- "COVID.csv"

AcuteAllCauseAdmissionsDaily <- read.csv(WebPlotDigitizerData_AllCause_Filename,header = FALSE, sep = ",")
COVIDAdmissionsDaily <- read.csv(WebPlotDigitizerData_COVID_Filename,header = FALSE, sep = ",")
# COVIDAdmissionsDaily is messy - lots of duplicated dates.
# However, this isn't an issue for a simple graph of daily admissions as the extra data points
# don't change the general shape of the graph.
# These would become an issue if we calculated weekly admissions based on these data.

colnames(AcuteAllCauseAdmissionsDaily) <- c("Date","AllCauseAdmissionsDaily")
colnames(COVIDAdmissionsDaily) <- c("Date","COVIDAdmissionsDaily")

# Convert date formats
AcuteAllCauseAdmissionsDaily$Date <- as_date(AcuteAllCauseAdmissionsDaily$Date)
COVIDAdmissionsDaily$Date <- as_date(COVIDAdmissionsDaily$Date)

# Remove duplicates
AcuteAllCauseAdmissionsDaily <- AcuteAllCauseAdmissionsDaily[!duplicated(AcuteAllCauseAdmissionsDaily$Date), ]
COVIDAdmissionsDaily <- COVIDAdmissionsDaily[!duplicated(COVIDAdmissionsDaily$Date), ]

# Pivot the datasets to make them longer
AcuteAllCauseAdmissionsDaily_long <- AcuteAllCauseAdmissionsDaily %>%
  pivot_longer(AllCauseAdmissionsDaily,names_to = "Type",values_to = "Admissions")

COVIDAdmissionsDaily_long <- COVIDAdmissionsDaily %>%
  pivot_longer(COVIDAdmissionsDaily,names_to = "Type",values_to = "Admissions")

# Use rbind.data.frame() to combine datasets while retaining messiness.
AdmissionsDaily <- rbind.data.frame(AcuteAllCauseAdmissionsDaily_long,COVIDAdmissionsDaily_long)

####################
setwd(RootDirectory)