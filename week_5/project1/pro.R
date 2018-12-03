library(tidyverse)
library(rvest)
library(stringr)
library(rebus)
library(lubridate)
library(XML)
library(RCurl)
library(dplyr)

url <-'http://www.imdb.com/search/title?count=100&release_date=2016,2016&title_type=feature'
url

webpage <- read_html(url) 
webpage
names(webpage)


#Using CSS selectors to scrap the rankings section
rank_data_html <- html_nodes(webpage,'.text-primary')

rank_data<- html_attr(rank_data_html)

rank_data
