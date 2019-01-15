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

target column:
1. AL: MAR(Marital status)
2. BS: WAGP (Wages or salary income past 12 months)
3. ??BR: SSP(what is social security income?)
4. BN: SCHL (Educational attainment)
5. Race:RAC1P, RAC2P, RAC3P. Which one to use?
