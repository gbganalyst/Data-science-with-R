library(tidytext)

# reorder_within and scale_x_reordered work.
# (Note that you need to set scales = "free_x" in the facet)

iris_gathered <- pivot_longer(iris, cols = 1:4,names_to = "metric", values_to = "value")


# Before


ggplot(iris_gathered, aes(reorder(Species, value), value)) +
  geom_bar(stat = 'identity') +
  facet_wrap(~ metric)

# After

ggplot(iris_gathered, aes(reorder_within(Species, value, metric), value, fill = Species)) +
  geom_bar(stat = 'identity', show.legend = F) +
  scale_x_reordered() +
  facet_wrap(~ metric, scales = "free")