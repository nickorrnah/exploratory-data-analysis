library(dplyr)

twitch_df <- read.csv("data.csv")

summary_info <- list()

# Ratio of hours watched to hours streamed across Twitch's lifetime.
streamed_watched_ratio <- sum(twitch_df$Hours.watched..mins.) / sum(twitch_df$Hours.streamed..mins.)
summary_info$streamed_watched_ratio <- signif(streamed_watched_ratio, 3)

# Highest ever concurrent viewer count
max_viewers <- max(twitch_df$Peak.viewers)
summary_info$max_viewers <- signif(max_viewers / 1000000 , 2)

# Month with the highest average viewers
max_avg_viewers <- max(twitch_df$Average.viewers)
max_avg_view_month <- filter(twitch_df, Average.viewers == max_avg_viewers)
max_avg_view_month <- max_avg_view_month$Month
summary_info$max_avg_view_month <- max_avg_view_month

# Average hours watched pre-covid (before March 2020)
pre_covid_avg <- twitch_df %>% slice(29:78)
pre_covid_avg <- sum(pre_covid_avg$Hours.watched..mins.) / 60
pre_covid_avg <- pre_covid_avg / 50
summary_info$pre_covid_avg <- signif((pre_covid_avg / 100000000) , 3)

# Average hours watched post-covid (March 2020 to present)
post_covid_avg <- twitch_df %>% slice(1:28)
post_covid_avg <- sum(post_covid_avg$Hours.watched..mins.) / 60
post_covid_avg <- post_covid_avg / 28
summary_info$post_covid_avg <- signif((post_covid_avg / 100000000), 4)

# Difference between post-covid and pre-covid hours watched
difference <- post_covid_avg - pre_covid_avg
percent_difference <- post_covid_avg / pre_covid_avg
summary_info$percent_difference <- signif(percent_difference, 3)

return(summary_info)

