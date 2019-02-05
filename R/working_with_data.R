
# README ------------------------------------------------------------------

# Height data and code for introducing working with data in R. 


# import data -------------------------------------------------------------

heightData <- read.csv('~/localRepos/rdm-lecture-R/data/heights.csv')

heightData <- read.csv('~/localRepos/rdm-lecture-R/data/heights.csv',
                       stringsAsFactors = F)


# inspect data ------------------------------------------------------------

class(heightData)

str(heightData)

# histogram
hist(heightData$height)

# nicer histogram
hist(heightData$height,
     main = 'histogram of heights',
     xlab = 'inches')

# just males 
hist(heightData[heightData$sex == 'Male',]$height,
     main = 'histogram of male heights',
     xlab = 'inches')

# just females
hist(heightData[heightData$sex == 'Female',]$height,
     main = 'histogram of female heights',
     xlab = 'inches')

# side-by-side
par(mfrow = c(1,2))
hist(heightData[heightData$sex == 'Male',]$height,
     main = 'male',
     xlab = 'inches')

hist(heightData[heightData$sex == 'Female',]$height,
     main = 'female',
     xlab = 'inches')
dev.off()

# add a normal curve
heightHist <- hist(heightData$height,
                   main = 'histogram of heights',
                   xlab = 'inches')
xfit <- seq(min(heightData$height),
            max(heightData$height),
            length = 50)
yfit <- dnorm(xfit,
              mean = mean(heightData$height),
              sd = sd(heightData$height))
yfit <- yfit * diff(heightHist$mids[1:2]) * length(heightData$height)
lines(xfit, yfit, col = "black", lwd = 2)

# test for normality
shapiro.test(heightData$height)

# box plot
boxplot(height~sex,
        data = heightData)


# significance testing ----------------------------------------------------

# are the height of men and women different?
t.test(heightData[heightData$sex == 'Male',]$height, heightData[heightData$sex == 'Female',]$height)

# with ANOVA
heightsAnova <- aov(height ~ sex, data = heightData)
summary(heightsAnova)

str(heightsAnova)

heightsAnova$coefficients # examine the coefficients
heightsAnova$coefficients["sexMale"] # extract slope
alpha <- heightsAnova$coefficients["sexMale"] # our model coeff


# just males, log-transformed ---------------------------------------------

hist(log(heightData[heightData$sex == 'Male',]$height,
         10),
     main = 'histogram of male heights',
     xlab = 'inches')

# test for normality
shapiro.test(log(heightData[heightData$sex == 'Male',]$height, 10))


# packages ----------------------------------------------------------------

# install.packages('readxl') if not already installed
library(readxl)

fromExcel <- read_excel('~/localRepos/rdm-lecture-R/data/heights_excel.xlsx')

str(fromExcel)
