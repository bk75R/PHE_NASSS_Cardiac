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

# Remove duplicates (produced due to WebPlotDigitizer process - doesn't get every point, and duplicates some.)
cardiac.2024wk8.7DA.SE <- cardiac.2024wk8.7DA.SE[!duplicated(cardiac.2024wk8.7DA.SE$Date), ]

# Add tags (region and report)

Region <- rep("SE",nrow(cardiac.2024wk8.7DA.SE))
Report <- rep("2024wk8",nrow(cardiac.2024wk8.7DA.SE))

cardiac.2024wk8.7DA.SE <- cbind(cardiac.2024wk8.7DA.SE,Region,Report)

#############################################
#                                           #
# Use FOR loop or similar to load datasets. #
# Keep consistent name format.              #
# Add tag for region, report, year          #
# to each dataset.                          #
#                                           #
#############################################

filenames <- list.files(pattern = ".csv") # List data files in directory
column.names <- c("Date","Calls","Region","Report")

for (Filecounter in 1:length(filenames)) {
  # Set up filename and region and report tags
  file.current <- filenames[Filecounter] # Get nth filename
  file.elements <- strsplit(file.current,"_") # Split up name by underscore
  file.report <- file.elements[[1]][1] # Report is first section
  file.region <- strsplit(file.elements[[1]][2],"[.]")[[1]][1] # Region is first half of second section.
  
  # Load file
  file.data <- read.csv(file.current,header = FALSE, sep = ",")
  file.data$V2 <- as_date(file.data$V2) # Convert date formats
  
  # Remove duplicates (produced due to WebPlotDigitizer process - doesn't get every point, and duplicates some.)
  file.data <- file.data[!duplicated(file.data$Date), ]
  
  # Add tags (region and report)
  Region <- rep(file.region,nrow(file.data))
  Report <- rep(file.report,nrow(file.data))
  file.data <- cbind(file.data,Region,Report)
  colnames(file.data) <- column.names # Change column names
  
}
rm(Filecounter,file.current,file.elements,file.report,file.region,Region,Report) # Delete temp loop variables



####################
setwd(RootDirectory)