## Introduction to Dataset

To answer our research question, we analyzed a [dataset](https://github.com/fivethirtyeight/data/tree/master/primary-candidates-2018) from **FiveThirtyEight**, a website that looks at opinion poll analysis, politics, economics, and sports blogging. It contains 811 candidates who have appeared on the ballot this year in Democratic primaries for Senate, House, and Governor, and not counting races featuring a Democratic incumbent, as of August 7, 2018. The dataset includes a lot of variables about each Democratic candidate. We decided to remove seven columns of the original dataset, including `District`, `General_Status`, `Won_Primary`, `Race_Type`, `Partisan_Lean`,`Primary_Runoff_Status`, and `Race_Primary_Election_Date`, because they were either redundant or irrelevant. For example, `General_Status` and `Won_Primary` were the same as `Primary_Status` but had lots of missing data that `Primary_Status` did have. Also, `Race_Type` was the same for all candidates, `Partisan_Lean` was a variable calculated specific to FiveThirtyEight, and `Primary_Runoff_Status` was irrelevant to our outcome. A number of the columns were related to whether or not a candidate received an endorsement or anti-endorsement from a particular individual or group. Due to the encoding effort that would be associated with these categorical variables, we created three new columns called `Yes_Endorsements`, `No_Endorsements`, and `Neutral_Endorsements` that counted the number of each type of endorsement and removed the original categorical endorsement variables. After filtering out irrelevant data and filling in missing data, the remaining categorical variables were encoded for our statistical and machine learning models. 1 corresponds to “Yes”, and 0 corresponds to “No”. Below is a sample of our final dataset, which contains 811 rows and 28 columns.