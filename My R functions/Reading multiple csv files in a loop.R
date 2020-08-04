library(tidyverse)

setwd("C:/Users/ogund/Desktop/DATA/data") # Put all the csv files into the directory called data

# Method 1

filenames <- dir(full.names = F) # To list all the  csv files

All <- lapply(filenames, function(i) {
  read_csv(i)
})

new_df <- do.call(rbind.data.frame, All) # To combine the multiple csv files

View(new_df)

# Method 2

file <- dir("C:/Users/ogund/Desktop/DATA/data", full.names = T)
df <- vector("list", length(file))
for (i in seq_along(file)) {
  df[[i]] <- read_csv(file[[i]])
}
df <- do.call(rbind.data.frame, df)
View(df)

# Method 3 works but i have a case here where it will not work
data <- dir(full.names = T) %>% map_df(read_csv)
View(data)

# https://www.r-bloggers.com/import-excel-sheets-with-r/

# https://www.r-bloggers.com/vignette-write-read-multiple-excel-files-with-purrr/