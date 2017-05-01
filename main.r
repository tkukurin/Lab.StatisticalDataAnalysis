
source_eval <- function(file) source(file, print.eval = TRUE)

# filepaths, etc.
# globals not common between users
source_eval('uncommon.r')
setwd(WORK_DIR)

investment_funds <- c("CROBEX", "ERSTEAdriaticEquity", "OTPMeridian20", "ZBAktiv")
pension_funds <- c("RaiffeisenDMF", "ERSTEPlaviEXPERT", "ERSTEPlaviPROTECT")

source('data_extraction.r')
xs <- read_normalize(CSV_DATA)
xs.log_returns <- to_log_returns_df(xs, 3:length(xs))

xs.investment <- data.frame(xs$Date, 
                            xs$InterestRate, 
                            xs$CROBEX, 
                            xs$ERSTEAdriaticEquity,
                            xs$OTPMeridian20,
                            xs$ZBAktiv)
xs.pension <- data.frame(xs$Date,
                         xs$InterestRate,
                         xs$RaiffeisenDMF,
                         xs$ERSTEPlaviEXPERT,
                         xs$ERSTEPlaviPROTECT)

source('plotting.r')
plot_timeseries(xs, xs$Date, xs$CROBEX)


