clc;
clear;

imported_table = 'nuclear_plants_small_dataset.csv';
T = readtable(imported_table);

normal = T(T.Status=="Normal",:);
abnormal = T(T.Status=="Abnormal",:);

T(:,1) = [];
normal(:,1) = [];
abnormal(:,1) = [];


normal = table2cell(normal);
normal = cell2mat(normal);
abnormal = table2cell(abnormal);
abnormal = cell2mat(abnormal);
T = table2cell(T);
T = cell2mat(T);



Normal_PowerRangeSensor1 = normal(:,1);
Normal_PowerRangeSensor2 = normal(:,2);
Normal_PowerRangeSensor3= normal(:,3);
Normal_PowerRangeSensor4 = normal(:,4);
Normal_PressureSensor1 = normal(:,5);
Normal_PressureSensor2 = normal(:,6);
Normal_PressureSensor3 = normal(:,7);
Normal_PressureSensor4 = normal(:,8);
Normal_VibrationSensor1 = normal(:,9);
Normal_VibrationSensor2 = normal(:,10);
Normal_VibrationSensor3 = normal(:,11);
Normal_VibrationSensor4 = normal(:,12);

Normal_Data_Set_Name = {'Power_range_sensor_1'; 'Power_range_sensor_2'; 'Power_range_sensor_3'; 'Power_range_sensor_4'; 'Pressure _sensor_1'; 'Pressure _sensor_2'; 'Pressure _sensor_3'; 'Pressure _sensor_4'; 'Vibration_sensor_1'; 'Vibration_sensor_2'; 'Vibration_sensor_3'; 'Vibration_sensor_4'};
Norm_Minimum = [taskMin(Normal_PowerRangeSensor1);taskMin(Normal_PowerRangeSensor2);taskMin(Normal_PowerRangeSensor3);taskMin(Normal_PowerRangeSensor4);taskMin(Normal_PressureSensor1);taskMin(Normal_PressureSensor2);taskMin(Normal_PressureSensor3);taskMin(Normal_PressureSensor4);taskMin(Normal_VibrationSensor1);taskMin(Normal_VibrationSensor2);taskMin(Normal_VibrationSensor3);taskMin(Normal_VibrationSensor4);];
Norm_Maximum = [taskMax(Normal_PowerRangeSensor1);taskMax(Normal_PowerRangeSensor2);taskMax(Normal_PowerRangeSensor3);taskMax(Normal_PowerRangeSensor4);taskMax(Normal_PressureSensor1);taskMax(Normal_PressureSensor2);taskMax(Normal_PressureSensor3);taskMax(Normal_PressureSensor4);taskMax(Normal_VibrationSensor1);taskMax(Normal_VibrationSensor2);taskMax(Normal_VibrationSensor3);taskMax(Normal_VibrationSensor4);];
Norm_Mean = [taskMean(Normal_PowerRangeSensor1);taskMean(Normal_PowerRangeSensor2);taskMean(Normal_PowerRangeSensor3);taskMean(Normal_PowerRangeSensor4);taskMean(Normal_PressureSensor1);taskMean(Normal_PressureSensor2);taskMean(Normal_PressureSensor3);taskMean(Normal_PressureSensor4);taskMean(Normal_VibrationSensor1);taskMean(Normal_VibrationSensor2);taskMean(Normal_VibrationSensor3);taskMean(Normal_VibrationSensor4);];
Norm_Median = [taskMedian(Normal_PowerRangeSensor1);taskMedian(Normal_PowerRangeSensor2);taskMedian(Normal_PowerRangeSensor3);taskMedian(Normal_PowerRangeSensor4);taskMedian(Normal_PressureSensor1);taskMedian(Normal_PressureSensor2);taskMedian(Normal_PressureSensor3);taskMedian(Normal_PressureSensor4);taskMedian(Normal_VibrationSensor1);taskMedian(Normal_VibrationSensor2);taskMedian(Normal_VibrationSensor3);taskMedian(Normal_VibrationSensor4);];
Norm_Modes = [taskMode(Normal_PowerRangeSensor1);taskMode(Normal_PowerRangeSensor2);taskMode(Normal_PowerRangeSensor3);taskMode(Normal_PowerRangeSensor4);taskMode(Normal_PressureSensor1);taskMode(Normal_PressureSensor2);taskMode(Normal_PressureSensor3);taskMode(Normal_PressureSensor4);taskMode(Normal_VibrationSensor1);taskMode(Normal_VibrationSensor2);taskMode(Normal_VibrationSensor3);taskMode(Normal_VibrationSensor4);];
Norm_Variance = [VarCalc(Normal_PowerRangeSensor1);VarCalc(Normal_PowerRangeSensor2);VarCalc(Normal_PowerRangeSensor3);VarCalc(Normal_PowerRangeSensor4);VarCalc(Normal_PressureSensor1);VarCalc(Normal_PressureSensor2);VarCalc(Normal_PressureSensor3);VarCalc(Normal_PressureSensor4);VarCalc(Normal_VibrationSensor1);VarCalc(Normal_VibrationSensor2);VarCalc(Normal_VibrationSensor3);VarCalc(Normal_VibrationSensor4);];
Normal_Table = table(Normal_Data_Set_Name,Norm_Minimum,Norm_Maximum,Norm_Mean,Norm_Median,Norm_Modes,Norm_Variance)

Abnormal_PowerRangeSensor1 = abnormal(:,1);
Abnormal_PowerRangeSensor2 = abnormal(:,2);
Abnormal_PowerRangeSensor3= abnormal(:,3);
Abnormal_PowerRangeSensor4 = abnormal(:,4);
Abnormal_PressureSensor1 = abnormal(:,5);
Abnormal_PressureSensor2 = abnormal(:,6);
Abnormal_PressureSensor3 = abnormal(:,7);
Abnormal_PressureSensor4 = abnormal(:,8);
Abnormal_VibrationSensor1 = abnormal(:,9);
Abnormal_VibrationSensor2 = abnormal(:,10);
Abnormal_VibrationSensor3 = abnormal(:,11);
Abnormal_VibrationSensor4 = abnormal(:,12);

Abnormal_Data_Set_Name = {'Power_range_sensor_1'; 'Power_range_sensor_2'; 'Power_range_sensor_3'; 'Power_range_sensor_4'; 'Pressure _sensor_1'; 'Pressure _sensor_2'; 'Pressure _sensor_3'; 'Pressure _sensor_4'; 'Vibration_sensor_1'; 'Vibration_sensor_2'; 'Vibration_sensor_3'; 'Vibration_sensor_4'};
Abnorm_Minimum = [taskMin(Abnormal_PowerRangeSensor1);taskMin(Abnormal_PowerRangeSensor2);taskMin(Abnormal_PowerRangeSensor3);taskMin(Abnormal_PowerRangeSensor4);taskMin(Abnormal_PressureSensor1);taskMin(Abnormal_PressureSensor2);taskMin(Abnormal_PressureSensor3);taskMin(Abnormal_PressureSensor4);taskMin(Abnormal_VibrationSensor1);taskMin(Abnormal_VibrationSensor2);taskMin(Abnormal_VibrationSensor3);taskMin(Abnormal_VibrationSensor4);];
Abnorm_Maximum = [taskMax(Abnormal_PowerRangeSensor1);taskMax(Abnormal_PowerRangeSensor2);taskMax(Abnormal_PowerRangeSensor3);taskMax(Abnormal_PowerRangeSensor4);taskMax(Abnormal_PressureSensor1);taskMax(Abnormal_PressureSensor2);taskMax(Abnormal_PressureSensor3);taskMax(Abnormal_PressureSensor4);taskMax(Abnormal_VibrationSensor1);taskMax(Abnormal_VibrationSensor2);taskMax(Abnormal_VibrationSensor3);taskMax(Abnormal_VibrationSensor4);];
Abnorm_Mean = [taskMean(Abnormal_PowerRangeSensor1);taskMean(Abnormal_PowerRangeSensor2);taskMean(Abnormal_PowerRangeSensor3);taskMean(Abnormal_PowerRangeSensor4);taskMean(Abnormal_PressureSensor1);taskMean(Abnormal_PressureSensor2);taskMean(Abnormal_PressureSensor3);taskMean(Abnormal_PressureSensor4);taskMean(Abnormal_VibrationSensor1);taskMean(Abnormal_VibrationSensor2);taskMean(Abnormal_VibrationSensor3);taskMean(Abnormal_VibrationSensor4);];
Abnorm_Median = [taskMedian(Abnormal_PowerRangeSensor1);taskMedian(Abnormal_PowerRangeSensor2);taskMedian(Abnormal_PowerRangeSensor3);taskMedian(Abnormal_PowerRangeSensor4);taskMedian(Abnormal_PressureSensor1);taskMedian(Abnormal_PressureSensor2);taskMedian(Abnormal_PressureSensor3);taskMedian(Abnormal_PressureSensor4);taskMedian(Abnormal_VibrationSensor1);taskMedian(Abnormal_VibrationSensor2);taskMedian(Abnormal_VibrationSensor3);taskMedian(Abnormal_VibrationSensor4);];
Abnorm_Modes = [taskMode(Abnormal_PowerRangeSensor1);taskMode(Abnormal_PowerRangeSensor2);taskMode(Abnormal_PowerRangeSensor3);taskMode(Abnormal_PowerRangeSensor4);taskMode(Abnormal_PressureSensor1);taskMode(Abnormal_PressureSensor2);taskMode(Abnormal_PressureSensor3);taskMode(Abnormal_PressureSensor4);taskMode(Abnormal_PressureSensor4);taskMode(Abnormal_VibrationSensor2);taskMode(Abnormal_VibrationSensor3);taskMode(Abnormal_VibrationSensor4);];
Abnorm_Variance = [VarCalc(Abnormal_PowerRangeSensor1);VarCalc(Abnormal_PowerRangeSensor2);VarCalc(Abnormal_PowerRangeSensor3);VarCalc(Abnormal_PowerRangeSensor4);VarCalc(Abnormal_PressureSensor1);VarCalc(Abnormal_PressureSensor2);VarCalc(Abnormal_PressureSensor3);VarCalc(Abnormal_PressureSensor4);VarCalc(Abnormal_VibrationSensor1);VarCalc(Abnormal_VibrationSensor2);VarCalc(Abnormal_VibrationSensor3);VarCalc(Abnormal_VibrationSensor4);];
Abnormal_Table = table(Abnormal_Data_Set_Name,Abnorm_Minimum,Abnorm_Maximum,Abnorm_Mean,Abnorm_Median,Abnorm_Modes,Abnorm_Variance)

All_PowerRangeSensor1 = T(:,1);
All_PowerRangeSensor2 = T(:,2);
All_PowerRangeSensor3 = T(:,3);
All_PowerRangeSensor4 = T(:,4);
All_PressureSensor1 = T(:,5);
All_PressureSensor2 = T(:,6);
All_PressureSensor3 = T(:,7);
All_PressureSensor4 = T(:,8);
All_VibrationSensor1 = T(:,9);
All_VibrationSensor2 = T(:,10);
All_VibrationSensor3 = T(:,11);
All_VibrationSensor4 = T(:,12);



All_Data_Set_Names = {'Power_range_sensor_1'; 'Power_range_sensor_2'; 'Power_range_sensor_3'; 'Power_range_sensor_4'; 'Pressure _sensor_1'; 'Pressure _sensor_2'; 'Pressure _sensor_3'; 'Pressure _sensor_4'; 'Vibration_sensor_1'; 'Vibration_sensor_2'; 'Vibration_sensor_3'; 'Vibration_sensor_4'};
All_Power_range_sensor_1 = [MatrixCorr(All_PowerRangeSensor1,All_PowerRangeSensor1);MatrixCorr(All_PowerRangeSensor1,All_PowerRangeSensor2);MatrixCorr(All_PowerRangeSensor1,All_PowerRangeSensor3);MatrixCorr(All_PowerRangeSensor1,All_PowerRangeSensor4);MatrixCorr(All_PowerRangeSensor1,All_PressureSensor1);MatrixCorr(All_PowerRangeSensor1,All_PressureSensor2);MatrixCorr(All_PowerRangeSensor1,All_PressureSensor3);MatrixCorr(All_PowerRangeSensor1,All_PressureSensor4);MatrixCorr(All_PowerRangeSensor1,All_VibrationSensor1);MatrixCorr(All_PowerRangeSensor1,All_VibrationSensor2);MatrixCorr(All_PowerRangeSensor1,All_VibrationSensor3);MatrixCorr(All_PowerRangeSensor1,All_VibrationSensor4);];
All_Power_range_sensor_2 = [MatrixCorr(All_PowerRangeSensor2,All_PowerRangeSensor1);MatrixCorr(All_PowerRangeSensor2,All_PowerRangeSensor2);MatrixCorr(All_PowerRangeSensor2,All_PowerRangeSensor3);MatrixCorr(All_PowerRangeSensor2,All_PowerRangeSensor4);MatrixCorr(All_PowerRangeSensor2,All_PressureSensor1);MatrixCorr(All_PowerRangeSensor2,All_PressureSensor2);MatrixCorr(All_PowerRangeSensor2,All_PressureSensor3);MatrixCorr(All_PowerRangeSensor2,All_PressureSensor4);MatrixCorr(All_PowerRangeSensor2,All_VibrationSensor1);MatrixCorr(All_PowerRangeSensor2,All_VibrationSensor2);MatrixCorr(All_PowerRangeSensor2,All_VibrationSensor3);MatrixCorr(All_PowerRangeSensor2,All_VibrationSensor4);];
All_Power_range_sensor_3 = [MatrixCorr(All_PowerRangeSensor3,All_PowerRangeSensor1);MatrixCorr(All_PowerRangeSensor3,All_PowerRangeSensor2);MatrixCorr(All_PowerRangeSensor3,All_PowerRangeSensor3);MatrixCorr(All_PowerRangeSensor3,All_PowerRangeSensor4);MatrixCorr(All_PowerRangeSensor3,All_PressureSensor1);MatrixCorr(All_PowerRangeSensor3,All_PressureSensor2);MatrixCorr(All_PowerRangeSensor3,All_PressureSensor3);MatrixCorr(All_PowerRangeSensor3,All_PressureSensor4);MatrixCorr(All_PowerRangeSensor3,All_VibrationSensor1);MatrixCorr(All_PowerRangeSensor3,All_VibrationSensor2);MatrixCorr(All_PowerRangeSensor3,All_VibrationSensor3);MatrixCorr(All_PowerRangeSensor3,All_VibrationSensor4);];
All_Power_range_sensor_4 = [MatrixCorr(All_PowerRangeSensor4,All_PowerRangeSensor1);MatrixCorr(All_PowerRangeSensor4,All_PowerRangeSensor2);MatrixCorr(All_PowerRangeSensor4,All_PowerRangeSensor3);MatrixCorr(All_PowerRangeSensor4,All_PowerRangeSensor4);MatrixCorr(All_PowerRangeSensor4,All_PressureSensor1);MatrixCorr(All_PowerRangeSensor4,All_PressureSensor2);MatrixCorr(All_PowerRangeSensor4,All_PressureSensor3);MatrixCorr(All_PowerRangeSensor4,All_PressureSensor4);MatrixCorr(All_PowerRangeSensor4,All_VibrationSensor1);MatrixCorr(All_PowerRangeSensor4,All_VibrationSensor2);MatrixCorr(All_PowerRangeSensor4,All_VibrationSensor3);MatrixCorr(All_PowerRangeSensor4,All_VibrationSensor4);];
All_Pressure_sensor_1 = [MatrixCorr(All_PressureSensor1,All_PowerRangeSensor1);MatrixCorr(All_PressureSensor1,All_PowerRangeSensor2);MatrixCorr(All_PressureSensor1,All_PowerRangeSensor3);MatrixCorr(All_PressureSensor1,All_PowerRangeSensor4);MatrixCorr(All_PressureSensor1,All_PressureSensor1);MatrixCorr(All_PressureSensor1,All_PressureSensor2);MatrixCorr(All_PressureSensor1,All_PressureSensor3);MatrixCorr(All_PressureSensor1,All_PressureSensor4);MatrixCorr(All_PressureSensor1,All_VibrationSensor1);MatrixCorr(All_PressureSensor1,All_VibrationSensor2);MatrixCorr(All_PressureSensor1,All_VibrationSensor3);MatrixCorr(All_PressureSensor1,All_VibrationSensor4);];
All_Pressure_sensor_2 = [MatrixCorr(All_PressureSensor2,All_PowerRangeSensor1);MatrixCorr(All_PressureSensor2,All_PowerRangeSensor2);MatrixCorr(All_PressureSensor2,All_PowerRangeSensor3);MatrixCorr(All_PressureSensor2,All_PowerRangeSensor4);MatrixCorr(All_PressureSensor2,All_PressureSensor1);MatrixCorr(All_PressureSensor2,All_PressureSensor2);MatrixCorr(All_PressureSensor2,All_PressureSensor3);MatrixCorr(All_PressureSensor2,All_PressureSensor4);MatrixCorr(All_PressureSensor2,All_VibrationSensor1);MatrixCorr(All_PressureSensor2,All_VibrationSensor2);MatrixCorr(All_PressureSensor2,All_VibrationSensor3);MatrixCorr(All_PressureSensor2,All_VibrationSensor4);];
All_Pressure_sensor_3 = [MatrixCorr(All_PressureSensor3,All_PowerRangeSensor1);MatrixCorr(All_PressureSensor3,All_PowerRangeSensor2);MatrixCorr(All_PressureSensor3,All_PowerRangeSensor3);MatrixCorr(All_PressureSensor3,All_PowerRangeSensor4);MatrixCorr(All_PressureSensor3,All_PressureSensor1);MatrixCorr(All_PressureSensor3,All_PressureSensor2);MatrixCorr(All_PressureSensor3,All_PressureSensor3);MatrixCorr(All_PressureSensor3,All_PressureSensor4);MatrixCorr(All_PressureSensor3,All_VibrationSensor1);MatrixCorr(All_PressureSensor3,All_VibrationSensor2);MatrixCorr(All_PressureSensor3,All_VibrationSensor3);MatrixCorr(All_PressureSensor3,All_VibrationSensor4);];
All_Pressure_sensor_4 = [MatrixCorr(All_PressureSensor4,All_PowerRangeSensor1);MatrixCorr(All_PressureSensor4,All_PowerRangeSensor2);MatrixCorr(All_PressureSensor4,All_PowerRangeSensor3);MatrixCorr(All_PressureSensor4,All_PowerRangeSensor4);MatrixCorr(All_PressureSensor4,All_PressureSensor1);MatrixCorr(All_PressureSensor4,All_PressureSensor2);MatrixCorr(All_PressureSensor4,All_PressureSensor3);MatrixCorr(All_PressureSensor4,All_PressureSensor4);MatrixCorr(All_PressureSensor4,All_VibrationSensor1);MatrixCorr(All_PressureSensor4,All_VibrationSensor2);MatrixCorr(All_PressureSensor4,All_VibrationSensor3);MatrixCorr(All_PressureSensor4,All_VibrationSensor4);];
All_Vibration_sensor_1 = [MatrixCorr(All_VibrationSensor1,All_PowerRangeSensor1);MatrixCorr(All_VibrationSensor1,All_PowerRangeSensor2);MatrixCorr(All_VibrationSensor1,All_PowerRangeSensor3);MatrixCorr(All_VibrationSensor1,All_PowerRangeSensor4);MatrixCorr(All_VibrationSensor1,All_PressureSensor1);MatrixCorr(All_VibrationSensor1,All_PressureSensor2);MatrixCorr(All_VibrationSensor1,All_PressureSensor3);MatrixCorr(All_VibrationSensor1,All_PressureSensor4);MatrixCorr(All_VibrationSensor1,All_VibrationSensor1);MatrixCorr(All_VibrationSensor1,All_VibrationSensor2);MatrixCorr(All_VibrationSensor1,All_VibrationSensor3);MatrixCorr(All_VibrationSensor1,All_VibrationSensor4);];
All_Vibration_sensor_2 = [MatrixCorr(All_VibrationSensor2,All_PowerRangeSensor1);MatrixCorr(All_VibrationSensor2,All_PowerRangeSensor2);MatrixCorr(All_VibrationSensor2,All_PowerRangeSensor3);MatrixCorr(All_VibrationSensor2,All_PowerRangeSensor4);MatrixCorr(All_VibrationSensor2,All_PressureSensor1);MatrixCorr(All_VibrationSensor2,All_PressureSensor2);MatrixCorr(All_VibrationSensor2,All_PressureSensor3);MatrixCorr(All_VibrationSensor2,All_PressureSensor4);MatrixCorr(All_VibrationSensor2,All_VibrationSensor1);MatrixCorr(All_VibrationSensor2,All_VibrationSensor2);MatrixCorr(All_VibrationSensor2,All_VibrationSensor3);MatrixCorr(All_VibrationSensor2,All_VibrationSensor4);];
All_Vibration_sensor_3 = [MatrixCorr(All_VibrationSensor3,All_PowerRangeSensor1);MatrixCorr(All_VibrationSensor3,All_PowerRangeSensor2);MatrixCorr(All_VibrationSensor3,All_PowerRangeSensor3);MatrixCorr(All_VibrationSensor3,All_PowerRangeSensor4);MatrixCorr(All_VibrationSensor3,All_PressureSensor1);MatrixCorr(All_VibrationSensor3,All_PressureSensor2);MatrixCorr(All_VibrationSensor3,All_PressureSensor3);MatrixCorr(All_VibrationSensor3,All_PressureSensor4);MatrixCorr(All_VibrationSensor3,All_VibrationSensor1);MatrixCorr(All_VibrationSensor3,All_VibrationSensor2);MatrixCorr(All_VibrationSensor3,All_VibrationSensor3);MatrixCorr(All_VibrationSensor3,All_VibrationSensor4);];
All_Vibration_sensor_4 = [MatrixCorr(All_VibrationSensor4,All_PowerRangeSensor1);MatrixCorr(All_VibrationSensor4,All_PowerRangeSensor2);MatrixCorr(All_VibrationSensor4,All_PowerRangeSensor3);MatrixCorr(All_VibrationSensor4,All_PowerRangeSensor4);MatrixCorr(All_VibrationSensor4,All_PressureSensor1);MatrixCorr(All_VibrationSensor4,All_PressureSensor2);MatrixCorr(All_VibrationSensor4,All_PressureSensor3);MatrixCorr(All_VibrationSensor4,All_PressureSensor4);MatrixCorr(All_VibrationSensor4,All_VibrationSensor1);MatrixCorr(All_VibrationSensor4,All_VibrationSensor2);MatrixCorr(All_VibrationSensor4,All_VibrationSensor3);MatrixCorr(All_VibrationSensor4,All_VibrationSensor4);];
All_Correlation_Table = table(All_Data_Set_Names,All_Power_range_sensor_1,All_Power_range_sensor_2,All_Power_range_sensor_3,All_Power_range_sensor_4,All_Pressure_sensor_1,All_Pressure_sensor_2,All_Pressure_sensor_3,All_Pressure_sensor_4,All_Vibration_sensor_1,All_Vibration_sensor_2,All_Vibration_sensor_3,All_Vibration_sensor_4)






% #### Boxplots for all normal status features #########################
% UNCOMMENT from group = [] to title() - Line 108-116

% Power Range Sensors (Normal Status)

group = [    ones(size(Normal_PowerRangeSensor1));
         2 * ones(size(Normal_PowerRangeSensor2));
         3 * ones(size(Normal_PowerRangeSensor3));
         4 * ones(size(Normal_PowerRangeSensor4))];
figure
boxplot([Normal_PowerRangeSensor1; Normal_PowerRangeSensor2; Normal_PowerRangeSensor3;Normal_PowerRangeSensor4],group)
set(gca,'XTickLabel',{'PowerRangeSensor 1','PowerRangeSensor 2','PowerRangeSensor 3','PowerRangeSensor 4'})

title('Power Range Sensors (Normal Status)')


% Pressure Sensors (Normal Status)

% group = [    ones(size(Normal_PressureSensor1));
%          2 * ones(size(Normal_PressureSensor2));
%          3 * ones(size(Normal_PressureSensor3));
%          4 * ones(size(Normal_PressureSensor4))];
% figure
% boxplot([Normal_PressureSensor1; Normal_PressureSensor2; Normal_PressureSensor3;Normal_PressureSensor4],group)
% set(gca,'XTickLabel',{'PressureSensor 1','PressureSensor 2','PressureSensor 3','PressureSensor 4'})
% 
% title('Pressure Sensors (Normal Status)')


% Vibration Sensors (Normal Status)

% group = [    ones(size(Normal_VibrationSensor1));
%          2 * ones(size(Normal_VibrationSensor2));
%          3 * ones(size(Normal_VibrationSensor3));
%          4 * ones(size(Normal_VibrationSensor4))];
% figure
% boxplot([Normal_VibrationSensor1; Normal_VibrationSensor2; Normal_VibrationSensor3;Normal_VibrationSensor4],group)
% set(gca,'XTickLabel',{'Vibration Sensor 1','Vibration Sensor 2','Vibration Sensor 3','Vibration Sensor 4'})
% 
% title('Vibration Sensors (Normal Status)')



% #### Boxplots for all Abnormal status features #########################

% Power Range Sensors (Abnormal Status)

% group = [    ones(size(Abnormal_PowerRangeSensor1));
%          2 * ones(size(Abnormal_PowerRangeSensor2));
%          3 * ones(size(Abnormal_PowerRangeSensor3));
%          4 * ones(size(Abnormal_PowerRangeSensor4))];
% figure
% boxplot([Abnormal_PowerRangeSensor1; Abnormal_PowerRangeSensor2; Abnormal_PowerRangeSensor3;Abnormal_PowerRangeSensor4],group)
% set(gca,'XTickLabel',{'PowerRangeSensor1','PowerRangeSensor 2','PowerRangeSensor 3','PowerRangeSensor 4'})
% 
% title('Power Range Sensors (Abnormal Status)')


% Power Range Sensors (Abnormal Status)

% group = [    ones(size(Abnormal_PressureSensor1));
%          2 * ones(size(Abnormal_PressureSensor2));
%          3 * ones(size(Abnormal_PressureSensor3));
%          4 * ones(size(Abnormal_PressureSensor4))];
% figure
% boxplot([Abnormal_PressureSensor1; Abnormal_PressureSensor2; Abnormal_PressureSensor3;Abnormal_PressureSensor4],group)
% set(gca,'XTickLabel',{'PressureSensor 1','PressureSensor 2','PressureSensor 3','PressureSensor 4'})
% 
% title('Pressure Sensors (Abnormal Status)')


% Vibration Sensors (Abormal Status)

% group = [    ones(size(Abnormal_VibrationSensor1));
%          2 * ones(size(Abnormal_VibrationSensor2));
%          3 * ones(size(Abnormal_VibrationSensor3));
%          4 * ones(size(Abnormal_VibrationSensor4))];
% figure
% boxplot([Abnormal_VibrationSensor1; Abnormal_VibrationSensor2; Abnormal_VibrationSensor3;Abnormal_VibrationSensor4],group)
% set(gca,'XTickLabel',{'Vibration Sensor 1','Vibration Sensor 2','Vibration Sensor 3','Vibration Sensor 4'})
% 
% title('Vibration Sensors (Abnormal Status)')



xlabel('')
ylabel('Values')





function mode_of_x = taskMode(x)

num = numel(x);
for j = 0 : num-1
    
    for i = 1: num-j-1
        
        if x(i)>x(i+1)
            
            temp = x(i);
            x(i) = x(i+1);
            x(i+1) = temp;
        end
    end
end
tempMode_Amount = 0;
mode_frequency = 0;
mode_of_x = 0;


length_of_x = length(x);
for a = 1 : length_of_x

        for b = a:length_of_x
        
            if x(a) == x(b)
            
            tempMode_Amount = tempMode_Amount + 1;
                    
                    if mode_frequency<tempMode_Amount
                
                    mode_frequency = tempMode_Amount; 
                    mode_of_x = x(a);

                    end
            end
            
        end
        tempMode_Amount = 0;
end

end



%Min Function
function min = taskMin(x)
%Bubblesort function
num = numel(x);
for j = 0 : num-1
    
    for i = 1: num-j-1
        
        if x(i)>x(i+1)
            
            temp = x(i);
            x(i) = x(i+1);
            x(i+1) = temp;
        end
    end
end
min = x(1,1);

end

function med = taskMedian(x)
%Bubblesort function
num = numel(x);
for j = 0 : num-1
    
    for i = 1: num-j-1
        
        if x(i)>x(i+1)
            
            temp = x(i);
            x(i) = x(i+1);
            x(i+1) = temp;
        end
    end
end
med = x(length(x)/2,1);

end

function max = taskMax(x)

%Bubblesort function
num = numel(x);
for j = 0 : num-1
    
    for i = 1: num-j-1
        
        if x(i)>x(i+1)
            
            temp = x(i);
            x(i) = x(i+1);
            x(i+1) = temp;
        end
    end
end
max = x(length(x),1);
end
%Mean Function
function mean = taskMean(x)
total = 0;
l = 0;
for n = 1 : length(x)
    total = total + x(n,1);
      n = n + 1;
      l = l+1;
end
mean = total / l;
end

% Standard Deviation and Variance
function variance = VarCalc(x)
 SD = {};
 SDtotal = 0;
% Standard Deviation
 for n = 1 : length(x)
     SD{n,1} = x(n,1) - (taskMean(x));
     SD{n,1} = SD{n,1} * SD{n,1};
     SDtotal = SDtotal + SD{n,1};
 end
variance = SDtotal / (n-1);
end

% Finding the Correlation Matrix

function r = MatrixCorr(x,y)

x_total = 0;
x_mean = 0;
y_total = 0;
y_mean = 0;

%Calculating total of x
for n = 1 : length(x)
    x_total = x_total + x(n,1);
end
%Meaning Calculation of x
x_mean = x_total / n;

%Calculating total of y
for n = 1 : size(y)
    y_total = y_total + y(n,1);
end

%Meaning Calculation of y
y_mean = y_total / n;

Sxy = 0;
Sxx = 0;
Syy = 0;

for n = 1 : length(x)
    
    Sxx = Sxx + ((x(n,1) - x_mean)^2);
    
end
for n = 1 : length(x)
    
    Sxy = Sxy + ((x(n,1) - x_mean) * (y(n,1) - y_mean));
    
end
for n = 1 : length(x)
    
    Syy = Syy + (y(n,1) - y_mean)^2;
    
end

r = Sxy / sqrt((Sxx * Syy));

end


