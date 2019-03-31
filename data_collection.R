# ---- install package
install.packages("gtrendsR")

# ---- google trends query
trends <- gtrendsR::gtrends(
  keyword = c("fobia social", "social phobia"),
  geo = c("CL", "GB"),
  time = "2018-01-01 2018-12-31")

# ---- get interest over time 
interest_over_time <- trends$interest_over_time

# ---- save data
readr::write_csv(
  x = interest_over_time,
  path = 'data/interest_over_time.csv')
