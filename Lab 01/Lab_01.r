#reading data
cats <- read.csv("Lab 01\\data\\feline_data_v2.csv")

#"Challenge" 1
print(cats)
str(cats)
cats$weight <- as.numeric(cats$weight)
cats$weight[4] <- 2.35
mean(cats$weight)

#"Challenge" 2
x <- 1:26
x*2
