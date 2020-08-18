## The "#" is a comment and ignored by R
## Example code

movies %>%
  summarise(mean_rating = mean(rating), 
            med_rating = median(rating))

## Now your turn - calculate:
### the mean movie length
### the median movie length 
## Alter this code
movies %>%
  summarise(mean_rating = mean(rating), 
            med_rating = median(rating))
