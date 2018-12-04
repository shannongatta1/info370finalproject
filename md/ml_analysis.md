## Machine Learning

We attempted two different machine learning algorithms to predict our data - random forest and K Nearest Neighbors.

### TLDR; ML Algorithms
In short, random forest builds multiple trees and combines them to find the most accurate result. The trees are split into random subsets, and then the model looks for the best outcome out of those. This random subset is the only one taken into consideration, and the randomness helps increase the accuracy. Random forest can be used for both classification and regression tasks, and it is less prone to overfitting, which is helpful with the number of features we are considering in our model. It has the power to handle a large dataset with higher dimensionality, although our dataset is by no means the largest.

The K Nearest Neighbors algorithm is a simpler one. It employs lazy-learning and is non-parametric, meaning that there aren't any assumptions about the data distribution. It looks at the closest k entries to the sample and finds the most common classification. This classification is then passed onto the next sample. Picking the value for k is key to ensure that the model isn't overfitted to the data. It uses the entire dataset, unlike other algorithms that might take a sample, such as random forest. It has relatively high accuracy given how simple it is, but might not be suitable for complex relationships. It works well with non-linear data, which is the case with our set here.

### Visualizing Results
The following two graphs depicted are comparing the number of accurate and inaccurate matches of the machine learning algorithm used to predict and the outcomes. Both algorithms show a consistent pattern of predicting the candidates who lost the primary, with Random Forest Regression at 70% and K Nearest Neighbors at 54%.