load('TrainingSetAcc.mat')
load('TrainingSetMPG.mat')
load('TestSetMPG.mat')
load('TestSetAcc.mat')
clc;

y_values = [];
Sxx = 0;
Sxy = 0;
Syy = 0;
TrainingSetAcc_mean = 0;
TrainingSetMPG_mean = 0;
TSet_Acc_total = 0;
l = 0;

%Calculating total of Training Set Horse
for n = 1 : length(TrainingSetAcc)
    TSet_Acc_total = TSet_Acc_total + TrainingSetAcc(n,1);
      n = n + 1;
      l = l+1;
    
end
%Meaning Calculation of Training Set Horse
TrainingSetAcc_mean = TSet_Acc_total / (n - 1)

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


for n = 1 : length(TrainingSetAcc)
    
    Sxx = Sxx + ((TrainingSetMPG(n,1) - TrainingSetMPG_mean)^2);
    
end


for n = 1 : length(TrainingSetAcc)
    
    Sxy = Sxy + ((TrainingSetMPG(n,1) - TrainingSetMPG_mean) * (TrainingSetAcc(n,1) - TrainingSetAcc_mean));
    
end
for n = 1 : length(TrainingSetMPG)
    
    Syy = Syy + (TrainingSetMPG(n,1) - TrainingSetMPG_mean)^2;
    
end

W1 = Sxy / Sxx
W0 = TrainingSetAcc_mean - (W1 * TrainingSetMPG_mean)


y_training = W0 + (W1*TrainingSetMPG); %Value used to find the MSE of the y training data

y_testing = W0 + (W1*TestSetMPG);


scatter(TestSetMPG,y_testing,'b','filled')
hold on
scatter(TestSetMPG,TestSetAcc,'r');
hold off

xlabel('MPG')
ylabel('Acceleration')
legend('MPG Predicted Values','Ground Truth')

%MSE FOR TRAINING

MSE_train = 0;
for n = 1: length(y_training)
    
    MSE_train = MSE_train + ((TrainingSetAcc(n,1) - y_training(n,1)).^2);
    
end

MSE_train = MSE_train / n


%MSE FOR TESTING

MSE_test = 0;
for n = 1: length(y_testing)
    
    MSE_test = MSE_test + ((TestSetAcc(n,1) - y_testing(n,1)).^2);
    
end

MSE_test = MSE_test / n





















