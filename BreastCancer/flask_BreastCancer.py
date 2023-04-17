from flask import Flask, render_template
import numpy as np
import matplotlib.pyplot as plt
import pandas as pd
app = Flask(__name__)
 
@app.route("/")
def home():
    return "Welcome to the HomePage!"



def preProcess():
    dataset = pd.read_csv('/Users/ashaykargaonkar/Documents/untitled folder/portfolio/breast_cancer.csv')
    X = dataset.iloc[:, :-1].values
    y = dataset.iloc[:, -1].values
    from sklearn.model_selection import train_test_split
    X_train, X_test, y_train, y_test = train_test_split(X, y, test_size = 0.25, random_state = 0)
    from sklearn.preprocessing import StandardScaler
    sc = StandardScaler()
    X_train = sc.fit_transform(X_train)
    X_test = sc.transform(X_test)
    return X_train, X_test, y_train, y_test, sc





@app.route("/project/breastCancer/logRegClass")
def logRegClass():
    X_train, X_test, y_train, y_test, sc = preProcess()
    from sklearn.linear_model import LogisticRegression
    classifier = LogisticRegression(random_state = 0)
    classifier.fit(X_train, y_train)
    ans = classifier.predict(sc.transform([[5,1,1,1,2,1,3,1,1]]))   
    return "Logistic Regression Prediction is " + str(ans)


@app.route("/project/breastCancer/knnClass")
def knnClass():

    X_train, X_test, y_train, y_test, sc = preProcess()

    from sklearn.neighbors import KNeighborsClassifier
    classifier = KNeighborsClassifier(n_neighbors = 5, metric = 'minkowski', p = 2)
    classifier.fit(X_train, y_train)

    ans = classifier.predict(sc.transform([[5,1,1,1,2,1,3,1,1]]))   
    return "kNN Prediction is " + str(ans)

@app.route("/project/breastCancer/svmClass")
def svmClass():
    X_train, X_test, y_train, y_test, sc = preProcess()

    from sklearn.svm import SVC
    classifier = SVC(kernel = 'linear', random_state = 0)
    classifier.fit(X_train, y_train)

    ans = classifier.predict(sc.transform([[5,1,1,1,2,1,3,1,1]]))   
    return "SVM Prediction is " + str(ans)

@app.route("/project/breastCancer/ksvmClass")
def ksvmClass():
    X_train, X_test, y_train, y_test, sc = preProcess()

    from sklearn.svm import SVC
    classifier = SVC(kernel = 'rbf', random_state = 0)
    classifier.fit(X_train, y_train)

    ans = classifier.predict(sc.transform([[5,1,1,1,2,1,3,1,1]]))   
    return "kSVM Prediction is " + str(ans)


@app.route("/project/breastCancer/NBClass")
def NBClass():
    X_train, X_test, y_train, y_test, sc = preProcess()

    from sklearn.naive_bayes import GaussianNB
    classifier = GaussianNB()
    classifier.fit(X_train, y_train)

    ans = classifier.predict(sc.transform([[5,1,1,1,2,1,3,1,1]]))   
    return "Naive Bayes Prediction is " + str(ans)


@app.route("/project/breastCancer/DTClass")
def DTClass():
    X_train, X_test, y_train, y_test, sc = preProcess()

    from sklearn.tree import DecisionTreeClassifier
    classifier = DecisionTreeClassifier(criterion = 'entropy', random_state = 0)
    classifier.fit(X_train, y_train)

    ans = classifier.predict(sc.transform([[5,1,1,1,2,1,3,1,1]]))   
    return "Decision Tree Prediction is " + str(ans)

@app.route("/project/breastCancer/RFClass")
def RFClass():
    X_train, X_test, y_train, y_test, sc = preProcess()

    from sklearn.ensemble import RandomForestClassifier
    classifier = RandomForestClassifier(n_estimators = 10, criterion = 'entropy', random_state = 0)
    classifier.fit(X_train, y_train)

    ans = classifier.predict(sc.transform([[5,1,1,1,2,1,3,1,1]]))   
    return "Random Forest Prediction is " + str(ans)






if __name__ == "__main__":
    app.run(debug=True, host="0.0.0.0", port=3000)