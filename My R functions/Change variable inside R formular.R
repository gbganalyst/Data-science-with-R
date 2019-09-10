# Changing the variable inside an R formula

#I recently encountered a situation where I wanted to run several linear models, but where the response variables would depend on previous steps in the data analysis pipeline. Let me illustrate using the mtcars dataset:

# as.formula() converts a string to a formula object. Hence, we can programmatically create the formula we want as a string, then pass that string to as.formula():
  
response_list <- c("mpg", "disp", "drat") 
for (y in response_list) {
  lmfit <- lm(as.formula(paste(y, "~.")), data = mtcars)
  print(lmfit$coefficients)
}
  
# source: https://www.r-bloggers.com/changing-the-variable-inside-an-r-formula/
  
  
