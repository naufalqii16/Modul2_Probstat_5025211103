# *********SOAL 1*********
# *****A*****
before <- c(78, 75, 67, 77, 70, 72, 78, 74, 77)
after <- c(100, 95, 70, 90, 90, 90, 89, 90, 100)

difference <- after - before
difference
mean(difference)
sd(difference)

# *****B*****
t.test(after, before, paired = TRUE)



# *********SOAL 2*********

install.packages("BSDA")
library(BSDA)


tsum.test(mean.x = 23500, s.x = 3900, n.x = 100)


# *********SOAL 3*********
# *****B*****
tsum.test(mean.x=3.64, s.x = 1.67, n.x = 19, 
          mean.y =2.79 , s.y = 1.32, n.y = 27, 
          alternative = "greater", var.equal = TRUE)




qt(0.025,df = 2,lower.tail=FALSE)
qt(0.025,df = 2,lower.tail=TRUE)


# *********SOAL 4*********
# *****A*****
mydata <- read.table("Data_soal_4.txt", h = T)
attach(mydata)
names(mydata)

mydata$Group <- as.factor(mydata$Group)
mydata$Group = factor(mydata$Group, labels = c("Kucing Orange", "Kucing Hitam", "Kucing Putih"))

class(mydata$Group)



Group1 <- subset(mydata, Group == "Kucing Orange")
Group2 <- subset(mydata, Group == "Kucing Hitam")
Group3 <- subset(mydata, Group == "Kucing Putih")

# perkecil figure margin untuk menghindari error di kasus ini
par(mar = c(1, 1, 1, 1))

qqnorm(Group1$Length)
qqline(Group1$Length)


qqnorm(Group2$Length)
qqline(Group2$Length)


qqnorm(Group3$Length)
qqline(Group3$Length)

# *****B*****

bartlett.test(Length ~ Group, data = mydata)

# *****C*****
model1 = lm(Length ~ Group, data = mydata)
anova(model1)

# *****E*****

TukeyHSD(aov(model1))


# *****F*****

install.packages("ggplot2")
library("ggplot2")

ggplot(mydata, aes(x = Group, y = Length)) + geom_boxplot(fill = "yellow", colour = "black") + scale_x_discrete() + xlab("Jenis Kucing") + ylab("Panjang Kucing (cm)")




