library(tidyverse)

getwd()
list.files()

# read in file
df <- read.table(file = "./household_power_consumption.txt", header = TRUE, sep = ";", 
                 na.strings = "?")

# look at data 
head(df)
names(df)
str(df)
head(df[c(1,10)], 30)

# convert date to date format
df$Date.2 <- as.Date(df$Date, "%d/%m/%Y")
str(df)

# subset dates 2007-02-01 and 2007-02-02 -- i used the pipe for practice 
df.sub <- df %>% subset(Date.2 == "2007-02-01" | Date.2 == "2007-02-02")

str(df.sub)

# make datetime variable
df.sub$datetime <- as.POSIXct(paste0(df.sub$Date, " ", df.sub$Time), 
                              format = "%d/%m/%Y %H:%M:%OS")
str(df.sub)

# plot3 
png("plot3.png", height = 480, width = 480)

plot(x = df.sub$datetime, y = df.sub$Sub_metering_1,
     ylab = "Energy Sub Metering", xlab = "",
     type = "l")
lines(x = df.sub$datetime, y = df.sub$Sub_metering_2, col = "red")
lines(x = df.sub$datetime, y = df.sub$Sub_metering_3, col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col = c("black", "red", "blue"), lty = c(1,1), lwd = c(1,1))

dev.off() 
