#Easy way to export multiple dataframe to multiple excel worksheets

# This is very possible with a library `openxlsx` 

library(openxlsx)
dataframe1=women
dataframe2=InsectSprays
list_of_datasets <- list(`Name of DataSheet1` = dataframe1, `Name of Datasheet2` = dataframe2)
write.xlsx(list_of_datasets, "list_of_datasets.xlsx")


