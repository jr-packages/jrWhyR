## Example code

movies %>%
  filter(length > 30 & length < 240) %>%
  group_by(Action, Comedy) %>%
  summarise(mean_rating = mean(rating), 
            median_rating = median(rating))

## Now your turn
## Change the code below group by __mpaa__ instead of Action & Comedy 
## i.e. group_by(mpaa)
movies %>%
  filter(length > 30 & length < 240) %>%
  group_by(Action, Comedy) %>%
  summarise(mean_rating = mean(rating), 
            median_rating = median(rating))
