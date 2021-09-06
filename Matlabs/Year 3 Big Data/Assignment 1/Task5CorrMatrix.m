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


MPG = VT(:,1); %
Horsepower = VT(:,4); %
Weight = VT(:,5);
Acceleration = VT(:,6);

%Removing NaN values from MPG
l = 0; %Amount of values
NaN_Length = 0; %Value to divide total by
total = 0;
for n = 1 : length(MPG)
    
  if ~isnan(MPG(n,1))
   
      total = total + MPG(n,1);
      n = n + 1;
      NaN_Length = NaN_Length + 1;
  
  end
end

NaN_mean = total / (NaN_Length - 1);

%Converting all NaN values to the mean 
for n = 1 : length(MPG)
    
    if isnan(MPG(n,1))
        MPG(n,1) = NaN_mean;
        
    end
end

%Resetting NaN mean for column B
NaN_mean = 0;
total = 0;

%Removing NaN values from Horsepower
l = 0; %Amount of values
NaN_Length = 0; %Value to divide total by
for n = 1 : length(Horsepower)
    
  if ~isnan(Horsepower(n,1))
   
      total = total + Horsepower(n,1);
      n = n + 1;
      NaN_Length = NaN_Length + 1;
  
  end
end

NaN_mean = total / (NaN_Length - 1);

%Converting all NaN values to the mean 
for n = 1 : length(Horsepower)
    
    if isnan(Horsepower(n,1))
        Horsepower(n,1) = NaN_mean;
        
    end
end

MPGvHorsepower = MatrixCorr(MPG,Horsepower)
MPGvAcceleration = MatrixCorr(MPG,Acceleration)
MPGvWeight = MatrixCorr(MPG,Weight)
HorsepowervAcceleration = MatrixCorr(Horsepower,Acceleration)
HorsepowervWeight = MatrixCorr(Horsepower,Weight)
AccelerationvWeight = MatrixCorr(Acceleration,Weight)

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
for n = 1 : length(y)
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







