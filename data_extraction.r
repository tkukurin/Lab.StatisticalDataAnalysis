
read_normalize <- function(data_location) {
  xs <- read.csv(data_location)
  
  lct <- Sys.getlocale("LC_TIME")
  Sys.setlocale("LC_TIME", "C")
  DATE_FORMAT <- "%d-%B-%Y"
  
  xs$Date <- as.Date(xs$Date, DATE_FORMAT)
  Sys.setlocale("LC_TIME", lct)
  
  return(xs)
}

time_series_diff <- function(series, fn) {
  n_items <- length(series)
  
  series_t <- series[2:n_items]
  series_t_minus_one <- series[1:(n_items - 1)]
  
  return( fn(series_t, series_t_minus_one) )
}

to_log_returns_df <- function(xs, columns_to_log_normalize) {
  diff_function <- function(St, St_minus_one) log(St / St_minus_one)
  
  xs.log_returns <- lapply( xs[columns_to_log_normalize], function(list) time_series_diff(list, diff_function) )
  xs.log_returns <- data.frame( c(xs[2:nrow(xs), -columns_to_log_normalize], xs.log_returns) )
  
  return(xs.log_returns)
}
