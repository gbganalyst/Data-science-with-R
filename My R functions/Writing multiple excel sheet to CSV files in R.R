# Writing multiple CSV files

install.load::install_load(c("writexl", "readxl", "tidyverse"))


path <- "berlin_temp.xlsx" 

list_of_dfs <- path %>% excel_sheets() %>% 
  map(read_xlsx, path = path) %>% set_names(., path %>% excel_sheets())
      

# Step 1

# Define a function for exporting csv with the desired file names and into the right path

output_csv <- function(data, names){ 
  folder_path <- "data/"
  
  write_csv(data, paste0(folder_path, names, ".csv"))
}

# Step 2

sent_csv <- list(data = list_of_dfs, names = names(list_of_dfs)) %>% pmap(output_csv)
