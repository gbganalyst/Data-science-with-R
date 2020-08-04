data(cars)

coefs <-  rerun(100, sample_frac(cars, replace= TRUE)) %>%
  map( ~ lm(dist ~ speed, data = .) ) %>%
  map(summary) %>%
  map("coefficients") %>%
  map_dbl(2)

hist(coefs)


