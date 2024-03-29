setwd(GraphsDirectory)
####################

###########################################################
# Graph WebPlotDigitizer data extracted from NASSS graphs #
###########################################################

GraphSubtitle <- "Graph by @bouncingkitten | https://www.drowningindata.blog"

# Custom date formatting to get JFMAMJ... labels
# http://www.jasonfabris.com/blog/dteformat/
dte_formatter <- function(x) { 
  #formatter for axis labels: J, F, M, etc... 
  mth <- substr(format(x, "%b"),1,1) 
  mth 
}

# Create labels and positions for vertical lines which mark the start of each year

vlines.cardiac.calls <- data.frame(Date = c(as.Date("2019-01-01"),
                                            as.Date("2020-01-01"),
                                            as.Date("2021-01-01"),
                                            as.Date("2022-01-01"),
                                            as.Date("2023-01-01")),
                                             Year = c(2019,2020,2021,2022,2023),
                                             Type = rep("SevenDayAverage",5),
                                             Calls = rep(10,5))
cardiac.linetypes <- c("Baseline" = "dashed", 
                      "SevenDayAverage" = "solid")
cardiac.labels <- c("Baseline" = "Baseline",
                      "SevenDayAverage" = "7 day average")
cardiac.colours <- c("Baseline" = "grey50",
                    "SevenDayAverage" = "black")

# Graph cardiac calls (all years)
cardiac.calls.graph.basic <- ggplot(data = cardiac.calls,
                              aes(x = Date,
                                  y = Calls,
                                  colour = Type,
                                  linetype = Type)
                              )+
  ggtitle("National Ambulance Syndromic Surveillance System: England\nCardiac/respiratory arrest calls ",
          subtitle = GraphSubtitle)+
  labs(caption = "Graph source: UK Health Security Agency/Public Health England")+
  theme_tufte()+
  theme(text = element_text(family=""),
        plot.caption = element_text(hjust = 0),
        panel.background = element_rect(fill = 'white', color = 'white'),
        plot.background = element_rect(fill = 'white', color = 'white'),
        legend.position="bottom")+
  scale_x_date(name = "Date",
               breaks = "1 month",
               labels = dte_formatter,
               expand = c(0.03,0.03))+
  scale_y_continuous(name = "Calls",
                     labels = label_comma(accuracy = 1),
                     limits = c(0,500),
                     expand = c(0.06,0))

cardiac.calls.graph.original <- cardiac.calls.graph.basic + 
  geom_vline(data = vlines.cardiac.calls,
             aes(xintercept = Date),
             colour = "grey75",
             show.legend = FALSE)+
  geom_text(data = vlines.cardiac.calls,
            aes(label = Year,
                x = Date,
                y = Calls),
            nudge_x = 15,
            nudge_y = 5,
            colour="grey25",
            angle = 90,
            show.legend = FALSE)+
  geom_line(show.legend = TRUE,
            size = 0.65,
            na.rm = TRUE)+
  scale_linetype_manual(name = "Call type",
                        values = cardiac.linetypes,
                        labels = cardiac.labels)+
  scale_colour_manual(name = "Call type",
                      values = cardiac.colours,
                      labels = cardiac.labels)

ggsave(cardiac.calls.graph.original,filename = paste(GraphFileNameRoot," NASSS Cardiac Calls (original y range).png",sep=""),
       device = png,
       units = "px",
       width = 2300,
       height = 1600,
       bg = "white"
)

# Regraph with closer y axis to show more detail
vlines.cardiac.calls.high <- data.frame(Date = c(as.Date("2019-01-01"),
                                                 as.Date("2020-01-01"),
                                                 as.Date("2021-01-01"),
                                                 as.Date("2022-01-01"),
                                                 as.Date("2023-01-01")),
                                   Year = c(2019,2020,2021,2022,2023),
                                   Type = rep("SevenDayAverage",5),
                                   Calls = rep(220,5))

cardiac.calls.graph.closer <- cardiac.calls.graph.basic + 
  scale_y_continuous(name = "Calls",
                     labels = label_comma(accuracy = 1),
                     limits = c(NA,NA),
                     breaks = c(250,300,350,400,450,500),
                     expand = c(0.06,0))+
  geom_vline(data = vlines.cardiac.calls.high,
             aes(xintercept = Date),
             colour = "grey75",
             show.legend = FALSE)+
  geom_text(data = vlines.cardiac.calls.high,
            aes(label = Year,
                x = Date,
                y = Calls),
            nudge_x = 15,
            nudge_y = 5,
            colour="grey25",
            angle = 90,
            show.legend = FALSE)+
  geom_line(show.legend = TRUE,
            size = 0.65,
            na.rm = TRUE)+
  scale_linetype_manual(name = "Call type",
                        values = cardiac.linetypes,
                        labels = cardiac.labels)+
  scale_colour_manual(name = "Call type",
                      values = cardiac.colours,
                      labels = cardiac.labels)
  
ggsave(cardiac.calls.graph.closer,filename = paste(GraphFileNameRoot," NASSS Cardiac Calls (reduced y range).png",sep=""),
       device = png,
       units = "px",
       width = 2300,
       height = 1600,
       bg = "white"
)


######################################################################################
# Graph WebPlotDigitizer data extracted from NASSS graphs for each report separately #
######################################################################################

cardiac.calls.report.graphs.separate <- ggplot(data = cardiac.calls.report.graphs,
                                               aes(x = Date,
                                                   y = Calls,
                                                   colour = Type,
                                                   linetype = Type,
                                                   group = Type)
                                               )+
  ggtitle("National Ambulance Syndromic Surveillance System: England\nCardiac/respiratory arrest calls ",
          subtitle = GraphSubtitle)+
  labs(caption = "Graph source: UK Health Security Agency/Public Health England")+
  theme_tufte()+
  theme(text = element_text(family=""),
        plot.caption = element_text(hjust = 0),
        panel.background = element_rect(fill = 'white', color = 'white'),
        plot.background = element_rect(fill = 'white', color = 'white'),
        legend.position="bottom")+
  scale_x_date(name = "Date",
               breaks = "1 month",
               labels = dte_formatter,
               expand = c(0.03,0.03))+
  scale_y_continuous(name = "Calls",
                     labels = label_comma(accuracy = 1),
                     limits = c(0,500),
                     expand = c(0.06,0))+
  geom_vline(data = vlines.cardiac.calls.high,
             aes(xintercept = Date),
             colour = "grey75",
             show.legend = FALSE)+
  geom_text(data = vlines.cardiac.calls.high,
            aes(label = Year,
                x = Date,
                y = Calls),
            nudge_x = 15,
            nudge_y = 5,
            colour="grey25",
            angle = 90,
            show.legend = FALSE)+
  geom_line(show.legend = TRUE,
            size = 0.65,
            na.rm = TRUE)+
  scale_linetype_manual(name = "Call type",
                        values = cardiac.linetypes,
                        labels = cardiac.labels)+
  scale_colour_manual(name = "Call type",
                      values = cardiac.colours,
                      labels = cardiac.labels)+
  facet_grid(rows = vars(Report),scales = "free_y")

  
ggsave(cardiac.calls.report.graphs.separate,filename = paste(GraphFileNameRoot," NASSS Cardiac Calls (separates).png",sep=""),
         device = png,
         units = "px",
         width = 2300,
         height = 1600,
         bg = "white"
       )
  
################################################################################################
# Graph WebPlotDigitizer data extracted from NASSS graphs for each report in different colours #
################################################################################################

cardiac.calls.report.graphs.separate.colours <- ggplot(data = cardiac.calls.report.graphs,
                                               aes(x = Date,
                                                   y = Calls,
                                                   colour = Report,
                                                   linetype = Type)
)+
  ggtitle("National Ambulance Syndromic Surveillance System: England\nCardiac/respiratory arrest calls ",
          subtitle = GraphSubtitle)+
  labs(caption = "Graph source: UK Health Security Agency/Public Health England")+
  theme_tufte()+
  theme(text = element_text(family=""),
        plot.caption = element_text(hjust = 0),
        panel.background = element_rect(fill = 'white', color = 'white'),
        plot.background = element_rect(fill = 'white', color = 'white'),
        legend.position="bottom")+
  scale_x_date(name = "Date",
               breaks = "1 month",
               labels = dte_formatter,
               expand = c(0.03,0.03))+
  scale_y_continuous(name = "Calls",
                     labels = label_comma(accuracy = 1),
                     #limits = c(0,500),
                     expand = c(0.06,0))+
  geom_vline(data = vlines.cardiac.calls.high,
             aes(xintercept = Date),
             colour = "grey75",
             show.legend = FALSE)+
  geom_text(data = vlines.cardiac.calls.high,
            aes(label = Year,
                x = Date,
                y = Calls),
            nudge_x = 15,
            nudge_y = 20,
            colour="grey25",
            angle = 90,
            show.legend = FALSE)+
  geom_line(show.legend = TRUE,
            size = 0.65,
            na.rm = TRUE)+
  scale_linetype_manual(name = "Call type",
                        values = cardiac.linetypes,
                        labels = cardiac.labels)#+
  # scale_colour_manual(name = "Call type",
  #                     values = cardiac.colours,
  #                     labels = cardiac.labels)


ggsave(cardiac.calls.report.graphs.separate.colours,filename = paste(GraphFileNameRoot," NASSS Cardiac Calls (separate colours).png",sep=""),
       device = png,
       units = "px",
       width = 2300,
       height = 1600,
       bg = "white"
)

################################################################################################
# Graph WebPlotDigitizer data extracted from NASSS graphs for each report with coloured points #
################################################################################################

cardiac.calls.report.graphs.points <- ggplot(data = cardiac.calls.report.graphs,
                                                       aes(x = Date,
                                                           y = Calls,
                                                           colour = Report,
                                                           shape = Type)
)+
  ggtitle("National Ambulance Syndromic Surveillance System: England\nCardiac/respiratory arrest calls ",
          subtitle = GraphSubtitle)+
  labs(caption = "The coloured points were read directly from the graphs using WebPlotDigitizer. The grey points show interpolated data.\n\nGraphs source: UK Health Security Agency/Public Health England")+
  theme_tufte()+
  theme(text = element_text(family=""),
        plot.caption = element_text(hjust = 0),
        panel.background = element_rect(fill = 'white', color = 'white'),
        plot.background = element_rect(fill = 'white', color = 'white'),
        legend.position="bottom")+
  scale_x_date(name = "Date",
               breaks = "1 month",
               labels = dte_formatter,
               expand = c(0.03,0.03))+
  scale_y_continuous(name = "Calls",
                     labels = label_comma(accuracy = 1),
                     #limits = c(0,500),
                     expand = c(0.06,0))+
  geom_vline(data = vlines.cardiac.calls.high,
             aes(xintercept = Date),
             colour = "grey75",
             show.legend = FALSE)+
  geom_text(data = vlines.cardiac.calls.high,
            aes(label = Year,
                x = Date,
                y = Calls),
            nudge_x = 15,
            nudge_y = 20,
            colour="grey25",
            angle = 90,
            show.legend = FALSE)+
  geom_point(data = cardiac.calls,
             aes(x = Date,
                 y = Calls,
                 shape = Type),
             #shape = 1,
             size = 0.5,
             fill = "grey50",
             colour = "grey50")+
  geom_point(show.legend = TRUE,
                       size = 0.5,
                       na.rm = TRUE)+
  geom_line(show.legend = TRUE,
            size = 0.15,
            alpha = 0.5,
            colour = "grey50",
            na.rm = TRUE)#+
  # scale_linetype_manual(name = "Call type",
  #                       values = cardiac.linetypes,
  #                       labels = cardiac.labels)#+
# scale_colour_manual(name = "Call type",
#                     values = cardiac.colours,
#                     labels = cardiac.labels)


ggsave(cardiac.calls.report.graphs.points,filename = paste(GraphFileNameRoot," NASSS Cardiac Calls (points).png",sep=""),
       device = png,
       units = "px",
       width = 2300,
       height = 1600,
       bg = "white"
)
####################



####################
setwd(RootDirectory)