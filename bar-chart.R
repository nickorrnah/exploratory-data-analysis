library(plotly)
library(stringr)
library(dplyr)

twitch_df <- read.csv("twitch.csv")


pv2016_df <- twitch_df[twitch_df$Year == 2016,]
pv2017_df <- twitch_df[twitch_df$Year == 2017,]
pv2018_df <- twitch_df[twitch_df$Year == 2018,]
pv2019_df <- twitch_df[twitch_df$Year == 2019,]
pv2020_df <- twitch_df[twitch_df$Year == 2020,]
pv2021_df <- twitch_df[twitch_df$Year == 2021,]
pv2022_df <- twitch_df[twitch_df$Year == 2022,]

pv2016 <- signif(max(pv2016_df$Peak.viewers)/1000000, 3)
pv2017 <- signif(max(pv2017_df$Peak.viewers)/1000000, 3)
pv2018 <- signif(max(pv2018_df$Peak.viewers)/1000000, 3)
pv2019 <- signif(max(pv2019_df$Peak.viewers)/1000000, 3)
pv2020 <- signif(max(pv2021_df$Peak.viewers)/1000000, 3)
pv2021 <- signif(max(pv2021_df$Peak.viewers)/1000000, 3)
pv2022 <- signif(max(pv2022_df$Peak.viewers)/1000000, 3)

years = c(2016, 2017, 2018, 2019, 2020, 2021, 2022)
peakviews = c(pv2016, pv2017, pv2018, pv2019, pv2020, pv2021, pv2022) 
                    
barplot(peakviews, years,
        main = "Annual Peak Viewership on Twitch",
        xlab = "Year",
        ylab = "Viewers(Millions)",
        names.arg = years,
        col = "purple",
        horiz = "false")



