### Applying KNN 

When applying KNN to our dataset, we ran a 10-fold cross validation with the algorithm to predict if a candidate would advance in the primary. By using the grid search, we were able to determine the best parameters for our model which the n_neighbors was 24 and the weights were uniform. After using the pipeline to apply KNN to our dataset, we were able accurately to predict **73.3%** of the primary outcome, with an accuracy score of 0.733. With recursive feature elimination, we determined 10 features to predict the primary outcome: 

- `Yes_Endorsements`
- `No_Endorsements`
- `Office_Type_Governor`
- `STEM_Yes`
- `STEM_No`
- `LGBTQ_Yes`
- `Party_Support_No`
- `Party_Support_Yes`
- `Self_Funder_Yes`
- `Elected_Official_Yes' `

