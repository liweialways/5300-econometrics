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
# exclude all missing values(because we have a large dataset)
summary(research_data)
research_data
new <- na.exclude(research_data) # exclude all missing values
summary(new)
nrow(new)

# Distribution of the variables of interest
dist(new$WAGP)
