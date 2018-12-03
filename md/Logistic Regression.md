## Logistic Regression

Linear regression is often a good first step to take when finding the relationship between variables, but it has its limits. **Logistic regression** is another statistical model commonly used to predict binary outcomes, like yes or no. In our case, it’s whether or not a candidate won or lost in the primary elections. While linear regression tries to fit a straight line to the data, logistic regression uses the _natural logarithm_ function to find the fit and coefficients instead. Our particular implementation of logistic regression used **stratified k-fold cross validation**, systematically finding the best value for k. 

With this model, we were able to obtain an accuracy score of **0.742**, meaning that 74.2% of the model’s predictions matched the actual primary outcome. Of the ___ possible features, the covariates of interest for this model were:

- Neutral_Endorsements
- Yes_Endorsements
- No_Endorsements
- Race_Unknown
- Veteran_No
- Veteran_Unknown
- Veteran_Yes
- LGBTQ_Unknown
- STEM_Unknown
- Party_Support_Yes

