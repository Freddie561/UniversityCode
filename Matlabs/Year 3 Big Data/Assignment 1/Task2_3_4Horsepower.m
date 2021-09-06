%Each column of the data is placed in its own table for easier management. This script
%works towards completing Task 2,3 and 4. Additionally to ensure the tasks
%can be completed within the same script, the workspace is cleared and only
%the needed columns are imported

clear;
clc;
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


C = VT(:,4);

total = 0;
new_total = 0;
SDtotal = 0;
n = 1;
l = 0;
NaN_Length = 0; %Value to divide total by
%Make this a function that can take in any column
%Function for adding all items up (before changing the NaN values)
for n = 1 : length(C)
    
  if ~isnan(C(n,1))
   
      total = total + C(n,1);
      n = n + 1;
      NaN_Length = NaN_Length + 1;
  
  end
end

NaN_mean = total / NaN_Length


%Converting all NaN values to the mean 
for n = 1 : length(C)
    
    if isnan(C(n,1))
        C(n,1) = NaN_mean;
        
    end
end
%Recalculating total using new NaN replaced values
for n = 1 : length(C)
    new_total = new_total + C(n,1);
      n = n + 1;
      l = l+1;
    
end
%Recalculating mean using new NaN replaced values
mean = new_total / (n - 1)


%Bubblesort function
num = numel(C);
for j = 0 : num-1
    
    for i = 1: num-j-1
        
        if C(i)>C(i+1)
            
            temp = C(i);
            C(i) = C(i+1);
            C(i+1) = temp;
            
        end
    end
end

Minimum = C(1,1)
Maximum = C(n-1,1)
Median = C((n-1)/2,1)


SD = {};
% Standard Deviation
 for n = 1 : length(C)
     SD{n,1} = C(n,1) - mean;
     SD{n,1} = SD{n,1}.^2;
     SDtotal = SDtotal + SD{n,1};
     
 end

Variance = SDtotal / (l-1);

Standard_Deviation = sqrt(Variance)

%Task 4 c

% boxplot(C)
% xlabel('All Vehicles')
% ylabel('Horsepower')
% title('Horsepower for All Vehicles')

%Task 4 j

% histogram(C)
% xlabel('Horsepower')
% ylabel('Frequency')
% title('Horsepower of each Vehicle')
