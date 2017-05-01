library(ggplot2)

plot_timeseries <- function(xs, x_col, y_col) {
  return(ggplot(xs, aes(x_col, y_col)) + 
           geom_line() +
           scale_x_date() + 
           xlab("Date") + 
           ylab("Price") +
           geom_smooth(method='lm')) 
}


