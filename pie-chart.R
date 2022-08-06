library(plotly)
library(stringr)
library(dplyr)


twitch_df <- read.csv('data.csv')

hours_watched <- twitch_df$Hours.watched..mins.

total_hours_watched <- (sum(hours_watched))

get_hours_watched <- function(yr) {
  
  hours_watched_df <- twitch_df %>% filter(str_detect(twitch_df$Month, yr))
  hours_watched_df <- hours_watched_df$Hours.watched..mins. / 60
  return(sum(hours_watched_df))
  
}

Year <- c("2016", "2017", "2018", "2019", "2020", "2021", "2022")
hours_watched <- c(get_hours_watched("2016"), 
                   get_hours_watched("2017"), get_hours_watched("2018"), 
                   get_hours_watched("2019"), get_hours_watched("2020"),
                   get_hours_watched("2021"), get_hours_watched("2022"))

hours_by_year_df <- data.frame(Year, hours_watched)

pie_chart <- plot_ly(hours_by_year_df, labels = ~Year, values = ~hours_watched,
                     type = 'pie', 
                     textposition = 'inside',
                     textinfo = 'label+percent',
                     insidetextfont = list(color = '#FFFFFF'),
                     hoverinfo = 'text',
                     text = ~paste('$', hours_watched, ' billions'),
                     marker = list(colors = colors,
                                   line = list(color = '#FFFFFF', width = 1)))

pie_chart <- pie_chart %>% layout(title = 'Percentage of Hours Watched by Year',
                                  xaxis = list(showgrid = FALSE, zeroline = FALSE, showticklabels = FALSE),
                                  yaxis = list(showgrid = FALSE, zeroline = FALSE, showticklabels = FALSE))

print(pie_chart)

