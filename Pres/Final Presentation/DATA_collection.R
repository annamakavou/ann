 





# ---- Library
 library("gtrendsR")
 
 
 

# ---- google trends query
trends <- gtrendsR::gtrends(
  keyword = c("fobia social", "social phobia"),
  geo = c("CL", "GB"),
  time = "2018-01-01 2018-12-31")




# ---- get interest over time 
interest_over_time <- trends$interest_over_time


# ---- save data
   write.csv(interest_over_time, file = "interest_OVER_time.csv")


# ---- get the means
CL <-c(interest_over_time$hits[1:52])
   mean(CL)
GB <-c(interest_over_time$hits[53:104])
   mean(GB)
   
   
   
# ---- generate data
   df_wide <- data.frame(CL,GB)
   df_long <- tidyr::gather(
          df_wide, CL,GB,
          key = group, value = score)
   
# ---- show our wide data  
    knitr::kable(head(df_wide))
   
   
# ---- show our long data
    knitr::kable(head(df_long))

   
# ---- t.test
    t.test(CL,GB)
   
  
# ---- geom_plot
    library(ggplot2)
    ggplot(data = interest_over_time, aes(x = geo, y = hits)) + 
      geom_point()
    
    
# ---- show table
library(knitr) 
kable(interest_over_time)

