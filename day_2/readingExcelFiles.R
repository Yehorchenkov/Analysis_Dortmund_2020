library(dplyr)

# In this lecture we will read file excel file 
# from https://data.kyivcity.gov.ua

if (!file.exists("data")) dir.create("data")

fileUrl <- 
    "https://data.kyivcity.gov.ua/sites/default/files/1557-_serpen_2020.xls"

# Don't forget to add method = "curl" for htpps connection
download.file(fileUrl, destfile = "./data/appeal.xls", method = "curl")

dataDownloaded <- date()


library(readxl)
# The readxl package makes it easy to get data out of Excel and into R. 
# Compared to many of the existing packages 
# (e.g. gdata, xlsx, xlsReadWrite)
# readxl has no external dependencies, so it's easy to install and use
# on all operating systems. It is designed to work with tabular data.

# read_excel() reads both xls and xlsx files and detects 
# the format from the extension.

appealdata <- read_excel("./data/appeal.xls")

appealdata

# A problem with multiple header rows
## skip rows
appealdata <- read_excel("./data/appeal.xls", skip = 1)

## read only header
cnames <- read_excel("./data/appeal.xls", n_max = 0) %>% names
names(appealdata) <- cnames
appealdata

# reading specific rows and columns
read_excel("./data/appeal.xls", range = cell_cols(1:3))

read_excel("./data/appeal.xls", range = cell_rows(1:3))

# reading range
read_excel("./data/appeal.xls", range = "A1:B8")


