# A function that calculates BMI!

# Press ctrl+shift+Enter to run the script

# Hmmmm R console is now your robot, please follow the prompt

BMI=function(height, weight,name){
  name= readline('Welcome to Data science with R! \n Please, what name can I call you? :')
  height= readline('What is your height in cm ? :')
  height=as.double(height)/100
  weight= as.double(readline('What is your weight in kg ? :'))
  bmi=weight/height^2 
  
  if (bmi< 18.5)
    cat('Dear', name,', your BMI is', bmi,'. Therefore, you are underweight')
  else if (bmi>=18.5 & bmi<=24.9)
    cat('Dear ', name,', your BMI is', bmi,'. Therefore, you have healthy weight') 
  else if (bmi>=25 & bmi<=29.9)
    cat('Dear', name,', your BMI is', bmi,'. Therefore, you are overweight') 
  else
    cat('Dear', name,', your BMI is', bmi,'.Sorry, do more exercise because of your obesity')
  }

BMI()
