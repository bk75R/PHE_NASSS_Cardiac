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

################################################################################################
# Graph NASSS 7 day average from summer to summer for each year                                #
################################################################################################

# Calculate midpoint of each year in days
midpoint2019 <- floor(time_length(interval(ymd("2019-01-01"),ymd("2019-12-31")),"days")/2)
midpoint2020 <- floor(time_length(interval(ymd("2020-01-01"),ymd("2020-12-31")),"days")/2)
midpoint2021 <- floor(time_length(interval(ymd("2021-01-01"),ymd("2021-12-31")),"days")/2)
midpoint2022 <- floor(time_length(interval(ymd("2022-01-01"),ymd("2022-12-31")),"days")/2)
midpoint2023 <- floor(time_length(interval(ymd("2023-01-01"),ymd("2023-12-31")),"days")/2)
# These are all "182". Use that in pivot calculations instead.

# Classify each year from summer to summer
# i.e. from 24 June 2019 to 24 June 2020 is "2019-2020"
# This will allow summer to summer graphs to show midwinter peak in centre of graph
cardiac.calls.report.graphs <- cardiac.calls.report.graphs %>%
  filter(Date >= as.Date("2019-01-01")) %>%
  mutate(Year = year(Date),
         Day = yday(Date),
         SummerYear = case_when(
           Date <= as.Date("2019-06-24") ~ "2018-2019",
           Date > as.Date("2019-06-24") & Date <= as.Date("2020-06-24") ~ "2019-2020",
           Date > as.Date("2020-06-24") & Date <= as.Date("2021-06-24") ~ "2020-2021",
           Date > as.Date("2021-06-24") & Date <= as.Date("2022-06-24") ~ "2021-2022",
           Date > as.Date("2022-06-24") & Date <= as.Date("2023-06-24") ~ "2022-2023"
           ),
         # MidYearDay = case_when(
         #   Year == 2019 ~ yday("2019-06-24"),
         #   Year == 2020 ~ yday("2020-06-24"),
         #   Year == 2021 ~ yday("2021-06-24"),
         #   Year == 2022 ~ yday("2022-06-24"),
         #   Year == 2023 ~ yday("2023-06-24")
        #   ),
         SummerYearDay = case_when(
           Day < 182 ~ as.numeric(Day + 182),
           Day >= 182 ~ as.numeric(Day - 182)
         )
         )
cardiac.calls.report.graphs <- arrange(cardiac.calls.report.graphs,SummerYearDay)

cardiac.calls.report.graphs$SummerYear <- as.factor(cardiac.calls.report.graphs$SummerYear)

# Sort dataset by SummerYearDay



cardiac.calls.report.graph.summer <- ggplot(data = cardiac.calls.report.graphs,
                                             aes(x = SummerYearDay,
                                                 y = Calls,
                                                 colour = SummerYear,
                                                 # group = SummerYear,
                                                 linetype = Type
                                                 )
)+
  ggtitle("National Ambulance Syndromic Surveillance System: England\nCardiac/respiratory arrest calls ",
          subtitle = GraphSubtitle)+
  labs(caption = "Timeline runs from June to June for each year.\n\nGraphs source: UK Health Security Agency/Public Health England")+
  theme_tufte()+
  theme(text = element_text(family=""),
        plot.caption = element_text(hjust = 0),
        panel.background = element_rect(fill = 'white', color = 'white'),
        plot.background = element_rect(fill = 'white', color = 'white'),
        legend.position="right")+
  scale_x_continuous(breaks = c(0,50,100,182,200,250,300,350))+
  scale_y_continuous(name = "Calls",
                     labels = label_comma(accuracy = 1),
                     #limits = c(0,500),
                     expand = c(0.06,0)
                     )+
  # geom_vline(data = vlines.cardiac.calls.high,
  #            aes(xintercept = Date),
  #            colour = "grey75",
  #            show.legend = FALSE)+
  # geom_text(data = vlines.cardiac.calls.high,
  #           aes(label = Year,
  #               x = Date,
  #               y = Calls),
  #           nudge_x = 15,
  #           nudge_y = 20,
  #           colour="grey25",
  #           angle = 90,
  #           show.legend = FALSE)+
  # geom_point(data = cardiac.calls,
  #            aes(x = Date,
  #                y = Calls,
  #                shape = Type),
  #            #shape = 1,
  #            size = 0.5,
  #            fill = "grey50",
  #            colour = "grey50")+
  geom_point(show.legend = TRUE,
            size = 0.5,
            na.rm = TRUE)+
  # geom_line(show.legend = TRUE,
  #           size = 0.5,
  #           alpha = 1,
  #           #colour = "grey50",
  #           na.rm = TRUE)+
  # geom_path(show.legend = FALSE,
  #           size = 0.5,
  #           alpha = 1,
  #           #colour = "grey50",
  #           na.rm = TRUE)+
  facet_grid(rows = vars(SummerYear),
             cols = vars(Type))+
  scale_linetype_manual(name = "Call type",
                      values = cardiac.linetypes,
                      labels = cardiac.labels)#+
# scale_colour_manual(name = "Call type",
#                     values = cardiac.colours,
#                     labels = cardiac.labels)+
  


ggsave(cardiac.calls.report.graph.summer,filename = paste(GraphFileNameRoot," NASSS Cardiac Calls (summer to summer).png",sep=""),
       device = png,
       units = "px",
       width = 2300,
       height = 1600,
       bg = "white"
)

################################################################################################
# Graph NASSS 7 day average for each year on same graph                                        #
################################################################################################

day.breaks <- c(yday("2020-01-01"),
                yday("2020-02-01"),
                yday("2020-03-01"),
                yday("2020-04-01"),
                yday("2020-05-01"),
                yday("2020-06-01"),
                yday("2020-07-01"),
                yday("2020-08-01"),
                yday("2020-09-01"),
                yday("2020-10-01"),
                yday("2020-11-01"),
                yday("2020-12-01"),
                yday("2020-12-31"))
  
day.breaks.labels <- c("J","F","M","A","M","J","J","A","S","O","N","D","")

cardiac.calls.report.graphs$Year <- as.factor(cardiac.calls.report.graphs$Year)
Year.colours <- c("2019" = "#1B9E77",
                  "2020" = "#D95F02",
                  "2021" = "#7570B3",
                  "2022" = "#E7298A",
                  "2023" = "#66A61E"
) 

cardiac.calls.report.graphs.7DayAverage <- filter(cardiac.calls.report.graphs,
                                                  Type == "SevenDayAverage")

cardiac.calls.report.graph.together <- ggplot(data = cardiac.calls.report.graphs.7DayAverage,
                                            aes(x = Day,
                                                y = Calls,
                                                colour = Year,
                                                #group = Year,
                                                #linetype = Type
                                                )
                                            )+
  ggtitle("National Ambulance Syndromic Surveillance System: England\nCardiac/respiratory arrest calls, seven day average ",
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
  scale_y_continuous(name = "Daily calls",
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

  

ggsave(cardiac.calls.report.graph.together,filename = paste(GraphFileNameRoot," NASSS Cardiac Calls (seven day average).png",sep=""),
       device = png,
       units = "px",
       width = 2300,
       height = 1600,
       bg = "white"
)

################################################################################################
# Graph NASSS 7 day average for each year on same graph (cumulative)                           #
################################################################################################

cardiac.calls.report.graphs.7DayAverage <- cardiac.calls.report.graphs.7DayAverage %>%
  arrange(., Year,Date, by_group = TRUE) %>%
  group_by(Year) %>%
  # order_by(Year) %>%
  mutate(CallsCum=cumsum(Calls))


cardiac.calls.report.graph.together <- ggplot(data = cardiac.calls.report.graphs.7DayAverage,
                                              aes(x = Day,
                                                  y = CallsCum,
                                                  colour = Year,
                                                  #group = Year,
                                                  #linetype = Type
                                              )
)+
  ggtitle("National Ambulance Syndromic Surveillance System: England\nCardiac/respiratory arrest calls, seven day average ",
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
  scale_y_continuous(name = "Cumulative daily calls",
                     labels = label_comma(accuracy = 1),
                     # breaks = c(250,300,350,400,450,500),
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



ggsave(cardiac.calls.report.graph.together,filename = paste(GraphFileNameRoot," NASSS Cardiac Calls (seven day average, cumulative).png",sep=""),
       device = png,
       units = "px",
       width = 2300,
       height = 1600,
       bg = "white"
)

################################################################################################
# Graph NASSS baselines for each year on same graph                                            #
################################################################################################

cardiac.calls.report.graphs$Year <- as.factor(cardiac.calls.report.graphs$Year)
Year.colours <- c("2019" = "#1B9E77",
                  "2020" = "#D95F02",
                  "2021" = "#7570B3",
                  "2022" = "#E7298A",
                  "2023" = "#66A61E"
) 

cardiac.calls.report.graphs.baselines <- filter(cardiac.calls.report.graphs,
                                                  Type == "Baseline")

cardiac.calls.report.graph.together <- ggplot(data = cardiac.calls.report.graphs.baselines,
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