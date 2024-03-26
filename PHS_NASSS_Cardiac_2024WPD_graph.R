setwd(GraphsDirectory)
######################

GraphSubtitle <- "Graph by @bouncingkitten | https://www.drowningindata.blog"

################################################################################################
# Graph FOI data weekly cardiac calls for each trust on same graph                             #
################################################################################################

file.data.all$Report <- as.factor(file.data.all$Report)
file.data.all$Region <- as.factor(file.data.all$Region)

Year.colours <- c("2019" = "#1B9E77",
                  "2020" = "#D95F02",
                  "2021" = "#7570B3",
                  "2022" = "#E7298A",
                  "2023" = "#66A61E"
) 

trust.labels <- c("EE" = "East of England",
                  "EM" = "East Midlands",
                  "LON" = "London",
                  "NE" = "North East",
                  "NW" = "North West",
                  # There are two regions in the FOI data that aren't in the
                  # NASSS PDF files.
                  # "SC" = "South Central",
                  # "SEC" = "South East Coast",
                  "SE" = "South East",
                  "SW" = "South West",
                  "WM" = "West Midlands",
                  "YH" = "Yorkshire")


FOI2024.graph <- ggplot(data = file.data.all,
                        aes(x = Date,
                            y = Calls,
                            colour = Region,
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
  scale_x_date(name = "Date")+
  scale_y_continuous(name = "Weekly calls",
                     labels = label_comma(accuracy = 1),
                     # breaks = c(250,300,350,400,450,500),
                     # limits = c(0,500),
                     expand = c(0.06,0)
  )+
  geom_line(show.legend = TRUE,
            size =0.75,
            alpha = 0.75,
            na.rm = TRUE)

ggsave(FOI2024.graph,filename = paste(GraphFileNameRoot," NASSS weekly cardiac calls by Trust.png",sep=""),
       device = png,
       units = "px",
       width = 2300,
       height = 1600,
       bg = "white"
)


FOI2024.graph.faceted <- ggplot(data = file.data.all,
                        aes(x = Date,
                            y = Calls,
                            colour = Region,
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
  scale_x_date(name = "Date")+
  scale_y_continuous(name = "Weekly calls",
                     labels = label_comma(accuracy = 1),
                     # breaks = c(250,300,350,400,450,500),
                     # limits = c(0,500),
                     expand = c(0.06,0)
  )+
  geom_line(show.legend = FALSE,
            size =0.5,
            alpha = 0.75,
            na.rm = TRUE)+
  facet_wrap(vars(Region),
             scales = "free_y",
             labeller = as_labeller(trust.labels))

ggsave(FOI2024.graph.faceted,filename = paste(GraphFileNameRoot," NASSS weekly cardiac calls by Trust (faceted).png",sep=""),
       device = png,
       units = "px",
       width = 2300,
       height = 1600,
       bg = "white"
)


####################
setwd(RootDirectory)