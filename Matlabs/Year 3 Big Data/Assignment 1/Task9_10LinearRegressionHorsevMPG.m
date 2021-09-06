load('TrainingSetHorse.mat')
load('TrainingSetMPG.mat')
load('TestSetHorse.mat')
load('TestSetAcc.mat')
clc;


y_values = [];
Sxx = 0;
Sxy = 0;
Syy = 0;
TrainingSetHorse_mean = 0;
TrainingSetMPG_mean = 0;
TestSet_Horse_total = 0;
l = 0;

%Calculating total of Training Set Horse
for n = 1 : length(TrainingSetHorse)
    TestSet_Horse_total = TestSet_Horse_total + TrainingSetHorse(n,1);
      n = n + 1;
      l = l+1;
    
end
%Meaning Calculation of Training Set Horse
TrainingSetHorse_mean = TestSet_Horse_total / (n - 1)

TSet_MPG_total = 0;
%Calculating total of Training Set Weight
for n = 1 : length(TrainingSetMPG)
    TSet_MPG_total = TSet_MPG_total + TrainingSetMPG(n,1);
      n = n + 1;
      l = l+1;
    
end
%Meaning Calculation of Training Set Weight
TrainingSetMPG_mean = TSet_MPG_total / (n - 1)

% Linear Regression


for n = 1 : length(TrainingSetHorse)
    
    Sxx = Sxx + ((TrainingSetMPG(n,1) - TrainingSetMPG_mean)^2);
    
end


for n = 1 : length(TrainingSetHorse)
    
    Sxy = Sxy + ((TrainingSetMPG(n,1) - TrainingSetMPG_mean) * (TrainingSetHorse(n,1) - TrainingSetHorse_mean));
    
end
for n = 1 : length(TrainingSetMPG)
    
    Syy = Syy + (TrainingSetMPG(n,1) - TrainingSetMPG_mean)^2;
    
end

W1 = Sxy / Sxx
W0 = TrainingSetHorse_mean - (W1 * TrainingSetMPG_mean)

y_training = W0 + (W1*TrainingSetMPG);
y_testing = W0 + (W1*TestSetMPG);


scatter(TestSetMPG,y_testing,'b','filled')
hold on
scatter(TestSetMPG,TestSetHorse,'r')
hold off

xlabel('MPG')
ylabel('Horsepower')
legend('MPG Predicted Values','Ground Truth')


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
















