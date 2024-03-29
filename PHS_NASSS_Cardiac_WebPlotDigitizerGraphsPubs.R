setwd(GraphsDirectory)
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

# The following graphs do not use the cardiac.calls.report.graphs dataset.
# They use cardiac.2019_2023.approx since this has complete data for every day of each year.
# cardiac.calls.report.graphs only contains the data read using WebPlotDigitizer and has some gaps.
# In cardiac.2019_2023.approx the gaps are filled using interpolated data.

cardiac.2019_2023.approx.graph <- cardiac.2019_2023.approx %>%
  pivot_longer(Baseline:SevenDayAverage,names_to = "Type",values_to = "Calls") %>%
  filter(Date > as.Date("2019-01-01")) %>%
  mutate(Year = year(Date),
         Day = yday(Date)
  )

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
                yday("2020-12-01")#,
                #yday("2020-12-31")
                )

day.breaks.labels <- c("J","F","M","A","M","J","J","A","S","O","N","D")

cardiac.2019_2023.approx.graph$Year <- as.factor(cardiac.2019_2023.approx.graph$Year)
Year.colours <- c("2019" = "#1B9E77",
                  "2020" = "#D95F02",
                  "2021" = "#7570B3",
                  "2022" = "#E7298A",
                  "2023" = "#66A61E"
) 

cardiac.2019_2023.approx.graph.7DayAverage <- filter(cardiac.2019_2023.approx.graph,
                                                  Type == "SevenDayAverage")

cardiac.calls.report.graph.together <- ggplot(data = cardiac.2019_2023.approx.graph.7DayAverage,
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

cardiac.2019_2023.approx.graph.7DayAverage <- cardiac.2019_2023.approx.graph.7DayAverage %>%
  arrange(., Year,Date, by_group = TRUE) %>%
  group_by(Year,Type) %>%
  # order_by(Year) %>%
  mutate(CallsCum=cumsum(Calls))


cardiac.calls.report.graph.together <- ggplot(data = cardiac.2019_2023.approx.graph.7DayAverage,
                                              aes(x = Day,
                                                  y = CallsCum,
                                                  colour = Year,
                                                  #group = Year,
                                                  #linetype = Type
                                              )
)+
  ggtitle("National Ambulance Syndromic Surveillance System: England\nCardiac/respiratory arrest calls, cumulative seven day average ",
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

cardiac.2019_2023.approx.graph$Year <- as.factor(cardiac.2019_2023.approx.graph$Year)
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