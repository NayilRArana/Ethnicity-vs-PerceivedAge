install.packages("ggplot2")
library("ggplot2")
theme_update(plot.title = element_text(hjust = 0.5))
guesses = read.csv("2019_project_data.csv", head=T)
head(guesses)
summary(guesses[,-c(1,4)])
hist(guesses$error, xlab = "Error", ylab = "Frequency", main = "Histogram of Errors")
hist(guesses$abs_error, xlab = "Absolute Error", ylab = "Frequency", main = "Histogram of Absolute Errors")
round(tapply(X=guesses$error, INDEX=guesses$tru_age, FUN = mean), 3)
round(tapply(X=guesses$error, INDEX=guesses$tru_age, FUN = var), 3)
round(tapply(X=guesses$error, INDEX = guesses$sex, FUN = mean), 3)
tapply(X = guesses$error, INDEX = guesses$race, FUN = mean)
tapply(X = guesses$error, INDEX = guesses$race, FUN = var)
boxplot(error ~ tru_age, data = guesses, main = "Boxplot of Error by True Age", xlab = "True Age", ylab = "Error")
boxplot(error ~ sex, data = guesses, main = "Boxplot of Error by Sex", xlab = "Sex", ylab = "Error")
boxplot(error ~ race, data = guesses, main = "Boxplot of Error by Race", xlab = "Race", ylab = "Error")

#ggplot2 versions
qplot(guesses$error,
      geom="histogram",
      binwidth = 5,  
      main = "Histogram of Errors", 
      xlab = "Error", 
      ylab = "Frequency",
      fill=I("blue"), 
      col=I("red"), 
      alpha=I(.2),
      xlim=c(-30,20))

qplot(guesses$error,
      geom="histogram",
      binwidth = 2,  
      main = "Histogram of Absolute Errors", 
      xlab = "Absolute Error", 
      ylab = "Frequency",
      fill=I("blue"), 
      col=I("red"), 
      alpha=I(.2),
      xlim=c(0, 20))

ggplot(guesses, aes(x=factor(tru_age), y=error, group=tru_age)) + 
  geom_boxplot() +
  scale_x_discrete("True Age", labels = guesses$tru_age, breaks = guesses$tru_age) +
  ylab("Error") +
  ggtitle("Boxplot of Error by True Age")

ggplot(guesses, aes(x=factor(sex), y=error, group=sex)) + 
  geom_boxplot() +
  scale_x_discrete("Sex", labels = guesses$sex, breaks = guesses$sex) +
  ylab("Error") +
  ggtitle("Boxplot of Error by Sex")

ggplot(guesses, aes(x=factor(race), y=error, group=race)) + 
  geom_boxplot() +
  scale_x_discrete("Race", labels = guesses$race, breaks = guesses$race) +
  ylab("Error") +
  ggtitle("Boxplot of Error by Race")