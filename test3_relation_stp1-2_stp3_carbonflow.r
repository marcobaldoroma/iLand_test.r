
############################################   STP3      management    #######################################


install.packages("RSQLite")
library(RSQLite)

file <-"D:/iLand/TEST3_folder/output/subregion_medium_test1.sqlite"   # file to read


sqlite.driver <- dbDriver("SQLite")
db1 <- dbConnect(sqlite.driver, dbname = file)  # connect to the file
tables.in.the.file<-dbListTables(db1)           # explore the tables in the file
print(tables.in.the.file)


#-----------------------------------------------
# READ IN different tables:    (here can read in by table names.... depending on what you have in your outputfile)

carbon <- dbReadTable(db1,"carbon")
carbonflow <- dbReadTable(db1,"carbonflow")
# wind <- dbReadTable(db1,"wind")
# barkbeetle <- dbReadTable(db1,"barkbeetle")
# lremoved <- dbReadTable(db1,"landscape_removed")
landscape <- dbReadTable(db1,"landscape")
abeStand <- dbReadTable(db1, "abeStand")
stand <- dbReadTable(db1, "stand")
#abeStandRemoval <- dbReadTable(db1, "abeStandRemoval")

dbDisconnect(db1)    # close the file

# Make a plot with ggplot, volume, colored by species....

library(ggplot2)
landscape <- ggplot(landscape, aes(year,volume_m3, fill=species))+
  geom_area() + ggtitle("Cz Landscape scale wood volume m3/ha")
landscape+ theme(plot.title =element_text(hjust = 0.5))


ggplot(carbonflow, aes(year,GPP))+
  geom_area()

ggplot(carbonflow, aes(year,NPP))+
  geom_area()

ggplot(carbonflow, aes(year,NEP))+
  geom_area()

ggplot(carbonflow, aes(year,cumNPP))+
  geom_area()

ggplot(carbonflow, aes(year,cumRh))+
  geom_area()

ggplot(carbonflow, aes(year,cumNEP))+
  geom_area()
# ggplot(abeStand, aes(year,volume, fill=standid))+   
#   geom_line()

############################################   second part same model but with planting trees piab  #######################################

_______________________________________________  STP2 -> STP1 + planting + clearcut in any stand   ___________________________________________

install.packages("RSQLite")
library(RSQLite)

#file <-"D:/TEST_folder_3/output/subregion_medium_test3.sqlite"   # file to read

dataroot<-"C:/TEST_folder_3/output/"
file<-paste0(dataroot,"subregion_medium_test3.sqlite")


sqlite.driver <- dbDriver("SQLite")
db1 <- dbConnect(sqlite.driver, dbname = file)  # connect to the file
tables.in.the.file<-dbListTables(db1)           # explore the tables in the file
print(tables.in.the.file)


# READ IN different tables:    (here can read in by table names.... depending on what you have in your outputfile)

carbon <- dbReadTable(db1,"carbon")
carbonflow <- dbReadTable(db1,"carbonflow")
# wind <- dbReadTable(db1,"wind")
# barkbeetle <- dbReadTable(db1,"barkbeetle")
# lremoved <- dbReadTable(db1,"landscape_removed")
landscape <- dbReadTable(db1,"landscape")
abeStand <- dbReadTable(db1, "abeStand")
abeUnit <- dbReadTable(db1, "abeUnit")
stand <- dbReadTable(db1, "stand")
abeStandRemoval <- dbReadTable(db1, "abeStandRemoval")
dynamicstand <- dbReadTable(db1, "dynamicstand")


dbDisconnect(db1)    # close the file

# Make a plot with ggplot, volume, colored by species....

library(ggplot2)
landscape <- ggplot(landscape, aes(year,volume_m3, fill=species))+
  geom_area() + ggtitle("Cz Landscape scale wood volume m3/ha")
landscape+ theme(plot.title =element_text(hjust = 0.5))


ggplot(carbonflow, aes(year,GPP))+
  geom_area()

ggplot(carbonflow, aes(year,NPP))+
  geom_area()

ggplot(carbonflow, aes(year,NEP))+
  geom_area()

ggplot(carbonflow, aes(year,cumNPP))+
  geom_area()

ggplot(carbonflow, aes(year,cumRh))+
  geom_area()

ggplot(carbonflow, aes(year,cumNEP))+
  geom_area()
# ggplot(abeStand, aes(year,volume, fill=standid))+   
#   geom_line()

_________________________________________________________   KNITR REPORT LATEX IN R ENVIRONMENT, OUTPUT PDF,JPG, TEXT,LATEX  _____________________________________


# needed to work properly with latex

tinytex::install_tinytex()
tinytex::tlmgr_update()

# libraries needed for knitr report

library (knitr)
library (tinytex)         # librerie necessarie


# vedi la funzione stitch e trova altri template da qui. https://rdrr.io/cran/knitr/man/stitch.html
# I hided only warnings #delete the warning, message and codes in the report.
# To hide the warnings use the code here or go in the link to study other functionalities

# knitr::opts_chunk$set(warning = FALSE, message = FALSE, echo = FALSE)

stitch("C:/Users/baldo/Desktop/script_4_carbonflow/script_4_carbonflow.txt", template=system.file("misc", "knitr-template.Rnw", package="knitr"))






