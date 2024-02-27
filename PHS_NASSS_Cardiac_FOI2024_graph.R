setwd(GraphsDirectory)
######################

################################################################################################
# Graph NASSS baselines for each year on same graph                                            #
################################################################################################

FOI2024.data.mod$Year <- as.factor(FOI2024.data.mod$Year)
Year.colours <- c("2019" = "#1B9E77",
                  "2020" = "#D95F02",
                  "2021" = "#7570B3",
                  "2022" = "#E7298A",
                  "2023" = "#66A61E"
) 

cardiac.2019_2023.approx.graph.baselines <- filter(cardiac.2019_2023.approx.graph,
                                                   Type == "Baseline")

cardiac.calls.report.graph.together <- ggplot(data = cardiac.2019_2023.approx.graph.baselines,
                                              aes(x = Day,
                                                  y = Calls,
                                                  colour = Year,
                                                  #group = Year,
                                                  #linetype = Type
                                              )
)+
  ggtitle("National Ambulance Syndromic Surveillance System: England\nCardiac/respiratory arrest calls, baselines ",
          subtitle = GraphSubtitle)+
  labs(caption = "Graphs source: UK Health Security Agency/Public Health England")+
  theme_tufte()+
  theme(text = element_text(family=""),
        plot.caption = element_text(hjust = 0),
        panel.background = element_rect(fill = 'white', color = 'white'),
        plot.background = element_rect(fill = 'white', color = 'white'),
        legend.position="right")+
  scale_x_continuous(name = "Date",
                     breaks = day.breaks,
                     labels = day.breaks.labels)+
  scale_y_continuous(name = "Daily calls (baselines)",
                     labels = label_comma(accuracy = 1),
                     breaks = c(250,300,350,400,450,500),
                     # limits = c(0,500),
                     expand = c(0.06,0)
  )+
  # geom_point(show.legend = TRUE,
  #          size = 0.5,
  #          na.rm = TRUE)+
  geom_line(show.legend = TRUE,
            size =1.5,
            alpha = 0.75,
            na.rm = TRUE)+
  # scale_linetype_manual(name = "Call type",
  #                       values = cardiac.linetypes,
  #                       labels = cardiac.labels)+
  scale_colour_manual(name = "Year",
                      values = Year.colours,
                      labels = cardiac.labels)



ggsave(cardiac.calls.report.graph.together,filename = paste(GraphFileNameRoot," NASSS Cardiac Calls (baselines).png",sep=""),
       device = png,
       units = "px",
       width = 2300,
       height = 1600,
       bg = "white"
)


####################
setwd(RootDirectory)