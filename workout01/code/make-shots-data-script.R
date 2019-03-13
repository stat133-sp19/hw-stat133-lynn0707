• title: Data Preparation
• description: Creating a csv data file shots-data.csv that will contain
the required variables to be used in the visualization phase.
• input(s): stephen-curry.csv, andre-iguodala.csv, draymond-green.csv, 
data/kevin-durant.csv, klay-thompson.csv
• output(s): shot-data.csv 


data_types <- c("character",
                "factor",
                "double", 
                "double",
                "double",
                "double",
                "character",
                "character",
                "character",
                "double",
                "character",
                "double",
                "double")
curry <- read.csv(file = "data/stephen-curry.csv",TRUE,",",
                  colClasses = data_types,
                  stringsAsFactors=FALSE)
iguodala <- read.csv(file = "data/andre-iguodala.csv", TRUE,",",
                     colClasses = data_types,
                     stringsAsFactors=FALSE)
green <- read.csv(file = "data/draymond-green.csv", TRUE,",",
                  colClasses = data_types,
                  stringsAsFactors=FALSE)
durant <- read.csv(file = "data/kevin-durant.csv",TRUE,",",
                   colClasses = data_types,
                   stringsAsFactors=FALSE)               
thompson <- read.csv(file= "data/klay-thompson.csv",TRUE,",",
                     colClasses = data_types,
                     stringsAsFactors=FALSE)                  

library(dplyr)
curry <- mutate(curry, name ="Stephen Curry") 
iguodala <- mutate(iguodala, name = "Andre Iguodala") 
green <- mutate(green, name = "Draymood Green")
durant <- mutate(durant, name ="Kevin Durant")
thompson <- mutate(thompson, name = "Klay Thompson")

curry$shot_made_flag[curry$shot_made_flag == 'n'] = "shot_no"
curry$shot_made_flag[curry$shot_made_flag == 'y'] = "shot_yes"
iguodala$shot_made_flag[iguodala$shot_made_flag == 'n'] = "shot_no"
iguodala$shot_made_flag[iguodala$shot_made_flag == 'y'] = "shot_yes"
green$shot_made_flag[green$shot_made_flag == 'n'] = "shot_no" 
green$shot_made_flag[green$shot_made_flag == 'y'] = "shot_yes"
durant$shot_made_flag[durant$shot_made_flag == 'n'] = "shot_no" 
durant$shot_made_flag[durant$shot_made_flag == 'y'] = "shot_yes"
thompson$shot_made_flag[thompson$shot_made_flag == 'n'] = "shot_no" 
thompson$shot_made_flag[thompson$shot_made_flag == 'y'] = "shot_yes"

curry <- mutate(curry, minute = period*12 - minutes_remaining)
iguodala <- mutate(iguodala, minute = period*12 - minutes_remaining)
green <- mutate(green, minute = period*12 - minutes_remaining)
durant <- mutate(durant, minute = period*12 - minutes_remaining)
thompson <- mutate(thompson, minute = period*12 - minutes_remaining)

sink(file = 'output/andre-iguodala-summary.txt')
summary(iguodala)
sink(file = 'output/stephen-curry-summary.txt')
summary(curry)
sink(file = 'output/draymood-green-summary.txt')
summary(green)
sink(file = 'output/kevin-durant-summary.txt')
summary(durant)
sink(file = 'output/klay-thompson-summary.txt')
summary(thompson)


shot_data <- rbind(curry, green, iguodala, durant, thompson)
write.csv(shot_data, file = '../data/shot-data.csv')
sink(file = '../output/shot_data-summary.txt')
summary(shot_data)

