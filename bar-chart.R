library(plotly)
library(stringr)
library(dplyr)

twitch_df <- read.csv('data.csv')

gettotalviews <- function(yr) {

  peakviews_df <- twitch_df %>% filter(str_detect(twitch_df$Month, yr))
  #print(max(peakviews_df$Peak.viewers))
  result <- (signif(max(peakviews_df$Peak.viewers) / 1000000, 3))
  return(result)

}

year <- c("2016", "2017", "2018", "2019", "2020", "2021", "2022" )

peakviews <- c(gettotalviews("2016"),
               gettotalviews("2017"), gettotalviews("2018"),
               gettotalviews("2019"), gettotalviews("2020"),
               gettotalviews("2021"), gettotalviews("2022"))

annualviewers_df <- data.frame(year, peakviews)

bar_chart <- plot_ly(annualviewers_df,
                     x = ~year,
                     y = ~peakviews, 
                     type = 'bar')

bar_chart <- bar_chart %>% layout( title = "Peak Viewers for each Year on Twitch",
                                   xaxis = list(title = "Year"),
                                   yaxis = list(title = "Viewers (millions)"))

