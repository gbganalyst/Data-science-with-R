# Load packages and data
library(tidyverse)
library(reshape2)

jobs_gender <- readr::read_csv("https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2019/2019-03-05/jobs_gender.csv")

# Prepare data
teacher_gender <- subset(jobs_gender, occupation=="Postsecondary teachers" | occupation=="Preschool and kindergarten teachers" | occupation=="Elementary and middle school teachers" | occupation=="Secondary school teachers" | occupation=="Special education teachers" | occupation=="Teacher assistants"| occupation=="Other teachers and instructors")

teacher_gender$percent_male <- 100 - teacher_gender$percent_female
teacher_gender2016 <- subset(teacher_gender, year=="2016")
teacher_gender2016_melt <- teacher_gender2016[, c("percent_female","percent_male","occupation")]
teacher_gender2016_melt <- melt(teacher_gender2016_melt, id.vars='occupation')

# Graph data
teacherTypeGender <- ggplot(teacher_gender2016_melt, aes(x=reorder(occupation, ifelse(variable=="percent_female", value, -value)), y=ifelse(variable=="percent_female", -value, value), fill=variable))

teacherTypeGender +
  labs(title="Distribution of Women and Men in Various Teaching Professions",
       caption="2016 Data from the United States Census Bureau",
       y="Distribution (Percent)") +
  scale_x_discrete(labels = c("Postsecondary education", "Other teaching or instruction", "Secondary education", "Elementary and middle school", "Special education", "Assistant teaching", "Preschool and kindergarten")) +
  scale_fill_manual(values=c("#009E73", "#0072B2"),
                    breaks=c("percent_female", "percent_male"),
                    labels=c("Women", "Men")) +
  geom_col(width = 0.4) +
  scale_y_continuous(limits = c(-100,100),
                     labels = c(100,50,0,50,100),
                     expand = expand_scale(0)) +
  theme(panel.grid.major.y = element_blank(),
        legend.position = c(0.85, 0.8),
        axis.ticks.y = element_blank(),
        axis.title.y = element_blank(),
        axis.text.y = element_text(size=11),
        axis.title.x = element_text(size=12),
        plot.margin = margin(t = 15,r = 15,b = 15,l = 15, unit = "pt")) +
  geom_hline(yintercept = 0) +
  coord_flip()

# Save graph
ggsave("teacherTypeGender.png", plot = last_plot())
