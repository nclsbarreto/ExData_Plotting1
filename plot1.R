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


# plot1 - histogram
?png()

png("plot1.png", height = 480, width = 480)

hist(df.sub$Global_active_power, ylim = c(0,1200), col = "red", 
     xlab = "Global Active Power (Kilowatts)", main = "Global Active Power")

dev.off()
