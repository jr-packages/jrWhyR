## Standard ggplot2 graph
ggplot(starbucks, aes(Calories, Fat)) + 
  geom_point()

# Try 
# changing `geom_point()` to `geom_point(aes(colour = Protein))`
# adding `+ stat_smooth()`
# or `+ stat_smooth(method = "lm")`
# wrapping everything in `ggplotly(.....)`
