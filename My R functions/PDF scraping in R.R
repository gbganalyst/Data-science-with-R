
# How to scrape tables from a PDF file ----

# The purpose of this R script is to demonstrate how to scrape tables from a PDF file.

# Step 1:  Install and import the necesaary packages ----

if(!require('install.load')){
  install.packages('install.load')
}

install.load::install_load(c("tidyverse", "tabulizer", "rJava"))


# Need to make sure Java installed and know where it is located

# Copy / paste path below next to JAVA_HOME

# Sys.setenv(JAVA_HOME='C:\\Program Files\\Java\\jre1.8.0_221')


# Step 2: Import PDF and use extract_tables function from "tabulizer" to scrape it

data <- "Registration form user.pdf"

extracted_table <- extract_tables(data, method = "decide", output = "data.frame")

pdf_table <- extracted_table%>% 
  chuck(1) %>% as_tibble()

col_names <- pdf_table %>% 
  slice(1) %>%
  pivot_longer(cols = everything()) %>% 
  pull(value)
  
clean_table <- pdf_table %>%
  set_names(col_names) %>%
  slice(-1) %>%
  # 2. Fix columns that were combined
  separate(`Email Gender`, into = c("Email", "Gender"), sep = " ", remove = TRUE)

theme_set(theme_bw())


clean_table %>% count(Gender) %>% 
  mutate(pct= round(n/sum(n)*100)) %>%  
  ggplot(aes(x = Gender, y = n, fill = Gender)) + 
  geom_col(width = 0.3, show.legend = FALSE)+
  labs(x = 'Gender', y = 'Number of paticipants', title = 'Gender distribution',subtitle = 'IbadanR meet up participants') +
  geom_text(aes(label = str_c(pct, " %")), vjust= 4.5, size=2.5, colour = 'black')+
  theme(legend.position = 'top', axis.title.y = element_text(size = 12, face ='bold'), axis.title.x = element_text(size = 12, face='bold'), axis.text.x = element_text(angle = 50, vjust = 0.3, face = 'bold'))+ggthemes::theme_clean()

ggsave('Gender distribution of registered members.png')
