library(fs)
library(stringr)

path_names <- dir_ls(path = ".", glob = "*.mp3")

new_names <- str_remove(string = path_names,
                         pattern = "-\\(JustNaija.com\\)")

file_move(path = path_names,
          new_path = new_names)
