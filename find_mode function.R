# find_mode function is a function that calculates the mode of a given distribution. Since there is no function for mode in #Rstats, I therefore, wrote a function for it


find_mode <-  function(x){ 
  # x is the given data
  categorize = table(x)
  modal = max(categorize)
  if (all(categorize == modal)){
    modal = NA
  }else if(is.numeric(x)){
      modal = as.numeric(names(categorize)[categorize == modal])
  }else{
    modal = names(categorize)[categorize == modal]
  }
  return(modal)
}


# Example 
x <- c(8,2,7,1,2,9,8,2,10,9)
find_mode(x)

fruit = c(rep('apple', 5), rep('pear', 5), rep('banana', 2))
find_mode(fruit)

fruit2 = c(rep('apple', 5), rep('pear', 5), rep('banana', 5))
find_mode(fruit2)

