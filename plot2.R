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

plot (	pwr_consume_eval$Global_active_power
	, type = "l"
	, col = "black"
	, xlab = ""
	, ylab = "Global Active Power (kilowatts)"
	, xaxt = "n"
	)
axis (1, at = seq (1, 2881, by = 1440), labels = c("Thu", "Fri", "Sat"))

dev.copy (png, file = "plot2.png", width = 480, height = 480)
dev.off ()
