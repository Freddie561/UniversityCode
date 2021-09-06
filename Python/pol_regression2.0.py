import pandas as pd
import numpy as np
import matplotlib.pyplot as plt

data_train = pd.read_csv('pol_regression.csv')  # Read in data

sorted_data = data_train.sort_values('x')  # Sort all values by their x sizes

x_train = sorted_data['x']  # split values into training and test sets x
y_train = sorted_data['y']
x_test = sorted_data['x']
y_test = sorted_data['y']

plt.clf()


def getPolynomialDataMatrix(x, degree):  # Function to get get the Polynomial data matrix depending on the degrees given
    X = np.ones(x.shape)  # Creating an X array given the size of input x
    for i in range(1, degree + 1):  # For the amount of degrees given
        X = np.column_stack((X, x ** i))  # Stacks data into 2D array
    return X  # Returns new 2D array


def getWeightsForPolynomialFit(x, y, degree):  # Function to gain weights for Polynomial Fit
    X = getPolynomialDataMatrix(x, degree)  # X = return value of Data Matrix from previous function

    XX = X.transpose().dot(X)  # Transpose X matrix, then multiplying it by itself now that its transpose
    weights = np.linalg.solve(XX, X.transpose().dot(
        y))  # Finds the weights by solving the linear matrix equation of XX and the transposed X multiplied by y

    return weights  # returns weights


def pol_regression(features_train, y_train, degree): # Main pol regression function
    parameters = getWeightsForPolynomialFit(features_train, y_train, degree) # finds original parameters from weights function

    yintercept = parameters[0] # finds the y- intercept

    for i in np.arange(1, len(parameters)):
        yintercept += parameters[i] * features_train ** i # Changing the yintercept on each of the lines based on the weights/parameters

    return parameters


def poly_coefficients(x, coeffs): # function to find the polynomial coefficients
    length = len(coeffs)
    polynomial_coefficients = 0;

    for i in range(length):
        polynomial_coefficients += coeffs[i] * x ** i # Calculating each coefficient based on the weights per line then totally it

    return polynomial_coefficients


def eval_pol_regression(parameters, x, y, degree):
    if degree != 0:
        predicted_vals = poly_coefficients(x, parameters) # If the degree is not 0, the predicted value is the return value of poly_coeff
    else:
        predicted_vals = parameters # Else the predicted value is the parameters given
    # finding the RMSE
    predicted_vals_squared = ((predicted_vals - y) ** 2) # Calculation to find the squared value of the predicted values for the rmse calculation

    rmse = np.sqrt(predicted_vals_squared.mean()) # RMSE calculation by finding the square root of the mean of the predicted values squared

    return rmse


weights = getWeightsForPolynomialFit(x_train, y_train, 1) # Finding the default weights
yintercept = weights[0]

plt.ylim(-200, 200)

#Plotting all the values using the degrees given in the brief
x = np.linspace(-5, 5, len(x_train))
plt.plot(x_train, y_train, 'bo')
line0 = plt.axhline(y=yintercept, color='r', linestyle='-') # 0 degree here
plt.plot(x, poly_coefficients(x, (pol_regression(x_train, y_train, 1))))
plt.plot(x, poly_coefficients(x, (pol_regression(x_train, y_train, 2))))
plt.plot(x, poly_coefficients(x, (pol_regression(x_train, y_train, 3))))
plt.plot(x, poly_coefficients(x, (pol_regression(x_train, y_train, 6))))
plt.plot(x, poly_coefficients(x, (pol_regression(x_train, y_train, 10))))
plt.legend(('points', '$x^0$', '$x$', '$x^2$', '$x^3$', '$x^5$', '$x^{10}$'), loc='lower right')

#Uncomment between "####" to see the evaluation of the regression
####
# training_data = []
# testing_data = []
#
# x = np.linspace(-5, 5, len(x_train))
#
# #Splitting data
#
# x_trainingSet = x_train.sample(frac = 0.7)
# x_testSet = x_train[~x_train.index.isin(x_trainingSet.index)]
# y_trainingSet = y_train.sample(frac = 0.7)
# y_testSet = y_train[~y_train.index.isin(y_trainingSet.index)]
#
# #Training Data
# training_data.append(eval_pol_regression((pol_regression(x_train,y_train,1)),x_trainingSet,y_trainingSet,1))
# training_data.append(eval_pol_regression((pol_regression(x_train,y_train,2)),x_trainingSet,y_trainingSet,2))
# training_data.append(eval_pol_regression((pol_regression(x_train,y_train,3)),x_trainingSet,y_trainingSet,3))
# training_data.append(eval_pol_regression((pol_regression(x_train,y_train,6)),x_trainingSet,y_trainingSet,6))
# training_data.append(eval_pol_regression((pol_regression(x_train,y_train,10)),x_trainingSet,y_trainingSet,10))
#
# #Testing Data
# testing_data.append(eval_pol_regression((pol_regression(x_test,y_test,1)),x_testSet,y_testSet,1))
# testing_data.append(eval_pol_regression((pol_regression(x_test,y_test,2)),x_testSet,y_testSet,2))
# testing_data.append(eval_pol_regression((pol_regression(x_test,y_test,3)),x_testSet,y_testSet,3))
# testing_data.append(eval_pol_regression((pol_regression(x_test,y_test,6)),x_testSet,y_testSet,6))
# testing_data.append(eval_pol_regression((pol_regression(x_test,y_test,10)),x_testSet,y_testSet,10))
#
# degree_list = [1,2,3,6,10]
# plt.figure()
#
# plt.plot(degree_list,training_data)
#
# plt.plot(degree_list,testing_data)
#
# plt.legend(('Training Data', 'Testing Data'), loc='upper right')
####

plt.show()
