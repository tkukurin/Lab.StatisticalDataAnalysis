
source_eval <- function(file) source(file, print.eval = TRUE)

# filepaths, etc.
# globals not common between users
source_eval('uncommon.r')
setwd(WORK_DIR)

investment_funds <- c("ERSTEAdriaticEquity", "OTPMeridian20", "ZBAktiv")
pension_funds <- c("RaiffeisenDMF", "ERSTEPlaviEXPERT", "ERSTEPlaviPROTECT")

source('data_extraction.r')

xs <- read_normalize(CSV_DATA)
xs.log_returns <- to_log_returns_df(xs, get_data_cols(xs))
xs.summary <- summary(xs)

xs.market_portfolio <- to_data_frame(xs, "CROBEX", xs.market_portfolio)
xs.investment <- to_data_frame(xs, investment_funds, xs.investment)
xs.pension <- to_data_frame(xs, pension_funds, xs.pension)

source('plotting.r')

xs.graphs.timeseries <- lapply( xs[get_data_cols(xs)], function(data_col) plot_timeseries(xs, xs$Date, data_col) )
xs.graphs.boxplots <- boxplot(xs[get_data_cols_without_market_portfolio(xs)])
xs.log_returns.graphs.boxplots <- boxplot(xs.log_returns[get_data_cols_without_market_portfolio(xs.log_returns)], ylim = c(-0.1, 0.1) )
