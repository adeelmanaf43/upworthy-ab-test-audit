library(readr)
ups <- read_csv("data-raw/upworthy-archive-exploratory-packages-03.12.2020.csv")
nrow(ups)
names(ups)
head(ups)


library(dplyr)
ups%>%
  filter(clickability_test_id == "546d88fb84ad38b2ce000024")%>%
  mutate(ctr = clicks / impressions)%>%
  select(clickability_test_id, headline, eyecatcher_id, impressions,
         clicks,ctr, winner)

print(ups%>%
  filter(clickability_test_id == "546d88fb84ad38b2ce000024")%>%
  select(headline, excerpt, lede, eyecatcher_id), width = Inf)


# Checking number of unique values in each column of this test
ups |>
  filter(clickability_test_id == "546d88fb84ad38b2ce000024") |>
  summarise(across(everything(), n_distinct)) |>
  glimpse()


# Checking shared_text
ups |>
  filter(clickability_test_id == "546d88fb84ad38b2ce000024") |>
  pull(share_text)
