# Load data
wa_data <- read.csv('ss16pwa.csv')
View(wa_data)

research_data <- wa_data[c('SERIALNO','SPORDER','WAGP','SCHL','RAC1P','RAC3P')]
View(research_data)
