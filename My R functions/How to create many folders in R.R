# This create 12 folders according to months in the time sheet folder

subfolder_names <- month.name

for (j in seq_along(subfolder_names)){
  folder<-dir.create(paste0("C:/Users/OGUNDEPO EZEKIEL .A/Desktop/Timesheet/",subfolder_names[j]))
}


# A function that create folders in each of the month folder

week <- function(month) {
  
  subfolder_names <- c("Doyinsola","Oluwaseun","Gbemileke","Funminiyi","Oluwatobi","Opeyemi","Wuraola","Brain","Michael","Tunmise","Ezekiel","Olusola","Olalekan","Anaeze","Abel","Oluyemi","Sarah","Halimah","Chimaoge","Enoch","Kessiena","Adedayo","Remilekun","Olawale","Warrie","Patrick","Michael","Chinazo","Sandra","Peter","David","Oluwaseyi","Rising","Elisha","Stephen","Somtochukwu")
  
  
  
  for (j in seq_along(subfolder_names)){
    folder<-dir_create(paste0("C:/Users/OGUNDEPO EZEKIEL .A/Desktop/Timesheet/", month,"/", subfolder_names[j]))
  }
}


# This is a recursive function that copy all the folders for every month
for (i in seq_along(month.name)){
  week(month.name[i])  
}



# create nested folders in current directory in R?


cidr <- getwd()
mkfldr <- "test1/project/code/example"
dir.create(file.path(cidr, mkfldr), recursive = TRUE)


browseURL("https://www.masterdataanalysis.com/r/working-with-files-and-folders-in-r/")
