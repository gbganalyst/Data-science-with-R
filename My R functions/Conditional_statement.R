library(tibble)

data <- tribble(
  ~Candidates, ~`data_cleaning`, ~`data_analysis`,
  "Salami", FALSE, FALSE,
  "Paul", TRUE, FALSE,
  "Ezekiel", TRUE, TRUE
)


data

# Task

# I wanted to separate the people into three groups:
  
# People who passed both tests: Group 1
# People who passed one test: Group 2
# People who passed neither test: Group 3

# Solution

data %>% mutate(group = case_when(
  data_cleaning & data_analysis ~ "1",
  xor(data_cleaning, data_analysis) ~ "2",
  !data_cleaning & !data_analysis ~ "3"))

# The end