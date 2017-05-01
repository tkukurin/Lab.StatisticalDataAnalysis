
source_eval <- function(file) source(file, print.eval = TRUE)

# filepaths, etc.
# globals not common between users
source_eval('uncommon.r')
setwd(WORK_DIR)

source('data_extraction.r')
xs <- read_normalize(CSV_DATA)
xs.log_returns <- to_log_returns_df(xs, 3:length(xs))

source_eval('plotting.r')
