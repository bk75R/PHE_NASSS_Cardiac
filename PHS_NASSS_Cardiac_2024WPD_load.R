setwd(WebPlotDigitizerDirectory)
setwd("2024")
####################


##########################################################
# Read WebPlotDigitizer data extracted from NASSS graphs #
##########################################################

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
file.data.all <- data.frame(A = character(),
                            B = numeric(),
                            C = character(),
                            D = character()
)
colnames(file.data.all) <- column.names

# column.names.normalised <- c("Date","CallsNormalised","Region","Report")
file.data.all.scaled <- file.data.all # Data frame for scaled (0-1) dataset
# colnames(file.data.all.scaled) <- column.names.normalised

for (Filecounter in 1:length(filenames)) {
  # Set up filename and region and report tags
  file.current <- filenames[Filecounter] # Get nth filename
  file.elements <- strsplit(file.current,"_") # Split up name by underscore
  file.report <- file.elements[[1]][1] # Report is first section
  file.region <- strsplit(file.elements[[1]][2],"[.]")[[1]][1] # Region is first half of second section.
  
  # Load file
  file.data <- read.csv(file.current,header = FALSE, sep = ",")
  # Remove duplicates (produced due to WebPlotDigitizer process - doesn't get every point, and duplicates some.)
  file.data <- file.data[!duplicated(file.data$V2), ]
  
  # Add tags (region and report)
  Region <- rep(file.region,nrow(file.data))
  Report <- rep(file.report,nrow(file.data))
  file.data <- cbind(file.data,Region,Report)
  colnames(file.data) <- column.names # Change column names
  
  # Calculate normalised data
  # minCalls <- min(file.data$Calls,na.rm = TRUE)
  # maxCalls <- max(file.data$Calls,na.rm = TRUE)
  
  # Scaled data
  # file.data.scaled <- file.data %>%
  #   mutate(Calls = (Calls - minCalls)/(maxCalls - minCalls))
  # colnames(file.data.scaled) <- column.names.normalised
  # 
  # Add current file data to whole data frame
  file.data.all <- rbind.data.frame(file.data.all,file.data)
  # file.data.all.scaled <- rbind.data.frame(file.data.all.scaled,file.data.scaled)
  
}
rm(Filecounter,file.current,file.elements,file.report,file.region,Region,Report) # Delete temp loop variables
file.data.all$Date <- as_date(file.data.all$Date) # Convert date formats
# file.data.all.scaled$Date <- as_date(file.data.all.scaled$Date) # Convert date formats

file.data.all.scaled <- file.data.all %>%
  group_by(Region) %>%
  mutate(CallsNormalised <- (Calls - min(Calls, na.rm = TRUE))/(max(Calls,na.rm = TRUE) - min(Calls,na.rm = TRUE)))
colnames(file.data.all.scaled) <- c("Date","Calls","Region","Report","CallsNormalised")


####################
setwd(RootDirectory)