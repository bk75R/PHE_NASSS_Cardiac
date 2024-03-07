setwd(GraphsDirectory)
######################

GraphSubtitle <- "Graph by @bouncingkitten | https://www.drowningindata.blog"

################################################################################################
# Graph FOI data weekly cardiac calls for each trust on same graph                             #
################################################################################################

FOI2024.data.mod$Year <- as.factor(FOI2024.data.mod$Year)
FOI2024.data.mod$Trust <- as.factor(FOI2024.data.mod$Trust)

Year.colours <- c("2019" = "#1B9E77",
                  "2020" = "#D95F02",
                  "2021" = "#7570B3",
                  "2022" = "#E7298A",
                  "2023" = "#66A61E"
) 

trust.labels <- c("EEAS" = "East of England",
                  "EMAS" = "East Midlands",
                  "LAS" = "London",
                  "NEAS" = "North East",
                  "NWAS" = "North West",
                  "SCAS" = "South Central",
                  "SECAS" = "South East Coast",
                  "SWAS" = "South West",
                  "WMAS" = "West Midlands",
                  "YAS" = "Yorkshire")


FOI2024.graph <- ggplot(data = FOI2024.data.mod,
                        aes(x = Week,
                            y = CardiacCalls,
                            colour = Trust,
                            # group = Trust,
                            #linetype = Type
                            )
                        )+
  ggtitle("National Ambulance Syndromic Surveillance System: England\nWeekly Cardiac/respiratory arrest calls,  ",
          subtitle = GraphSubtitle)+
  labs(caption = "Graphs source: UK Health Security Agency/Public Health England")+
  theme_tufte()+
  theme(text = element_text(family=""),
        plot.caption = element_text(hjust = 0),
        panel.background = element_rect(fill = 'white', color = 'white'),
        plot.background = element_rect(fill = 'white', color = 'white'),
        legend.position="right")+
  scale_x_continuous(name = "Week")+
  scale_y_continuous(name = "Weekly calls",
                     labels = label_comma(accuracy = 1),
                     # breaks = c(250,300,350,400,450,500),
                     # limits = c(0,500),
                     expand = c(0.06,0)
  )+
  geom_line(show.legend = TRUE,
            size =1.5,
            alpha = 0.75,
            na.rm = TRUE)

ggsave(FOI2024.graph,filename = paste(GraphFileNameRoot," FOI 2024 weekly cardiac calls by Trust.png",sep=""),
       device = png,
       units = "px",
       width = 2300,
       height = 1600,
       bg = "white"
)


####################
setwd(RootDirectory)