library(dplyr)
library(tidyr)

interviews <- read_csv("data/SAFI_clean.csv", na="NULL")

#Selecting columns from data
select(interviews, village, no_membrs, years_liv) #first argument in brackets is the dataframe
filter(interviews, village == "God") #requires logic for filtering eg. gives me only data for village 'God', is case sensitive
filter(interviews, village == "God", no_membrs > 6) #entries from God with at least 7 members

#easy to chain these functions together
select_cols <- select(interviews, village, no_membrs, years_liv)
god_data <- filter(select_cols, village == "God", no_membrs > 6)

#feeding into, piping, t'f don't have to say data, line break after the pipe symbol %>%
interviews %>% select(village, no_membrs, years_liv) %>% 
  filter(village == "God", no_membrs > 6) 

#Piping Exercise
interviews %>%
  filter(memb_assoc == "yes") %>%
  select(affect_conflicts, liv_count, no_meals)
