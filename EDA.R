### Load data
wa_data <- read.csv('ss16pwa.csv')

### Subset and focus on the data of interest
# SERIALNO: Housing unit/GQ person serial number  # SPORDER: Person number
# WAGP: Wages or salary income past 12 months     # SCHL: Educational attainment
# RAC1P/RAC3P: Recoded detailed race code
research_data <- wa_data[c('SERIALNO','SPORDER','WAGP','SCHL','RAC1P','RAC3P')]
View(research_data)
nrow(research_data)

### EDA
# descriptive statistics
summary(research_data)

# exclude all missing values
new <- na.exclude(research_data) 
summary(new)
nrow(new)

# dataset is too large to draw a histogram for the whole dataset.
# so we draw the histogram of several subsets:
# when RAC1P == 1, means "white":
hist(new[new$RAC1P == 1, ]$SCHL, main = "Education attainment of Race 1")
hist(new[new$RAC1P == 1, ]$WAGP, main = "Income of Race 1")
# when RAC1P == 2, means "Black or African American alone":
hist(new[new$RAC1P == 2, ]$SCHL, main = "Education atainment of Race 2")
hist(new[new$RAC1P == 2, ]$WAGP, main = "Income of Race 2")

# number of instances of each race:
num_race <- c()
for (i in 1:9){
  num <- nrow(new[new$RAC1P == i, ])
  num_race <- c(num_race,num)
}
df_num <- data.frame(1:9, num_race)
names(df_num) <- c('Race', 'Number')
df_num
# so we hope to draw a sample from the population with the same percentage of the 9 races.
