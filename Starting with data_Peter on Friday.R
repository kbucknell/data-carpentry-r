library(tidyverse)

interviews <- read_csv("data/SAFI_clean.csv", na="NULL")

#Dimensions of table
view(interviews)
dim(interviews)
nrow(interviews) # number of rows
ncol(interviews)

dim(interviews)[1] ==nrow(interviews) #[] indicate rows then columns

interviews
head(as.data.frame(interviews)) #shows first few lines. Have to add 'as data frame' because this is a tibble(kind of like a viewer)
tail(as.data.frame(interviews)) #shows last few lines.

names(interviews)  #tells you column titles
str(interviews)  #tells you structure of dataframe, what data types of each column
summary(interviews) #quick overview of data, not so good for character data

interviews[1,1] #gives you A1 entry in interview data [ for subsetting, rows 1st]
interviews[1,6]
interviews[ ,1] #gives all rows of column 1 ie. space means take everything
interviews[1] #1st column is the exception

1:3 #: means create a sequence of numbers
interviews[1:3, 7] #first 3 entries of column 7
interviews[3, ] #all of row 3
interviews[1:6, ] #rows 1-6 of all columns, ie same as 'head' function

interviews[,-1] #all rows, remove first column but actual data hasn't changed
interviews_no_id <- interviews[,-1] #creates new object that has no IDs

#Exercise
interviews_100 <- interviews[100, ]
nrow(interviews)
interviews[131, ] #or tail(interviews, n=1)
interviews[nrow(interviews), ]
interviews_last <- interviews[nrow(interviews), ] #or create n_rows and save interviews_last as interviews[n_rows, ]
n_rows <- nrow(interviews)
#q3
middle_idx <-ceiling(n_rows/2)
interviews[middle_idx, ]

#q4
interviews_head <- interviews[-(7:n_rows), ]

#Factors, a specialised data type
floor_type <- factor(c("earth", "cement", "cement", "earth"))
levels(floor_type) #levels are the values a factor can have, R sorts alphabetically
nlevels(floor_type) #number of levels

#reordering levels so they're not alphabetical
floor_type <- factor(c("earth", "cement", "cement", "earth"), 
                     levels=c("earth", "cement"))
#changing entry names
levels(floor_type)[2] <-"brick"

#turns factor into a character
as.character(floor_type)

#Pitfall for factors that look like numbers eg.year
year_fct <- factor(c(1990, 1983, 1977, 1998, 1990))
as.numeric(year_fct) # but it's turned the responses into indices/ categoriesie.1, 2, 3, 4, 1
as.character(year_fct) #if character entries look like number, R treats them as numbers
as.numeric(as.character(year_fct)) #this gives you years as numbers again

#another way to convert factor numbers into other numbers, preferred but not very intuitive
#exploit the indices and turn them into levels
levels(year_fct)[year_fct]
as.numeric(levels(year_fct))[year_fct]
table(year_fct) #tells you how many of each years there are
