#How to download a file from Internet
 #download.file("https://raw.githubusercontent.com/swcarpentry/r-novice-gapminder/main/episodes/data/gapminder_data.csv",
 #destfile = "data/gapminder_data.csv")
 #Extra marks in workflow if you do this

#Reading in Data
    gapminder <- read.csv("Lab 02\\data\\gapminder_data.csv")

#Checking parts of Data
    head(gapminder) # start
    tail(gapminder) # end
    gapminder[sample(nrow(gapminder), 5), ] # sample random rows

#How to load a script into a file
 #source(file = "scripts/load-gapminder.R")
 #opens up a file and runs everything inside

#Subsetting in Lists
    xlist <- list(a = "Software Carpentry", b = 1:10, data = head(mtcars))
    xlist[[2]][2] #2nd list, 2nd value
    xlist[["b"]][2]
    xlist$b[2]

#Challenge 6
    mod <- aov(pop ~ lifeExp, data = gapminder)
    attributes(mod)
    mod_res <- mod$df.residual

#Challenge 7 - cba to fix
    gapminder[gapminder$year == 1957,]

#Challenge 8
    gapminder_small <- gapminder[c(1:9, 19:23),]
