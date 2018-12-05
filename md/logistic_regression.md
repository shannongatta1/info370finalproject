## Logistic Regression

**Logistic regression** is a statistical model commonly used to predict binary outcomes, like yes or no. In our case, it’s whether or not a candidate won or lost in the primary elections. While a method like linear regression tries to fit a straight line to the data, logistic regression uses the _natural logarithm_ function to find the fit and coefficients instead. 

Essentially, it tries to find a straight boundary to divide the data for each result. Once it finds this, it plugs in our data to figure out how close to the boundary each input is. That distance is mapped to a probability, and after some math, we can determine if a point should be classified as 'won' or 'lost', in the case of our data. 


### Applying Logistic Regression
Our particular implementation of logistic regression used **stratified k-fold cross validation**, systematically finding the best value for k, which ended up being 4. We used backward feature selection to pick which factors would give us the best outcome. With this model, we were able to obtain an accuracy score of 0.742, meaning that **74.2%** of the model’s predictions matched the actual primary outcome. Of the  possible features, the covariates of interest for this model were:

- `Neutral_Endorsements`
- `Yes_Endorsements`
- `No_Endorsements`
- `Race_Unknown`
- `Veteran_No`
- `Veteran_Unknown`
- `Veteran_Yes`
- `LGBTQ_Unknown`
- `STEM_Unknown`
- `Party_Support_Yes`
