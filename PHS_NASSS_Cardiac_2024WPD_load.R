setwd(WebPlotDigitizerDirectory)
setwd("2024")
####################


##########################################################
# Read WebPlotDigitizer data extracted from NASSS graphs #
##########################################################

################
# 2024 SE data #
################

# Load data
WPD.2024wk8.7DA.SE.filename <- "2024wk8_SE.csv"
cardiac.2024wk8.7DA.SE <- read.csv(WPD.2024wk8.7DA.SE.filename,header = FALSE, sep = ",")

# Change column names
column.names <- c("Date","Calls")
colnames(cardiac.2024wk8.7DA.SE) <- column.names

# Convert date formats
cardiac.2024wk8.7DA.SE$Date <- as_date(cardiac.2024wk8.7DA.SE$Date)

# Remove duplicates
cardiac.2024wk8.7DA.SE <- cardiac.2024wk8.7DA.SE[!duplicated(cardiac.2024wk8.7DA.SE$Date), ]


####################
setwd(RootDirectory)