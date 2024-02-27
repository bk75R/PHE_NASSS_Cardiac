setwd(DataDirectory)
######################

FOI2024.data <- read_excel("FOI Aug 2023 WeeklyCardRespByAmbTrust.xlsx",
           sheet = "card-resp",
           range = "A3:K17",
           col_names = TRUE)

FOI2024.data <- as_tibble(FOI2024.data)

# Reformat date. Not as robust as splitting before"_", but it works.
FOI2024.data.mod <- FOI2024.data %>%
  mutate("Year" = as.numeric(substr(YrWk,1,4))) %>%
  mutate("Week" = as.numeric(substr(YrWk,6,8))) %>%
  select(-YrWk) %>%
  relocate(Week, .before = EMAS) %>%
  relocate(Year, .before = Week) %>%
  # Pivot data
  pivot_longer(EMAS:EEAS,
               names_to = "Trust",
               values_to = "CardiacCalls")

  
####################
setwd(RootDirectory)