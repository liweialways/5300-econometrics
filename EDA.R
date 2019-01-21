### Load data
wa_data <- read.csv('ss16pwa.csv')

### Subset and focus on the data of interest
# SERIALNO: Housing unit/GQ person serial number  # SPORDER: Person number
# WAGP: Wages or salary income past 12 months     # SCHL: Educational attainment
# RAC1P/RAC3P: Recoded detailed race code         # ESR: Employment status
research_data <- wa_data[c('SERIALNO','SPORDER','WAGP','SCHL','RAC1P','RAC3P', 'ESR')]
View(research_data)
nrow(research_data)
## change the data type:
research_data$RAC1P <- as.factor(research_data$RAC1P)
research_data$RAC3P <- as.factor(research_data$RAC3P)
research_data$ESR <- as.factor(research_data$ESR)

### EDA
## descriptive statistics
summary(research_data)
str(research_data)
## exclude all missing values
new <- na.exclude(research_data) 
## exclude those who cannot work due to age under 16 years old or not in labor force.
new <- new[new['ESR'] != 6, ]

## group educational attainment levels into 5 levels: 
# A: no high school degree; B: with high school degree; 
# C: with colleage degree; D: with professional degree;
# E: with master degree; F: with Doctor degree
for (rows in 1:nrow(new)) {
  if (new[rows, 'SCHL'] <= 15) {
    new[rows, 'EducLevel'] = 'A'
  }
  if (new[rows, 'SCHL'] >= 16 & new[rows, 'SCHL'] <= 19) {
    new[rows, 'EducLevel'] =  'B'
  }
  if (new[rows, 'SCHL'] >= 20 & new[rows, 'SCHL'] <= 21) {
    new[rows, 'EducLevel'] = 'C'
  }
  if (new[rows, 'SCHL'] == 23) {
    new[rows, 'EducLevel'] = 'D'
  }
  if (new[rows, 'SCHL'] == 22) {
    new[rows, 'EducLevel'] = 'E'
  }
  if (new[rows, 'SCHL'] == 24) {
    new[rows, 'EducLevel'] = 'F'
  }
}
View(new)

# dataset is too large to draw a histogram for the whole dataset.
# so we draw the histogram of several subsets:
# when RAC1P == 1, means "white":
hist(new[new$RAC1P == 1, ]$SCHL, main = "Education attainment of Race 1")
hist(new[new$RAC1P == 1, ]$WAGP, main = "Income of Race 1")
# when RAC1P == 2, means "Black or African American alone":
hist(new[new$RAC1P == 2, ]$SCHL, main = "Education atainment of Race 2")
hist(new[new$RAC1P == 2, ]$WAGP, main = "Income of Race 2")
# when RAC1P == 3, means "American Indian alone":
hist(new[new$RAC1P == 3, ]$SCHL, main = "Education atainment of Race 3")
hist(new[new$RAC1P == 3, ]$WAGP, main = "Income of Race 3")
# when RAC1P == 6, means "Asian alone":
hist(new[new$RAC1P == 6, ]$SCHL, main = "Education atainment of Race 6")
hist(new[new$RAC1P == 6, ]$WAGP, main = "Income of Race 6")


### select a sample from population
# number of instances of each race:
num_race <- c()
for (i in 1:9){
  num <- nrow(new[new$RAC1P == i, ])
  num_race <- c(num_race,num)
}
df_num <- data.frame(1:9, num_race)
names(df_num) <- c('Race', 'Number')
# we hope to draw a sample from the population with the same percentage of the 9 races.
df_num['ratio'] <- df_num['Number'] / sum(df_num['Number'])
df_num['SampleNum'] <- round(sum(df_num['Number']) * df_num['ratio'] * 0.1, 0)
df_num
set.seed(1000)
race1 <- new[sample(nrow(new[new['RAC1P'] == 1, ]), size = df_num[1, 'SampleNum']), ]
race2 <- new[sample(nrow(new[new['RAC1P'] == 2, ]), size = df_num[2, 'SampleNum']), ]
race3 <- new[sample(nrow(new[new['RAC1P'] == 3, ]), size = df_num[3, 'SampleNum']), ]
race4 <- new[sample(nrow(new[new['RAC1P'] == 4, ]), size = df_num[4, 'SampleNum']), ]
race5 <- new[sample(nrow(new[new['RAC1P'] == 5, ]), size = df_num[5, 'SampleNum']), ]
race6 <- new[sample(nrow(new[new['RAC1P'] == 6, ]), size = df_num[6, 'SampleNum']), ]
race7 <- new[sample(nrow(new[new['RAC1P'] == 7, ]), size = df_num[7, 'SampleNum']), ]
race8 <- new[sample(nrow(new[new['RAC1P'] == 8, ]), size = df_num[8, 'SampleNum']), ]
race9 <- new[sample(nrow(new[new['RAC1P'] == 9, ]), size = df_num[9, 'SampleNum']), ]
# here is our sample:
set.seed(1000)
sample <- rbind(race1, race2, race3, race4, race5, race6, race7, race8, race9)
sample
