library(tidyverse)
library(rvest)
library(stringr)
library(rebus)
library(lubridate)
library(XML)
library(RCurl)
library(dplyr)

input <-'https://www.gmb.org.br/'
input

webpages <- read_html(input) 
webpages

#Using CSS selectors to scrap the rankings section
tab_data_html <- html_nodes(webpages,'.DrpDwnMn0_i7xcj8csrepeaterButtonlabel')
tab_data_html

tab_data<- html_text(tab_data_html)
tab_data


input1<- 'https://www.gmb.org.br/copia-online-version'
onlinePage<- read_html(input1)

data_html<- html_nodes(onlinePage, '.c4inlineContent')
data_html
tab_data<- html_text(data_html)
tab_data

html <- getURL(input1, followlocation=TRUE)
doc = htmlParse(html, asText=TRUE)
Title = xpathSApply(doc, "//*[@id='artTitle']", xmlValue)
Title
