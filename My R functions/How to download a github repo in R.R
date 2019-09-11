# Part 1

# Method 1

# You can download an entire repository from GitHub using R by installing the package usethis:
  
#  install.packages('usethis')

# Copy the .git URL from the Clone or download button on the GitHub repository of interest. Be sure to copy the link address from Download ZIP and not the HTTPS URL.

# For example, I want to download this repository. I will copy the link address from Download ZIP (https://github.com/cwickham/purrr-tutorial.git) and paste it in usethis::use_course() and then remove the .git and replace it with /archive/master.zip

usethis::use_course('https://github.com/cwickham/purrr-tutorial/archive/master.zip')

# You then follow the prompt question from R about where to save the file.

# Method 2

download.file(url = 'https://github.com/cwickham/purrr-tutorial/archive/master.zip', destfile = "purrr-tutorial.zip")

# Part 2

# Create GitHub Resource Downloadable Link

# Do you want to download entire repository or branch of the repository?

# This link can help you to achieve it: https://minhaskamal.github.io/DownGit/#/home
  
  