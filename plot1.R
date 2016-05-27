setwd ("G://ed_proj1")
pwr_consume_agg <- read.table (
			    file = "household_power_consumption.txt"
			    , header = TRUE
			    , sep = ";"
			    , na.strings = "?"
			    , stringsAsFactors = FALSE
			    )
pwr_consume_agg$Date <- as.Date (pwr_consume_agg$Date, "%d/%m/%Y")
pwr_consume_eval <- subset (pwr_consume_agg
			, Date %in% 
			  c(as.Date("2007-02-01", "%Y-%m-%d"), as.Date("2007-02-02", "%Y-%m-%d"))
			)

hist (	pwr_consume_eval$Global_active_power
	, main = "Global Active Power"
	, xlab = "Global Active Power (kilowatts)"
	, col = "red"
	, yaxt = "n"
	)
axis (2, at = seq (0, 1200, by = 200), cex.axis = 0.8)

dev.copy (png, file = "plot1.png", width = 480, height = 480)
dev.off ()
