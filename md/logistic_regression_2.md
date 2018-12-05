#### (If you care a little more about the statistics...)
Since we're using a statistical method, we can analyze our results with a **confusion matrix**. A confusion matrix shows the intersection of the "true outcomes" (rows) vs. the "predicted" (columns) and how they overlap which can show the values for true/false negatives/positives. 

$$\left[\begin{array}{rrr} 157 & 13 \\ 50 & 24 \\ \end{array}\right]$$ 

**Sensitivity and Specificity:**

* sensitivity = 24 / (24 + 50) = 0.32432432432432434
* specificity = 157 / (157+ 13) = 0.9235294117647059

* type1error = 1 - specificity = 0.07647058823529407
* type2error = 1 - sensitivity = 0.6756756756756757

* The portion of accurately predicted advanced status (true positive) was 32%
* The portion of accurately predicted no advanced status (true negative) was 92%
* The portion of instances that were incorrectly identified as positive cases was 7%
* The portion of instances that were incorrectly identified as negative was 67.5%
