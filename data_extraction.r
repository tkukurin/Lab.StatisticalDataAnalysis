WORK_DIR <- '~/sem6/statisticka analiza podataka/project'
CSV_DATA <- './investicijski_fondovi_data.csv'
setwd(WORK_DIR)

xs <- read.csv(CSV_DATA)
xs_test <- head(xs)

time_series_diff <- function(series, fn) {
  n_items <- length(series)
  
  series_t <- series[2:n_items]
  series_t_minus_one <- series[1:(n_items - 1)]
  
  return( fn(series_t, series_t_minus_one) )
}

diff_function <- function(St, St_minus_one) log(St / St_minus_one)

xs.delta.crobex <- time_series_diff(xs$CROBEX, diff_function)
