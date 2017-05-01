library(ggplot2)

ggplot(xs, aes(Date, CROBEX)) + 
  geom_line() +
  scale_x_date() + 
  xlab("Date") + 
  ylab("Price")
