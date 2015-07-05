orig_charities_data <- read.csv(file="/Users/Audrey/Documents/20150617_DataDotGov_AIS13-2.csv", head=TRUE,sep =",") 
my_charities_data <- data.frame(orig_charities_data)
NSWdata <- subset(my_charities_data, State=="NSW")
                  
I_Popdata <- read.csv(file="/Users/Audrey/Documents/Indig_Pop_SA2.csv", head=TRUE,sep =",") 
my_I_Popdata <- data.frame(I_Popdata)
I_Popdata_SA2<- subset(my_I_Popdata, Suburb!="")

Homeless_data <- read.csv(file="/Users/Audrey/Documents/Homelessness_SA2.csv", head=TRUE,sep =",") 
my_Homeless_data <- data.frame(Homeless_data)
Homeless_data_SA2<- subset(my_Homeless_data, Suburb!="")
write.csv(Homeless_data_SA2,file="/Users/Audrey/Documents/My_Homeless_data.csv")

Pop_data <- read.csv(file="/Users/Audrey/Documents/ABS_Orig_pop_data.csv", head=TRUE,sep =",") 
my_Pop_data <- data.frame(Pop_data)
Pop_data_SA2<- subset(my_Pop_data, Region.Type=="Statistical Area Level 2" & Sex=="Persons" & (Age=="65 to 69"| Age=="70 to 74"| Age=="75 to 79"| Age=="80 to 84"| Age==""))
Pop_data_NSW_SA2 <- merge(Pop_data_SA2,Homeless_data_SA2, by="Suburb")
Pop_data_NSW_SA2_Agg <- aggregate(Pop_data_NSW_SA2$Value, list(Pop_data_NSW_SA2$Suburb), sum)

write.csv(Pop_data_NSW_SA2_Agg,file="/Users/Audrey/Documents/My_Pop_65_over.csv")
