
# How to load packages in a loop

if (!require(xfun)){
  install.packages('xfun')
  }

xfun::pkg_attach(c('ggplot2','dplyr','lubridate','DT'),install = T)

# Another method

if (!require('install.load')){
  install.packages('install.load')
  }

install.load::install_load(c('ggplot2','dplyr','lubridate','DT'))

# Another method
for (pkg in c('ggplot2','dplyr','lubridate')){
  library(pkg,character.only = T)
}

# How to check if a library has been installed before
any(grepl('dplyr', installed.packages()))

