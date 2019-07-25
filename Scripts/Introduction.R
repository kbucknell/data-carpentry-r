# Load required packages
#Install packages("tidyverse")
library(tidyverse)


print("hello world")

(area_hectares <- 1.0)
1.0 -> area_hectares



area_hectares <- 2.5      # leand area in hectares
area_acres <- 2.47 * area_hectares  # convert to acres
area_acres                 # print

3.5 -> length
4.0 -> width
area <- length * width
area

#Functions
# e.g. b <- sqrt(x = a)

round(3.14159, digits = 2)

#Vectors
no_membrs <- c(3, 7, 10, 6)
length(no_membrs)

respondent_walltype <- c("muddaub", "Burntbricks", "sunbricks")
length(respondent_walltype)
str(respondent_walltype)

possessions <- c("bicycle", "radio", "television")
possessions <- c(possessions, "moble_phone") #add another elemt to a vector
possessions <- c("car",possessions)

num_char <- c(1,2,3, "a")
num_logical <- c(1,2,3, FALSE)
char_logical <- c("a", "b", "c", TRUE)
tricky <- c(1, 2, 3, "4")

#Subsetting

respondent_walltype[2]
respondent_walltype[c(3,2)]   #Have to put into a vecor t/f use c

more_respondent_walltype <- respondent_walltype[c(1,2,3,2,1)]

no_membrs[c(TRUE, FALSE, TRUE, TRUE)]
no_membrs[no_membrs > 5]

#combing logical statements
no_membrs[no_membrs < 3 | no_membrs > 5]   # | is "or"
no_membrs[no_membrs >= 7 & no_membrs ==3]  # == means equals, = is just a function symbol

#searching in a vector e.g. does possessions include a bicycle
possessions[possessions == "car" | possessions == "bicycle"]
possessions %in% c("car", "bicycle")    #shortcut
