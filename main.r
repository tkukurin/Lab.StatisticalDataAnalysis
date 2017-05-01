
source_eval <- function(file) source(file, print.eval = TRUE)

# filepaths, etc.
# globals not common between users
source_eval('uncommon.r')
setwd(WORK_DIR)

investment_funds <- c("ERSTEAdriaticEquity", "OTPMeridian20", "ZBAktiv")
pension_funds <- c("RaiffeisenDMF", "ERSTEPlaviEXPERT", "ERSTEPlaviPROTECT")

source('data_extraction.r')
xs <- read_normalize(CSV_DATA)
xs.log_returns <- to_log_returns_df(xs, 3:length(xs))

xs.market_portfolio <- to_data_frame(xs, "CROBEX", xs.market_portfolio)

xs.investment <- to_data_frame(xs, investment_funds, xs.investment)

xs.pension <- to_data_frame(xs, pension_funds, xs.pension)

source('plotting.r')
plot_timeseries(xs, xs$Date, xs$CROBEX)
