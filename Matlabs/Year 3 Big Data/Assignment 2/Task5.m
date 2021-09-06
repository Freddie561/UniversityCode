clc;
clear x;
clear y;
clear mdl;
clear guess_from_Decision_Tree;
clear guess_from_Support_Vector;

%PRE-SHUFFLED/SPLIT DATA ALREADY PROVIDED
%Only uncomment Task4; if you wish to reshuffle and split the data

%Task4;

x = TrainingTableData(:,2:end); % Inputs
x = cell2mat(x);

x_test = TestingTableData(:,2:end);
x_test = cell2mat(x_test);

y = TrainingTableData(:,1); % Targets
y_test = TestingTableData(:,1);
%y_test = cell2mat(y_test);

% Training Decision tree

mdl = fitctree(x,y);

%view(mdl,'mode','graph');

guess_from_Decision_Tree = predict(mdl,x_test);

%Finding out how many are correct for Decision Tree

%For every item in table
True_Pos = 0;
False_Pos = 0;
False_Neg = 0;
True_Neg = 0;
for d = 1: length(y_test)
    
    if(guess_from_Decision_Tree(d)=="Normal" && y_test(d) == "Normal")
        
    True_Pos = True_Pos + 1;
    
    elseif(guess_from_Decision_Tree(d)=="Normal" && y_test(d) == "Abnormal")
        False_Pos = False_Pos + 1;

    elseif(guess_from_Decision_Tree(d)=="Abnormal" && y_test(d) == "Normal")
        False_Neg = False_Neg + 1;

    elseif(guess_from_Decision_Tree(d)=="Abnormal" && y_test(d) == "Abnormal")
        True_Neg = True_Neg + 1;    
    
    end
   
    
end


Sens_of_Decision_Tree = (True_Pos / (True_Pos+False_Neg)) * 100;
Spec_of_Decision_Tree = (True_Neg/(True_Neg+False_Pos)) * 100;
Error_Rate_of_Decision_Tree = ((False_Pos + False_Neg) / length(TestingTableData)) * 100;


%Training Support Vector Machine Model

SVMModel = fitcsvm(x,y);

guess_from_Support_Vector = predict(SVMModel,x_test);

%Finding out how many are correct for Support Vector Machine Model

%For every item in table
True_Pos = 0;
False_Pos = 0;
False_Neg = 0;
True_Neg = 0;
for d = 1: length(y_test)
    
    if(guess_from_Support_Vector(d)=="Normal" && y_test(d) == "Normal")
        
    True_Pos = True_Pos + 1;
    
    elseif(guess_from_Support_Vector(d)=="Normal" && y_test(d) == "Abnormal")
        False_Pos = False_Pos + 1;

    elseif(guess_from_Support_Vector(d)=="Abnormal" && y_test(d) == "Normal")
        False_Neg = False_Neg + 1;

    elseif(guess_from_Support_Vector(d)=="Abnormal" && y_test(d) == "Abnormal")
        True_Neg = True_Neg + 1;    
    
    end
   
    
end


Sens_of_Support_Vector = (True_Pos / (True_Pos+False_Neg)) * 100;
Spec_of_Support_Vector = (True_Neg/(True_Neg+False_Pos)) * 100;
Error_Rate_of_Support_Vector = ((False_Pos + False_Neg) / length(TestingTableData)) * 100;


%Training Artificial Neural Network

%Converting y to binary

norm = "Normal";
abnorm = "Abnormal";

for n = 1 : length(y)
    if isequal(y(n),norm)
        Binary_y{n} = 1;
    elseif isequal(y(n),abnorm)
        Binary_y{n} = 0;
    end
end

Binary_y = cell2mat(Binary_y);

x = x';
x_test = x_test';
net = newff(minmax(x),[20,1],{'logsig','purelin','trainlm'});
net.trainparam.epochs = 8000;
net.trainparam.goal = 1e-25;
net.trainparam.lr = 0.01;



net = train(net,x,Binary_y);

outputs = net(x_test);
outputs = outputs';

ANN_outputs = [];

for n = 1 : length(outputs)
    if outputs(n,1) > 0.5
        ANN_outputs(n,1) = 1;
    else
        ANN_outputs(n,1) = 0;
    end
end


%Finding out how many are correct for ANN

%For every item in table
True_Pos = 0;
False_Pos = 0;
False_Neg = 0;
True_Neg = 0;
for d = 1: length(y_test)
    
    if(ANN_outputs(d)== 1 && y_test(d) == "Normal")
        
    True_Pos = True_Pos + 1;
    
    elseif(ANN_outputs(d)== 1 && y_test(d) == "Abnormal")
        False_Pos = False_Pos + 1;

    elseif(ANN_outputs(d)== 0 && y_test(d) == "Normal")
        False_Neg = False_Neg + 1;

    elseif(ANN_outputs(d)== 0&& y_test(d) == "Abnormal")
        True_Neg = True_Neg + 1;    
    
    end

end

Sens_of_ANN = (True_Pos / (True_Pos+False_Neg)) * 100;
Spec_of_ANN = (True_Neg/(True_Neg+False_Pos)) * 100;
Error_Rate_of_ANN = ((False_Pos + False_Neg) / length(y)) * 100;




Calculations = {'Sensitivity'; 'Specificity'; 'Error Rate';};
Decision_Tree_Calculations = [Sens_of_Decision_Tree;Spec_of_Decision_Tree;Error_Rate_of_Decision_Tree;];
Support_Vector_Calculations = [Sens_of_Support_Vector;Spec_of_Support_Vector;Error_Rate_of_Support_Vector];
ANN_Calculations = [Sens_of_ANN;Spec_of_ANN;Error_Rate_of_ANN;];
All_Correlation_Table = table(Calculations,Decision_Tree_Calculations,Support_Vector_Calculations,ANN_Calculations)

