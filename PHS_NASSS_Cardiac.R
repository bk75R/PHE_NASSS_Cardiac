#####################################################################################
#
#
# PHS_NASSS_Cardiac.R
# 
# Graphing and cleaning up UK NASSS cardiac calls data
# ============================================================================
#
#
####################################################################################

# Set up libraries
library(ggplot2)
library(ggthemes) # theme_tufte()
library(tidyr)
library(dplyr)
library(scales)
library(lubridate)
library(zoo)
library(readxl)

###################################################
#                                                 #
# Load and reformat data                          #
#                                                 #
###################################################

# Set working directories
RootDirectory <- getwd() # This should be the directory in which the .R file is found.
DataDirectory <- paste(RootDirectory,"/data",sep = "")
GraphsDirectory <- paste(RootDirectory,"/graphs",sep = "")
WebPlotDigitizerDirectory <- paste(RootDirectory,"/WebPlotDigitizer",sep = "")

GraphFileNameRoot <- as.character(format(Sys.Date(),"%Y-%m-%d"))

source("PHS_NASSS_Cardiac_WebPlotDigitizerLoad.R") # Load data extracted from graph using WebPlotDigitizer - https://apps.automeris.io/wpd/

# source("PHS_NASSS_Cardiac_WebPlotDigitizerGraphs.R") # Graph data from WebPlotDigitizer

# source("PHS_NASSS_Cardiac_WebPlotDigitizerGraphsPubs.R") # Graph data from WebPlotDigitizer(publication ready versions)

# source("PHS_NASSS_Cardiac_WebPlotDigitizerSaveData.R") # Save data with formats for easier reuse (for R and spreadsheets)

source("PHS_NASSS_Cardiac_FOI2024_load.R") # Load 2024 FOI data.
source("PHS_NASSS_Cardiac_FOI2024_graph.R") # Graph 2024 FOI data.
##########################################################################################
setwd(RootDirectory)
