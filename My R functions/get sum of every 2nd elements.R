# To get the sum for every 2 rows in R

library(tidyverse)
col <- runif(10, 5, 30)
data <- enframe(col, name= NULL, value= "col")

# We can use rowsum to get the sum of every 2 elements in the 'col' column

rowsum(data[,1], as.integer(gl(nrow(data), 2, nrow(data))))

# Select every nth (2) row from dataframe

data[seq(1, nrow(data), 2), 1 ]

df.result = data[seq(1, nrow(data), 2), ]

df.result
