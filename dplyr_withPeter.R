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
  select(affect_conflicts, liv_count, no_meals) #need to do the filtering first then select

#Afternoon session
interviews %>%
  mutate(people_per_room = no_membrs / rooms)

interviews_ppl_room <- interviews %>%
  filter(memb_assoc == "yes") %>%
         mutate(people_per_room = no_membrs / rooms)

view(interviews_ppl_room)

#Exercise
total_meals <- interviews %>%
  mutate(total_meals = no_membrs * no_meals) %>%
  select(village, total_meals) %>%
  filter(total_meals > 20)

#split, apply, combine
interviews %>%
  group_by(village) %>%
  summarize(mean_no_membrs = mean(no_membrs))   #summarise produces a single number eg. mean rather than a new variable

interviews %>%
  filter(!is.na(memb_assoc)) %>%
  group_by(village, memb_assoc) %>%
  summarise(mean_no_membrs = mean(no_membrs),
          min_membrs = min(no_membrs)) %>%
  arrange(desc(min_membrs)) #desc = descending, so reverses order

#count function
interviews %>% count(village, sort=TRUE) #ie. counts the number of responses, sorts largest to smallest

#Exercise
interviews %>%
  group_by(village) %>%
  summarize(mean_no_membrs = mean(no_membrs), 
            min_membrs = min(no_membrs), 
            max_membrs = max(no_membrs), 
            n = n())

#Table - for each 'observational unit', which varies...
##Spread function
#add a dummy column to the dataset, need to give column names as well as values
interviews_spread <- interviews %>%
  mutate(wall_type_logical = TRUE) %>%
  spread(key=respondent_wall_type, value = wall_type_logical, fill = FALSE) 

view(interviews_spread)

#go back the other way
interviews_gather <- interviews_spread %>%
  gather(key = respondent_wall_type, value = "wall_type_logical", burntbricks:sunbricks) %>%
  filter(wall_type_logical) %>%
  select(-wall_type_logical)
 view(interviews_gather)

 