library(tidyverse)
library(tidylog)

tibble(
  col1= c('ve4', '', '', '', 've5', '',''),
  col2= c('ve4', '', '', '', 've5', '',''),
  col3= c('ve4', '', '', '', 've5', '',''),
  col4= c('ve4', '', '', '', 've5', '',''),
  col5=1:7
)%>% mutate_all(.,~na_if(.,""))%>% fill(names(.),.direction = 'down')
