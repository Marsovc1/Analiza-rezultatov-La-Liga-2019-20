options(warn=-1)

library(dplyr)
library(rvest)

lct <- Sys.getlocale("LC_TIME") #da bomo lahko vrnili stvar na svoje mesto
Sys.setlocale("LC_TIME", "C") #sicer date=(NA,NA,...)

#UVOZ
#=======================================================================================
#poberem podatke iz tabele/div-ov
link <- paste0("https://en.wikipedia.org/wiki/2019%E2%80%9320_Athletic_Bilbao_season")
stran <- html_session(link) %>% read_html()
table <- stran %>% html_nodes(xpath="//div[@class='vevent']")

#zavržem prijateljske tekme, ker niso dober vzorec
zavrzi <- length(table %>% html_nodes(xpath= "//small[text()='Friendly']"))
zavrzi <- zavrzi + 1 + length(table %>% html_nodes(xpath= "//a[text()='Betway Cup']"))
table <- table[zavrzi:length(table)]

#ločim ligo in ostala tekmovanja
liga <- head(table,38)
ostalo <- tail(table,length(table)-38)
#=======================================================================================

#Čiščenje
#=======================================================================================





