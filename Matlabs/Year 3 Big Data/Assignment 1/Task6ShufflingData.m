%RUNNING THIS SCRIPT WILL OVERWRITE THE ALREADY SHUFFLED DATA THAT IS USED
%WITHIN THE REPORT
clear;
clc;

%Import Data
fid = fopen('car_data.txt','r'); 
all = {};
formatSpec = "%[^=]=%[^;]; ";
line = fgetl(fid);
data = fscanf(fid , formatSpec);
NewData = splitlines(data);
Char_Array = string(NewData);
Test = strsplit(data,{'\t','\r'});
TestT = Test';
V = reshape(TestT,[9,406]);
VT = V';
try
    VT = str2double(VT);
catch ME
    throw(ME);
end


MPG = VT(:,1);
Acceleration = VT(:,6);
Horsepower = VT(:,4);
Weight = VT(:,5);


%Removing NaN Values

%Removing NaN values from MPG
mpg_total = 0;
l = 0; %Amount of values
NaN_Length = 0; %Value to divide total by
for n = 1 : length(MPG)
    
  if ~isnan(MPG(n,1))
   
      mpg_total = mpg_total + MPG(n,1);
      n = n + 1;
      NaN_Length = NaN_Length + 1;
  
  end
end

NaN_mean = mpg_total / (NaN_Length - 1);

%Converting all NaN values to the mean 
for n = 1 : length(MPG)
    
    if isnan(MPG(n,1))
        MPG(n,1) = NaN_mean;
        
    end
end

%Removing NaN values from MPG
horse_total = 0;
l = 0; %Amount of values
NaN_Length = 0; %Value to divide total by
for n = 1 : length(Horsepower)
    
  if ~isnan(Horsepower(n,1))
   
      horse_total = horse_total + Horsepower(n,1);
      n = n + 1;
      NaN_Length = NaN_Length + 1;
  
  end
end

NaN_mean = horse_total / (NaN_Length - 1);

%Converting all NaN values to the mean 
for n = 1 : length(Horsepower)
    
    if isnan(Horsepower(n,1))
        Horsepower(n,1) = NaN_mean;
        
    end
end

%Shuffling Data

randAcc = {};
randMPG = {};
randHorse = {};
randWeight = {};
lengthOfA = length(MPG);
for n = 1: lengthOfA
    randomVar = randi(length(MPG));
    randAcc{n,1} = Acceleration(randomVar,1);
    randMPG{n,1} = MPG(randomVar,1);
    randHorse{n,1} = Horsepower(randomVar,1);
    randWeight{n,1} = Weight(randomVar,1);
    Acceleration(randomVar) = [];
    MPG(randomVar) = [];
    Horsepower(randomVar) = [];
    Weight(randomVar) = [];
end
randAcc = cell2mat(randAcc);
randMPG = cell2mat(randMPG);
randHorse = cell2mat(randHorse);
randWeight = cell2mat(randWeight);

%Training and Test Sets

DataLength70 = round(lengthOfA * 0.7);

TrainingSetAcc = {};
TrainingSetMPG = {};
TrainingSetHorse = {};
TrainingSetWeight = {};
TestSetAcc = {};
TestSetMPG = {};
TestSetHorse = {};
TestSetWeight = {};



for n = 1: DataLength70
    
    TrainingSetAcc{n,1} = randAcc(n,1);
    TrainingSetMPG{n,1} = randMPG(n,1);
    TrainingSetHorse{n,1} = randHorse(n,1);
    TrainingSetWeight{n,1} = randWeight(n,1);
    
end


DataLength30 = lengthOfA - DataLength70;
n = DataLength70 + 1;

for n = 1: DataLength30
    
    TestSetAcc{n,1} = randAcc(n,1);
    TestSetMPG{n,1} = randMPG(n,1);
    TestSetHorse{n,1} = randHorse(n,1);
    TestSetWeight{n,1} = randWeight(n,1);
    
end

%Data need to be converted to doubles

TrainingSetAcc = cell2mat(TrainingSetAcc);
TrainingSetMPG = cell2mat(TrainingSetMPG);
TrainingSetHorse = cell2mat(TrainingSetHorse);
TrainingSetWeight = cell2mat(TrainingSetWeight);

TestSetAcc = cell2mat(TestSetAcc);
TestSetMPG = cell2mat(TestSetMPG);
TestSetHorse = cell2mat(TestSetHorse);
TestSetWeight = cell2mat(TestSetWeight);




