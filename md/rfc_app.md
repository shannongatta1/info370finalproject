### Applying Random Forest

We used the same 10 features with the KNN model to more directly compare the accuracy scores of the machine learning models specifically. As a reminder, those were: 
- `Yes_Endorsements`
- `No_Endorsements`
- `Office_Type_Governor`
- `STEM_Yes`
- `STEM_No`
- `LGBTQ_Yes`
- `Party_Support_No`
- `Party_Support_Yes`
- `Self_Funder_Yes`
- `Elected_Official_Yes` 

Before doing any cross validation or grid research, we were able to accurately predict 73% of the outcome. Then we ran a 10-fold cross validation and the mean score of 74%. By using grid search, we found the best parameters of the RFC which the criterion was gini, max depth was 5, max features were auto and the number of estimators was 500. After applying the trained model to our dataset, we obtained an accuracy score of 0.758 to predict **75.8%** of the outcome.