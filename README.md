# Integrative Biomechanical and Clinical Features Predict In-Hospital Trauma Mortality

### Installation

```
pip install -r requirements.txt
```

### Methods:

We performed binary classification using both clinical and biomechanical variables (n=103) to predict in-hospital trauma mortality. Methods evaluated include: logistic regression with ridge regularization (sklearn.linear_model library in python), support vector classifier (sklearn.svm), neural network (tensorflow.keras), and random forest(sklearn.ensemble). Random forest modeling predicted 3-day in-hospital mortality at the highest accuracy (85% identifying 16 integrative features from both data types .

### Results:

Using trauma patient clinical and clot mechanics data derived in-hospital and at our research laboratory respectively, we identify 16 significant features (based on Gini index of random forest modeling, Figure 1) as potential contributors and predictors of in-hospital mortality. Features identified both confirm previously known clinical variables (e.g. PT, PTT, D-dimer) as well as offer new candidates (e.g. clot polymerization rate) that together contribute to improved prediction of mortality than current clinical severity scales (Figure 1, e.g. injury severity score ISS or abbreviated injury scale AIS_HEAD).

<img src="Plots_2/combined_plots_3.png"></img>

### Conclusion:

Our findings indicate a significant role for clot mechanics as a unique dimension into evaluating trauma mortality over and above current patient in-hospital clinical measurements.
