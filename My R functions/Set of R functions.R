
# List of some functions that i wrote to solve a given problem

if (!require('install.load')){
  install.packages('install.load')
} library(install.load)

install_load('tidyverse')

# Function that prints out the square of a vector
output <- function(x){
result <- vector('numeric',length=length(x))
for (i in seq_along(x)){
  result[i] = i^2}
return(result)}

output(c(1,2,3,4,5))


# function that returns any specified function (i.e. mean, median) of all numeric columns of a dataset 

col_summary <- function(df,fun=mean) {
  output=vector(mode ='numeric', length = ncol(df))
  names(output)=names(df)
  for (i in seq_along(df)){
    if(is.numeric(df[[i]])){
      output[[i]]=fun(df[[i]],na.rm = T)}
  }
  return(output)
}
col_summary(iris, mean)

map_dbl(iris,mean)



mt <- function(df){
  output <- vector('numeric', length = ncol(df))
  for (i in seq_along(df)){
    output[[i]] <- length(unique(df[[i]])) }
  names(output) <- names(df)
  return(output)
}

# function that solve a particular cooling system for a given temperature
output=vector('list', length = 4)
def=function(To,A,k){
  t=c(5,10,15,20)
  for (i in seq_along(t)){
    output[[i]]=(To-A)*exp(-k*t[[i]])+A}
  return(unlist(output))
}
def(100,60,0.0367)


# Rescaling dataframe to 1 and 0

# Version 1

set.seed(10)
df <- tibble(
  a = rnorm(10),
  b = rnorm(10),
  c = rnorm(10),
  d = rnorm(10))

rescale01 <- function(x){
  rng = range(x,na.rm = T)
  (x-rng[1])/rng[2]-rng[1]
}
for (i in seq_along(df)){
  df[[i]]=rescale01(df[[i]])
}

# Rescaling dataframe to 1 and 0

# Version 2


df <- tibble(
  a = rnorm(10),
  b = rnorm(10),
  c = rnorm(10),
  d = rnorm(10)
)

rescale01 <- function(df) {
  output=vector('double', length = ncol(df))
  
  for (i in seq_along(df)){
    output[[i]]=(df[i]-min(df[i]))/(max(df[i])-min(df[i]))
  }
  return(bind_cols(output))
}

rescale01(df)


# Function that prints the square and cube of any given vector
square_cube <- function(x) {
  square=vector('numeric', length=length(x))
  cube=vector('numeric', length=length(x))
  for(i in seq_along(x) ){
    square[[i]]=i^2
    cube[[i]]=i^3
  }
  return(list(square, cube))
}


# Function that generate random normal variables of any given size
random_normal <- function(n) {
  output=vector('list',length = length(n))
  mu=c(-10,0,10,100)
  sd=c(1:4)
  for (i in seq_along(mu)){
    set.seed(1)
    output[[i]]=rnorm(n,mu[[i]],sd[[i]])}
  return(bind_cols(output))}
random_normal(5)


# Function that returns column class for any specify data set

column_type <- function(df) {
  output=vector('list',length = length(df))
  names(output)=names(df)
  for (i in seq_along(df)){
    output[[i]]=class(df[[i]])}
  return(output)
}

column_type(iris)


# Function to estimate the skewness 

skewness <- function(x){
  meu=mean(x, na.rm = T)
  sigma=sd(x, na.rm=T)
  result=3*(meu-median(x,na.rm=T))/ sigma
  return(result)
}

skewness(c(1, 2, 5, 3))



# Function that calculates age
age <- function(year, month, day) {
  year <- readline("What year were you born: ")
  month <- readline("What month were you born: ")
  day <- readline("What day of the week were you born: ")
  birth <- make_date(year, month, day)
  age <- floor(as.numeric(as.duration(today() - birth), "year"))
}
cat("Your age is", age(year, month, day))

# https://www.r-bloggers.com/practice-using-lubridate-theatrically/


# List of some function in purrr package for data simulations

mu <- list(5,10,-3)
mu %>% map(rnorm,n=5)

map(c(5,10,-3),rnorm,n=5)

mu <- c(5,10,-3)
sigma=c(1,5,10)
n=list(1,3,5)
args1=list(n,mu,sigma)
args1 %>% pmap(rnorm)


mu <- c(5,10,-3)
sigma=c(1,5,10)
n=c(1,3,5)
args2=list(mean= mu,sd=sigma,n=n)
args2 %>% pmap(rnorm)

params <- tribble(
  ~mea, ~s, ~n,
  5,1,3,
  10,5,3,
  -3,10,3
)

params %>% pmap(rnorm) %>% 
  bind_cols()


x=list(1,'a',3)
x %>% walk(print)

iris %>% keep(is.factor) %>% View()




