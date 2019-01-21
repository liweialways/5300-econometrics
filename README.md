# 5300-econometrics
LMA_project

For this project, we will use individual-level data from the 2016 American Community Survey (ACS).  

Research questions:
1. In the state of Washington, how do earnings vary by educational attainment?  ##earnings = wage*hours worked
2. Does the premium for higher education vary by race and ethnicity?


The Census Bureau provides each state’s data file in comma separated value (CSV) format.
We choose Washington State's data to analyze,
data source: https://www2.census.gov/programs-surveys/acs/data/pums/2016/1-Year/csv_pwa.zip

We will be using the population records (elsewhere called person records) rather than the housing records.  

The data dictionary provides variable names and codes; 
it's in this repository; the codes for the person records begin on page 35.

target columns:
1. AL: MAR(Marital status)
2. BS: WAGP (Wages or salary income past 12 months)
3. BN: SCHL (Educational attainment)
4. Race:RAC1P, RAC2P, RAC3P. Which one to use?

sample critieria:
1. according to the ratio of the races in the population, we randomly choose sample and keep the same ratio.

2. exclude the people who is in the following status: b, 3, 6 in the column: ESR 1 ---Employment status recode:
  b .N/A (less than 16 years old)        1 .Civilian employed, at work
  2 .Civilian employed, with a job but not at work       3 .Unemployed
  4 .Armed forces, at work      5 .Armed forces, with a job but not at work
  6 .Not in labor force
  
  
