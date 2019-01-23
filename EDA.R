### Load data
wa_data <- read.csv('ss16pwa.csv')

### Subset and focus on the data of interest
# SERIALNO: Housing unit/GQ person serial number  # SPORDER: Person number
# PERNP: Total person's earnings                  # SCHL: Educational attainment
# RAC1P: Recoded detailed race code               # ESR: Employment status
research_data <- wa_data[c('SERIALNO','SPORDER','PERNP','SCHL','RAC1P','ESR')]
View(research_data)
nrow(research_data)
## change the data type:
research_data$RAC1P <- as.factor(research_data$RAC1P)
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
nrow(new)