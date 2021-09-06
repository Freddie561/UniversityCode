clear;
clc;
ds = tabularTextDatastore('nuclear_plants_big_dataset.csv','TreatAsMissing','NA');


p = parpool('local', 4);
mr = mapreducer(p);


ds.SelectedVariableNames = {'Power_range_sensor_1'};
Power_range_sensor_1_Mean = mapreduce(ds, @MeanMap, @MeanReduce,mr);
Power_range_sensor_1_Max = mapreduce(ds, @maxMapper, @maxReducer,mr);
Power_range_sensor_1_Min = mapreduce(ds, @minMapper, @minReducer,mr);
ds.SelectedVariableNames = {'Power_range_sensor_2'};
Power_range_sensor_2_Mean = mapreduce(ds, @MeanMap, @MeanReduce,mr);
Power_range_sensor_2_Max = mapreduce(ds, @maxMapper, @maxReducer,mr);
Power_range_sensor_2_Min = mapreduce(ds, @minMapper, @minReducer,mr);
ds.SelectedVariableNames = {'Power_range_sensor_3'};
Power_range_sensor_3_Mean = mapreduce(ds, @MeanMap, @MeanReduce,mr);
Power_range_sensor_3_Max = mapreduce(ds, @maxMapper, @maxReducer,mr);
Power_range_sensor_3_Min = mapreduce(ds, @minMapper, @minReducer,mr);
ds.SelectedVariableNames = {'Power_range_sensor_4'};
Power_range_sensor_4_Mean = mapreduce(ds, @MeanMap, @MeanReduce,mr);
Power_range_sensor_4_Max = mapreduce(ds, @maxMapper, @maxReducer,mr);
Power_range_sensor_4_Min = mapreduce(ds, @minMapper, @minReducer,mr);
ds.SelectedVariableNames = {'Pressure_sensor_1'};
Pressure_sensor_1_Mean = mapreduce(ds, @MeanMap, @MeanReduce,mr);
Pressure_sensor_1_Max = mapreduce(ds, @maxMapper, @maxReducer,mr);
Pressure_sensor_1_Min = mapreduce(ds, @minMapper, @minReducer,mr);
ds.SelectedVariableNames = {'Pressure_sensor_2'};
Pressure_sensor_2_Mean = mapreduce(ds, @MeanMap, @MeanReduce,mr);
Pressure_sensor_2_Max = mapreduce(ds, @maxMapper, @maxReducer,mr);
Pressure_sensor_2_Min = mapreduce(ds, @minMapper, @minReducer,mr);
ds.SelectedVariableNames = {'Pressure_sensor_3'};
Pressure_sensor_3_Mean = mapreduce(ds, @MeanMap, @MeanReduce,mr);
Pressure_sensor_3_Max = mapreduce(ds, @maxMapper, @maxReducer,mr);
Pressure_sensor_3_Min = mapreduce(ds, @minMapper, @minReducer,mr);
ds.SelectedVariableNames = {'Pressure_sensor_4'};
Pressure_sensor_4_Mean = mapreduce(ds, @MeanMap, @MeanReduce,mr);
Pressure_sensor_4_Max = mapreduce(ds, @maxMapper, @maxReducer,mr);
Pressure_sensor_4_Min = mapreduce(ds, @minMapper, @minReducer,mr);
ds.SelectedVariableNames = {'Vibration_sensor_1'};
Vibration_sensor_1_Mean = mapreduce(ds, @MeanMap, @MeanReduce,mr);
Vibration_sensor_1_Max = mapreduce(ds, @maxMapper, @maxReducer,mr);
Vibration_sensor_1_Min = mapreduce(ds, @minMapper, @minReducer,mr);
ds.SelectedVariableNames = {'Vibration_sensor_2'};
Vibration_sensor_2_Mean = mapreduce(ds, @MeanMap, @MeanReduce,mr);
Vibration_sensor_2_Max = mapreduce(ds, @maxMapper, @maxReducer,mr);
Vibration_sensor_2_Min = mapreduce(ds, @minMapper, @minReducer,mr);
ds.SelectedVariableNames = {'Vibration_sensor_3'};
Vibration_sensor_3_Mean = mapreduce(ds, @MeanMap, @MeanReduce,mr);
Vibration_sensor_3_Max = mapreduce(ds, @maxMapper, @maxReducer,mr);
Vibration_sensor_3_Min = mapreduce(ds, @minMapper, @minReducer,mr);
ds.SelectedVariableNames = {'Vibration_sensor_4'};
Vibration_sensor_4_Mean = mapreduce(ds, @MeanMap, @MeanReduce,mr);
Vibration_sensor_4_Max = mapreduce(ds, @maxMapper, @maxReducer,mr);
Vibration_sensor_4_Min = mapreduce(ds, @minMapper, @minReducer,mr);

%displaying data for report
disp('Power_range_sensor_1')
read(Power_range_sensor_1_Mean)
read(Power_range_sensor_1_Max)
read(Power_range_sensor_1_Min)
disp('Power_range_sensor_2')
read(Power_range_sensor_2_Mean)
read(Power_range_sensor_2_Max)
read(Power_range_sensor_2_Min)
disp('Power_range_sensor_3')
read(Power_range_sensor_3_Mean)
read(Power_range_sensor_3_Max)
read(Power_range_sensor_3_Min)
disp('Power_range_sensor_4')
read(Power_range_sensor_4_Mean)
read(Power_range_sensor_4_Max)
read(Power_range_sensor_4_Min)
disp('Pressure_sensor_1')
read(Pressure_sensor_1_Mean)
read(Pressure_sensor_1_Max)
read(Pressure_sensor_1_Min)
disp('Pressure_sensor_2')
read(Pressure_sensor_2_Mean)
read(Pressure_sensor_2_Max)
read(Pressure_sensor_2_Min)
disp('Pressure_sensor_3')
read(Pressure_sensor_3_Mean)
read(Pressure_sensor_3_Max)
read(Pressure_sensor_3_Min)
disp('Pressure_sensor_4')
read(Pressure_sensor_4_Mean)
read(Pressure_sensor_4_Max)
read(Pressure_sensor_4_Min)
disp('Vibration_sensor_1')
read(Vibration_sensor_1_Mean)
read(Vibration_sensor_1_Max)
read(Vibration_sensor_1_Min)
disp('Vibration_sensor_2')
read(Vibration_sensor_2_Mean)
read(Vibration_sensor_2_Max)
read(Vibration_sensor_2_Min)
disp('Vibration_sensor_3')
read(Vibration_sensor_3_Mean)
read(Vibration_sensor_3_Max)
read(Vibration_sensor_3_Min)
disp('Vibration_sensor_4')
read(Vibration_sensor_4_Mean)
read(Vibration_sensor_4_Max)
read(Vibration_sensor_4_Min)

delete(gcp('nocreate'))
%Calculating the mean

%Mapper Function for calculating Mean
function MeanMap(data, info, intermKVStore)
    meanArray = data{:,:}(~isnan(data{:,:}));
    sumLenValue = [sum(meanArray)  length(meanArray)];
    add(intermKVStore, 'PartialMean', sumLenValue);
end


%Reducer Function for calculating Mean
function MeanReduce(intermKey, intermValIter,outKVStore)
    sumLen = [0 0];
    while hasnext(intermValIter)
        sumLen = sumLen + getnext(intermValIter);
    end
    add(outKVStore, 'Mean', sumLen(1)/sumLen(2));
end


%Calculating Maximum

%Mapper Function for calculating Maximum
function maxMapper (data, info, intermKVStore)
  partMax = max(data{:,:});
  add(intermKVStore, 'PartialMax',partMax);
end

%Reducer function for calculating Maximum

function maxReducer(intermKey, intermValIter, outKVStore)
  
  maxVal = -Inf;
  while hasnext(intermValIter)
    maxVal = max(getnext(intermValIter), maxVal);
  end
  % The key-value pair added to outKVStore will become the output of mapreduce 
  add(outKVStore,'Max',maxVal);
end

%Calculating Minimum

%Mapper Function for calculating Maximum
function minMapper (data, info, intermKVStore)
  partMin = min(data{:,:});
  add(intermKVStore, 'PartialMin',partMin);
end

%Reducer function for calculating Maximum

function minReducer(intermKey, intermValIter, outKVStore)
  
  minVal = Inf;
  while hasnext(intermValIter)
    minVal = min(getnext(intermValIter), minVal);
  end
  
  add(outKVStore,'Min',minVal);
end

