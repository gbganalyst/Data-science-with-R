d <- tibble::tribble(~"country", ~"Total", ~"code",~ "medal", ~"count",
                
 "Nigeria" ,28, "NG", "Gold" ,9,
 "Norway", 26, "NO", "Gold", 11)

d %>% ggplot(aes(country, count, fill= country )) + geom_col( width = .3, show.legend = F)+geom_flag(y=-0.5, aes(image = code))+expand_limits(y = -0.5)
