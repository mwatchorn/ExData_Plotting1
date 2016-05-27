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

par(mfrow = c(2, 2))

plot (	pwr_consume_eval$Global_active_power
	, type = "l"
	, col = "black"
	, xlab = ""
	, ylab = "Global Active Power"
	, xaxt = "n"
	)
axis (1, at = seq (1, 2881, by = 1440), labels = c("Thu", "Fri", "Sat"))

plot (	pwr_consume_eval$Voltage
	, type = "l"
	, col = "black"
	, xlab = "datetime"
	, ylab = "Voltage"
	, xaxt = "n"
	)
axis (1, at = seq (1, 2881, by = 1440), labels = c("Thu", "Fri", "Sat"))

plot (	pwr_consume_eval$Sub_metering_1
	, type = "l"
	, col = "black"
	, xlab = ""
	, ylab = "Energy sub metering"
	, xaxt = "n"
	)
axis (1, at = seq (1, 2881, by = 1440), labels = c("Thu", "Fri", "Sat"))

lines (pwr_consume_eval$Sub_metering_2, type = "l", col = "red")
lines (pwr_consume_eval$Sub_metering_3, type = "l", col = "blue")

legend ('topright'
	, c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
	, lty = 1
	, col = c('black', 'red')
	, cex = 0.55
	)

plot (	pwr_consume_eval$Global_reactive_power
	, type = "l"
	, col = "black"
	, xlab = "datetime"
	, ylab = "Global_reactive_power"
	, xaxt = "n"
	, yaxt = "n"
	)
axis (1, at = seq (1, 2881, by = 1440), labels = c("Thu", "Fri", "Sat"))
axis (2, at = seq (0.0, 0.5, by = 0.1), cex.axis = 0.75)
   
dev.copy (png, file = "plot4.png", width = 480, height = 480)
dev.off ()