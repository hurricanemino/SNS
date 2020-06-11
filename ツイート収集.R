# 必要なパッケージの準備
install.packages("rtweet", dependencies = TRUE)
library(rtweet)

# ツイートデータの収集
x = search_tweets("人工知能", n = 10000)

# テキストマイニングに必要な項目に絞る
install.packages("dplyr")
library(dplyr)
x.df = x %>%
  select(text, display_text_width,
         is_retweet, is_quote, 
         favorite_count, retweet_count, 
         quote_count) %>%
  as.data.frame()

# ツイートの保存
write.csv(x.df, "人工知能.csv")