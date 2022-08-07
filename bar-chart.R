library(plotly)
library(stringr)
library(dplyr)

twitch_df <- read.csv("twitch.csv")
peakviews <- twitch_df$Peak.viewers.
totalviews <- sum(peakviews)
gettotalviews <- function(yr){
  peakviews_df <- twitch_df %>% filter(str_detect(twitch_df$Month, yr))
  peakviews_df <- peakviews$Peak.viewers
  return(sum(peakviews_df))
}

year <- c("2016", "2017", "2018", "2019", "2020", "2021", "2022" )
peakviews <- c(gettotalviews("2016"),
               gettotalviews("2017"), gettotalviews("2018"),
               gettotalviews("2019"), gettotalviews("2020"),
               gettotalviews("2021"), gettotalviews("2022"))
annualviewers_df <- data.frame(year, peakviews)

bar<- plot_ly(annualviewers_df, labels = ~year, values = ~peakviews,
                   type = 'barplot',
                   textpostion = 'outside',
                   textinfo = 'label',
                   insidetextfont = list(color = '#FFFFFF'),
                   hoverinfo = 'text',
                   text = ~paste(peakviews),
                   marker = list(colors = colors,
                                 line = list(color ='#FFFFFF', width = 1)))
bar <- bar %>% layout(title = 'Peak Views',
                      yaxis = list(showgrid = FALSE, zeroline = FALSE, showticklabels = FALSE),
                      yaxis = list(showgrid = FALSE, zeroline = FALSE, showticklabels = FALSE))

