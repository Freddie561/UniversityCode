import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
from sklearn.model_selection import train_test_split
from sklearn.neural_network import MLPClassifier
from sklearn.metrics import confusion_matrix
from sklearn.preprocessing import StandardScaler
from sklearn.ensemble import RandomForestClassifier
from sklearn.model_selection import ShuffleSplit
from sklearn.model_selection import cross_val_score
import random as rd


def accuracy(confusion_matrix):
   diagonal_sum = confusion_matrix.trace()
   sum_of_all_elements = confusion_matrix.sum()
   return diagonal_sum / sum_of_all_elements


df = pd.read_excel('clinical_dataset.xlsx')

y_split = df['Status']
x_split = df.drop(['Status'], axis=1)


x_train, x_test, y_train, y_test = train_test_split(x_split, y_split, test_size=0.10)

#epochs = 10

#clf = MLPClassifier(hidden_layer_sizes=(500,500), max_iter=epochs,activation = 'logistic',solver='adam',random_state=42)
#clf.fit(x_train, y_train)
#y_pred = clf.predict(x_test)
#cm = confusion_matrix(y_pred, y_test)
#print("Accuracy of MLPClassifier 10 :" '', accuracy(cm))


#epochs = 30

#clf3 = MLPClassifier(hidden_layer_sizes=(500,500), max_iter=epochs,activation = 'logistic',solver='adam',random_state=42)
#clf3.fit(x_train, y_train)
#y_pred3 = clf3.predict(x_test)
#cm3 = confusion_matrix(y_pred3, y_test)
#print("Accuracy of MLPClassifier 30 :" '', accuracy(cm3))

#epochs = 100

#clf2 = MLPClassifier(hidden_layer_sizes=(500,500), max_iter=epochs,activation = 'logistic',solver='adam',random_state=42)
#clf2.fit(x_train, y_train)
#y_pred2 = clf2.predict(x_test)
#cm2 = confusion_matrix(y_pred2, y_test)
#print("Accuracy of MLPClassifier 100 :" '', accuracy(cm2))

#epochs = 300

#clf0 = MLPClassifier(hidden_layer_sizes=(500,500), max_iter=epochs,activation = 'logistic',solver='adam',random_state=42)
#clf0.fit(x_train, y_train)
#y_pred0 = clf0.predict(x_test)
#cm0 = confusion_matrix(y_pred0, y_test)
#print("Accuracy of MLPClassifier 300 :" '', accuracy(cm0))


#epochs = 3000

#clf1 = MLPClassifier(hidden_layer_sizes=(500,500), max_iter=epochs,activation = 'logistic',solver='adam',random_state=42)
#clf1.fit(x_train, y_train)
#y_pred1 = clf0.predict(x_test)
#cm1 = confusion_matrix(y_pred1, y_test)
#print("Accuracy of MLPClassifier 3000 :" '', accuracy(cm1))


#clf = MLPClassifier(hidden_layer_sizes=(500,500), max_iter=3000,activation = 'logistic',solver='adam',random_state=42)
#clf.fit(x_train, y_train)


#y_pred = clf.predict(x_test)
#cm = confusion_matrix(y_pred, y_test)
#print("Accuracy of MLPClassifier :" '', accuracy(cm))


#clf1 = MLPClassifier(hidden_layer_sizes=(500,500), max_iter=3000,activation = 'logistic',solver='adam',random_state=42)
#clf1.fit(x_train, y_train)
#y_pred1 = clf1.predict(x_test)
#cm1 = confusion_matrix(y_pred1, y_test)
#print("Accuracy of MLPClassifier :" '', accuracy(cm1))

#clf2 = MLPClassifier(hidden_layer_sizes=(500,500), max_iter=3000,activation = 'logistic',solver='adam',random_state=42)
#clf2.fit(x_train, y_train)
#y_pred2 = clf2.predict(x_test)
#cm2 = confusion_matrix(y_pred2, y_test)
#print("Accuracy of MLPClassifier :" '', accuracy(cm2))

#clf3 = MLPClassifier(hidden_layer_sizes=(500,500), max_iter=3000,activation = 'logistic',solver='adam',random_state=42)
#clf3.fit(x_train, y_train)
#y_pred3 = clf3.predict(x_test)
#cm3 = confusion_matrix(y_pred3, y_test)
#print("Accuracy of MLPClassifier :" '', accuracy(cm3))

#################  MAX LEAF 5 ################

#forest10 = RandomForestClassifier(n_estimators=10,min_samples_leaf =5)
#forest10 = forest10.fit(x_train,y_train)
#forest_predict10 = forest10.predict(x_test)

#forest_CM10 = confusion_matrix(forest_predict10, y_test)

#print("Accuracy of Forest 10 leaf 5 :" '', accuracy(forest_CM10))

#forest50 = RandomForestClassifier(n_estimators=50,min_samples_leaf =5)
#forest50 = forest50.fit(x_train,y_train)
#forest_predict50 = forest50.predict(x_test)

#forest_CM50 = confusion_matrix(forest_predict50, y_test)

#print("Accuracy of Forest 50 leaf 5 :" '', accuracy(forest_CM50))

#forest100 = RandomForestClassifier(n_estimators=100,min_samples_leaf =5)
#forest100 = forest100.fit(x_train,y_train)
#forest_predict100 = forest100.predict(x_test)

#forest_CM100 = confusion_matrix(forest_predict100, y_test)

#print("Accuracy of Forest 1000 leaf 5 :" '', accuracy(forest_CM100))

#forest1 = RandomForestClassifier(n_estimators=1000,min_samples_leaf=5)
#forest1 = forest1.fit(x_train,y_train)
#forest_predict1 = forest1.predict(x_test)

#forest_CM1 = confusion_matrix(forest_predict1, y_test)

#print("Accuracy of Forest 1000 leaf 5 :" '', accuracy(forest_CM1))

#forest5 = RandomForestClassifier(n_estimators=5000,min_samples_leaf=5)
#forest5 = forest5.fit(x_train,y_train)
#forest_predict5 = forest5.predict(x_test)

#forest_CM5 = confusion_matrix(forest_predict5, y_test)

#print("Accuracy of Forest 5000 leaf 5 :" '', accuracy(forest_CM1))

#forest2 = RandomForestClassifier(n_estimators=1000,min_samples_leaf=50)
#forest2 = forest2.fit(x_train,y_train)
#forest_predict2 = forest2.predict(x_test)

#forest_CM2 = confusion_matrix(forest_predict2, y_test)

#print("Accuracy of Forest 1000 leaf 5 :" '', accuracy(forest_CM1))
#print("Accuracy of Forest 1000 leaf 50 :" '', accuracy(forest_CM2))

#forest5000 = RandomForestClassifier(n_estimators=5000,min_samples_leaf =5)
#forest5000 = forest5000.fit(x_train,y_train)
#forest_predict5000 = forest5000.predict(x_test)

#forest_CM5000 = confusion_matrix(forest_predict5000, y_test)

#print("Accuracy of Forest 5000 leaf 5 :" '', accuracy(forest_CM5000))

#################  MAX LEAF 50 ################

#forest10leaf = RandomForestClassifier(n_estimators=10,min_samples_leaf =50)
#forest10leaf = forest10leaf.fit(x_train,y_train)
#forest_predict10leaf = forest10leaf.predict(x_test)

#forest_CM10leaf = confusion_matrix(forest_predict10leaf, y_test)

#print("Accuracy of Forest 10 leaf 50 :" '', accuracy(forest_CM10leaf))

#forest50leaf = RandomForestClassifier(n_estimators=50,min_samples_leaf =50)
#forest50leaf = forest50leaf.fit(x_train,y_train)
#forest_predict50leaf = forest50leaf.predict(x_test)

#forest_CM50leaf = confusion_matrix(forest_predict50leaf, y_test)

#print("Accuracy of Forest 50 leaf 50 :" '', accuracy(forest_CM50leaf))

#forest100leaf = RandomForestClassifier(n_estimators=100,min_samples_leaf =50)
#forest100leaf = forest100leaf.fit(x_train,y_train)
#forest_predict100leaf = forest100leaf.predict(x_test)

#forest_CM100leaf = confusion_matrix(forest_predict100leaf, y_test)

#print("Accuracy of Forest 100 leaf 50 :" '', accuracy(forest_CM100))

#forest1000leaf = RandomForestClassifier(n_estimators=1000,min_samples_leaf =50)
#forest1000leaf = forest1000leaf.fit(x_train,y_train)
#forest_predict1000leaf = forest1000leaf.predict(x_test)

#forest_CM1000leaf = confusion_matrix(forest_predict1000leaf, y_test)

#print("Accuracy of Forest 1000 leaf 50 :" '', accuracy(forest_CM1000leaf))

#forest5000leaf = RandomForestClassifier(n_estimators=5000,min_samples_leaf =50)
#forest5000leaf = forest5000leaf.fit(x_train,y_train)
#forest_predict5000leaf = forest5000leaf.predict(x_test)

#forest_CM5000leaf = confusion_matrix(forest_predict5000leaf, y_test)

#print("Accuracy of Forest 5000 leaf 50 :" '', accuracy(forest_CM5000leaf))


clf50 = MLPClassifier(hidden_layer_sizes=(50,50), max_iter=300,activation = 'logistic',solver='adam',random_state=42,verbose=10)
clf50.fit(x_train, y_train)

clf500 = MLPClassifier(hidden_layer_sizes=(500,500), max_iter=300,activation = 'logistic',solver='adam',random_state=42,verbose=10)
clf500.fit(x_train, y_train)


clf1000 = MLPClassifier(hidden_layer_sizes=(1000,1000), max_iter=300,activation = 'logistic',solver='adam',random_state=42,verbose=10)
clf1000.fit(x_train, y_train)

forest20 = RandomForestClassifier(n_estimators=20, min_samples_leaf =5,verbose=10)
forest20 = forest20.fit(x_train,y_train)

forest500 = RandomForestClassifier(n_estimators=500,min_samples_leaf =5,verbose=10)
forest500 = forest500.fit(x_train,y_train)

forest10000 = RandomForestClassifier(n_estimators=10000,min_samples_leaf =5,verbose=10)
forest10000 = forest10000.fit(x_train,y_train)


cv = ShuffleSplit(n_splits=10, test_size=0.1, random_state=42)

output = cross_val_score(clf50, x_split, y_split, cv=cv)

output1 = cross_val_score(clf500, x_split, y_split, cv=cv)
output2 = cross_val_score(clf1000, x_split, y_split, cv=cv)
output3 = cross_val_score(forest20, x_split, y_split, cv=cv)
output4 = cross_val_score(forest500, x_split, y_split, cv=cv)
output5 = cross_val_score(forest10000, x_split, y_split, cv=cv)


print("ANN, Neuron Amount: 50 Accuracy %0.2f " %(output.mean()))

print("ANN, Neuron Amount: 500 Accuracy: %0.2f "  % (output1.mean()))

print("ANN, Neuron Amount: 1000 Accuracy: %0.2f " % (output2.mean()))

print("Random Forest, Tree Amount: 20 Accuracy: %0.2f " % (output3.mean()))

print("Random Forest, Tree Amount: 500 Accuracy: %0.2f" % (output4.mean()))

print("Random Forest, Tree Amount: 10,000 Accuracy: %0.2f" % (output5.mean()))


