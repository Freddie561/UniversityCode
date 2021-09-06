load('TrainingSetWeight.mat')
load('TrainingSetHorse.mat')
load('TestSetWeight.mat')
load('TestSetHorse.mat')

clc;


y_values = [];
Sxx = 0;
Sxy = 0;
Syy = 0;
TrainingSetHorse_mean = 0;
TrainingSetWeight_mean = 0;
TSet_Horse_total = 0;
l = 0;

%Calculating total of Training Set Horse
for n = 1 : length(TrainingSetHorse)
    TSet_Horse_total = TSet_Horse_total + TrainingSetHorse(n,1);
      n = n + 1;
      l = l+1;
    
end
%Meaning Calculation of Training Set Horse
TrainingSetHorse_mean = TSet_Horse_total / (n - 1)

TSet_Weight_total = 0;
%Calculating total of Training Set Weight
for n = 1 : length(TrainingSetWeight)
    TSet_Weight_total = TSet_Weight_total + TrainingSetWeight(n,1);
      n = n + 1;
      l = l+1;
    
end
%Meaning Calculation of Training Set Weight
TrainingSetWeight_mean = TSet_Weight_total / (n - 1)

% Linear Regression


for n = 1 : length(TrainingSetHorse)
    
    Sxx = Sxx + ((TrainingSetWeight(n,1) - TrainingSetWeight_mean)^2);
    
end
for n = 1 : length(TrainingSetHorse)
    
    Sxy = Sxy + ((TrainingSetWeight(n,1) - TrainingSetWeight_mean) * (TrainingSetHorse(n,1) - TrainingSetHorse_mean));
    
end
for n = 1 : length(TrainingSetWeight)
    
    Syy = Syy + (TrainingSetWeight(n,1) - TrainingSetWeight_mean)^2;
    
end

W1 = Sxy / Sxx
W0 = TrainingSetHorse_mean - (W1 * TrainingSetWeight_mean)

y_training = W0 + (W1*TrainingSetWeight);
y_testing = W0 + (W1*TestSetWeight);


scatter(TrainingSetWeight,y_training,'b','filled')
hold on
scatter(TrainingSetWeight,TrainingSetHorse,'r');
hold off

xlabel('Weight')
ylabel('Horsepower')
legend('Horsepower Predicted Values','Ground Truth')

%MSE FOR TRAINING

MSE_train = 0;
for n = 1: length(y_training)
    
    MSE_train = MSE_train + ((TrainingSetHorse(n,1) - y_training(n,1)).^2);
    
end

MSE_train = MSE_train / n



%MSE FOR TESTING

MSE_test = 0;
for n = 1: length(y_testing)
    
    MSE_test = MSE_test + ((TestSetHorse(n,1) - y_testing(n,1)).^2);
    
end

MSE_test = MSE_test / n



















