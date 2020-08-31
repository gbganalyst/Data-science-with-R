str_right <- function(string, n) {
  substr(string, nchar(string) - (n - 1), nchar(string))
}

str_left <- function(string, n) {
  substr(string, 1, n)
}

str_mid <- function(string, from = 1, to = 2){

  substr(string, from, to)
  }


str_mid_bysearch <- function(string, str_search = "search", next_nchars = 0, to = 2){
  
  str_convert =  tolower(c(string, str_search))
  
  
  from = str_locate(string = str_convert[1], pattern = str_convert[2])[2]+ 1+next_nchars
  substr(string,  start = from, stop = from + to-1)
}

str_mid_searchmany <- function(string, str_search = "search", case = FALSE, position = 1, next_nchars = 0, to = 2){
  
position_vector = unlist(gregexpr(pattern = str_search, text = te, ignore.case = case))[position]+1
  
  from = position_vector + 1 + next_nchars
  substr(string,  start = from, stop = from + to-1)
}








x <- "some text in a string"

str_right(c("12345","ABCDE"),2)



te <- "Excel's Macro - Recording and - VBA Concepts by - Lekan"

str_mid_searchmany(te, str_search = "-", to = 50)
