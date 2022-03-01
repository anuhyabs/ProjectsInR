set.seed(2)
n = 40
p = 0.5
flips = sample(c(0,1),size = n,replace = TRUE)
hist(flips)

means = rep(NA,1000)
for (i in 1:1000) {
  means[i] = mean(rbinom(n,size=1,prob = p))
}
hist(means)
sd_coin = sd(means)
sd_coin
mean_val = mean(means)
mean_val

alpha = 0.05
p = 15/40
p
(p-mean_val)/sd_coin

sum(dbinom(c(0:15,25:40),size = 40,p=0.5))

n = 40
p = 0.5
h = 15
z_val = (h - (n*p)) / sqrt(n*p*(1-p))
z_val
h - (n*p)
sqrt(n*p*(1-p))

pnorm(-1.58)+1-pnorm(1.58)

p_cap = 0.375
se_cap = sqrt(p_cap * (1- p_cap) / n)
se_cap
low = p_cap - 1.96 * se_cap
high = p_cap + 1.96 * se_cap 
low
high
low_90 = p_cap - 1.645 * se_cap
high_90 = p_cap + 1.645 * se_cap 
low_90
high_90

sum(dbinom(c(0:262,298:400),size=400,p=0.8))
sum(dbinom(c(0:255,305:400),size=400,p=0.7))

data = read.csv("iq.csv")
data
hist(data$IQ)
normal.fit <- fitdist(data$IQ,"norm")
mean(data$IQ)
sd(data$IQ)
mean(data$IQ)/(sd(data$IQ)/sqrt(124))

set.seed(123456)
n = 124
reps = 2000
z = rep(NA,reps)
for(i in 1:reps){
  x = rnorm(n,mean=mean(data$IQ),sd = sd(data$IQ))
  z[i]=mean(x)/(sd(x)/sqrt(n))
}
summary(z)
critical.value = qt(0.95,df = n-1)
mean(abs(z)>critical.value)