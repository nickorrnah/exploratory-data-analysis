library(plotly)
library(stringr)
library(dplyr)

twitch_df <- read.csv('data.csv')

months <- rev(twitch_df$Month)
hours_watched <- rev((twitch_df$Hours.watched..mins. / 60) / 10000000)
hours_streamed <- rev((twitch_df$Hours.streamed..mins. / 60) / 1000000)
ratio <- rev(twitch_df$Hours.streamed..mins. / twitch_df$Hours.streamed..mins.)

data <- data.frame(months, hours_watched, hours_streamed, ratio)

data$months <- factor(data$months, levels = data[["months"]])

fig <- plot_ly(data, x = ~months, y = ~hours_watched, name = 'Tens of Hours Watched', type = 'scatter', mode = 'lines',
               line = list(color = 'rgb(205, 12, 24)', width = 4)) 

fig <- fig %>% add_trace(y = ~hours_streamed, name = 'Hours Streamed', line = list(color = 'rgb(22, 96, 167)', width = 4))

fig <- fig %>% layout(title = "Hours Streamed and Watched by Month",
                      xaxis = list(title = "Months"),
                      yaxis = list (title = "Hours (millions)"))

print(fig)
