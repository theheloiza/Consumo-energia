rm(list = ls())

# packages ----------------------------------------------------------------

library(data.table)
library(dplyr)
library(lubridate)

# dataset -----------------------------------------------------------------

energia <- fread(input = "household_power_consumption.txt", na.strings = "?")
glimpse(energia)

# selecionando observações sem na
energia <- energia[complete.cases(energia),]
sum(is.na(energia))

# data e hora
energia$datetime <- paste(energia$Date, energia$Time)
energia$datetime <- as.POSIXct(x = energia$datetime, format = "%d/%m/%Y %H:%M:%S")
attr(energia$datetime, "tzone") <- "Europe/Paris"
energia$day <- day(energia$datetime)