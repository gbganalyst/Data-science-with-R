# Function that count the number of missing value in each column of a dataframe

library(tidyverse)

count_na <- function(dataframe) {
  count <- dataframe %>% is.na() %>% as_tibble() %>% mutate_all(as.numeric) %>% summarise_all(sum) %>% t()
  return(count)
}
