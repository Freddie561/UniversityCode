import pandas as pd
import numpy as np
import statistics as st
from scipy import stats

import matplotlib.pyplot as plt
import random as rd
from sklearn.neural_network import MLPClassifier

def one_mode(l):
    mode = stats.mode(l)

    # return first mode results as tuple
    return mode[0][0]


data = pd.read_excel ('clinical_dataset.xlsx')

#Extracting data from Excel Sheet
Age_data = np.array(pd.DataFrame(data, columns= ['Age']))
BMI_data = np.array(pd.DataFrame(data, columns= ['BMI']))
Glucose_data = np.array(pd.DataFrame(data, columns= ['Glucose']))
Insulin_data = np.array(pd.DataFrame(data, columns= ['Insulin']))
HOMA_data = np.array(pd.DataFrame(data, columns= ['HOMA']))
Leptin_data = np.array(pd.DataFrame(data, columns= ['Leptin']))
Adiponectin_data = np.array(pd.DataFrame(data, columns= ['Adiponectin']))
Resistin_data = np.array(pd.DataFrame(data, columns= ['Resistin']))
MCP1_data = np.array(pd.DataFrame(data, columns= ['MCP.1']))
Status_data = np.array(pd.DataFrame(data, columns= ['Status']))

# Min Calculations

min_array = []
min_array.append(Age_data.min())
min_array.append(BMI_data.min())
min_array.append(Glucose_data.min())
min_array.append(Insulin_data.min())
min_array.append(HOMA_data.min())
min_array.append(Leptin_data.min())
min_array.append(Adiponectin_data.min())
min_array.append(Resistin_data.min())
min_array.append(MCP1_data.min())
print("Min")
print(min_array)

# Max Calculations

max_array = []
max_array.append(Age_data.max())
max_array.append(BMI_data.max())
max_array.append(Glucose_data.max())
max_array.append(Insulin_data.max())
max_array.append(HOMA_data.max())
max_array.append(Leptin_data.max())
max_array.append(Adiponectin_data.max())
max_array.append(Resistin_data.max())
max_array.append(MCP1_data.max())
print("Max")
print(max_array)

# Mean Calculations

mean_array = []
mean_array.append(Age_data.mean())
mean_array.append(BMI_data.mean())
mean_array.append(Glucose_data.mean())
mean_array.append(Insulin_data.mean())
mean_array.append(HOMA_data.mean())
mean_array.append(Leptin_data.mean())
mean_array.append(Adiponectin_data.mean())
mean_array.append(Resistin_data.mean())
mean_array.append(MCP1_data.mean())
print("Mean")
print(mean_array)

# Mode Calculations

mode_array = []
mode_array.append(one_mode(Age_data))
mode_array.append(one_mode(BMI_data))
mode_array.append(one_mode(Glucose_data))
mode_array.append(one_mode(Insulin_data))
mode_array.append(one_mode(HOMA_data))
mode_array.append(one_mode(Leptin_data))
mode_array.append(one_mode(Adiponectin_data))
mode_array.append(one_mode(Resistin_data))
mode_array.append(one_mode(MCP1_data))
print("mode")
print(mode_array)

# Standard Deviation Calculations

std_array = []
std_array.append(Age_data.std())
std_array.append(BMI_data.std())
std_array.append(Glucose_data.std())
std_array.append(Insulin_data.std())
std_array.append(HOMA_data.std())
std_array.append(Leptin_data.std())
std_array.append(Adiponectin_data.std())
std_array.append(Resistin_data.std())
std_array.append(MCP1_data.std())
print("Standard Deviation")
print(std_array)

# Size of all Arrays Calculations

size_array = []
size_array.append(Age_data.size)
size_array.append(BMI_data.size)
size_array.append(Glucose_data.size)
size_array.append(Insulin_data.size)
size_array.append(HOMA_data.size)
size_array.append(Leptin_data.size)
size_array.append(Adiponectin_data.size)
size_array.append(Resistin_data.size)
size_array.append(MCP1_data.size)
print("Size of each table:")
print(size_array)


#put all healthy ages in one and cancerous in another
Healthy_age = []
Cancerous_age = []
for val in Age_data:
    if Status_data[val] == "healthy":
        Healthy_age.append(Age_data[val])
    else:
        Cancerous_age.append(Age_data[val])


#Box Plot

#UNCOMMENT IF YOU WANT TO SEE THE BOXPLOT (WILL REQUIRE YOU TO COMMENT THE .HIST GRAPHS)

#plt.boxplot([Healthy_age,Cancerous_age], labels=['Healthy','Cancerous'])
#plt.title('Healthy Age v Cancerous Age')
#plt.xlabel('Status of Patients')
#plt.ylabel('Age')
#plt.show()

#put all healthy bmi in one and cancerous in another
Healthy_bmi = []
Cancerous_bmi = []
i = 0
for BMI in BMI_data:
    if Status_data[i] == "healthy":
        Healthy_bmi.append(BMI_data[i])
    else:
        Cancerous_bmi.append(BMI_data[i])
    i = i + 1

colors = ['#36e600', '#e6001b']
names = ['Healthy', 'Cancerous']

plt.hist([Healthy_bmi, Cancerous_bmi],
         color = colors, label=names)
plt.title('Comparison of Healthy and Cancerous Patients BMI')
plt.legend()
plt.xlabel('BMI')
plt.ylabel('Amount of Patients')
plt.show()







