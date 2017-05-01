
source_eval <- function(file) source(file, print.eval = TRUE)

# filepaths, etc.
# globals not common between users
source_eval('uncommon.r')
setwd(WORK_DIR)

source('data_extraction.r')

xs <- read_normalize(CSV_DATA)

diff_function_log <- function(St, St_minus_one) log(St) - log(St_minus_one)
xs.log_returns <- to_time_series_diff_df(xs, get_data_cols(xs), diff_function_log)

xs.summary <- summary(xs)
xs.log_returns.summary <- summary(xs.log_returns)

diff_function_sub <- function(St, St_minus_one) St - St_minus_one
xs.returns <- to_time_series_diff_df(xs, get_data_cols(xs), diff_function_sub)
xs.returns.summary <- summary(xs.returns)

investment_funds <- c("ERSTEAdriaticEquity", "OTPMeridian20", "ZBAktiv")
pension_funds <- c("RaiffeisenDMF", "ERSTEPlaviEXPERT", "ERSTEPlaviPROTECT")
market_portfolio <- c("CROBEX")

xs.market_portfolio <- to_data_frame(xs, market_portfolio, xs.market_portfolio)
xs.investment <- to_data_frame(xs, investment_funds, xs.investment)
xs.pension <- to_data_frame(xs, pension_funds, xs.pension)



source('plotting.r')

xs.graphs.timeseries <- lapply( xs[get_data_cols(xs)], function(data_col) plot_timeseries(xs, xs$Date, data_col) )
xs.graphs.boxplots <- boxplot(xs[get_data_cols_without_market_portfolio(xs)])
xs.log_returns.graphs.boxplots <- boxplot(xs.log_returns[get_data_cols_without_market_portfolio(xs.log_returns)], ylim = c(-0.1, 0.1) )








