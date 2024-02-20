setwd(DataDirectory)
######################

FOI2024.data <- read_excel("FOI Aug 2023 WeeklyCardRespByAmbTrust.xlsx",
           sheet = "card-resp",
           range = "A3:K17",
           col_names = TRUE)


####################
setwd(RootDirectory)