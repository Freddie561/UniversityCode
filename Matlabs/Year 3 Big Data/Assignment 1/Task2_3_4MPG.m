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



A = VT(:,1);

total = 0;
new_total = 0;
SDtotal = 0;
n = 1;
l = 0; %Amount of values
NaN_Length = 0; %Value to divide total by
%Make this a function that can take in any column
%Function for adding all items up (before changing the NaN values)
for n = 1 : length(A)
    
  if ~isnan(A(n,1))
   
      total = total + A(n,1);
      n = n + 1;
      NaN_Length = NaN_Length + 1;
  
  end
end

NaN_mean = total / (NaN_Length - 1);

%Converting all NaN values to the mean 
for n = 1 : length(A)
    
    if isnan(A(n,1))
        A(n,1) = NaN_mean;
        
    end
end
%Recalculating total using new NaN replaced values
for n = 1 : length(A)
    new_total = new_total + A(n,1);
      n = n + 1;
      l = l+1;
    
end
%Recalculating mean using new NaN replaced values
mean = new_total / (n - 1)


%Bubblesort function
num = numel(A);
for j = 0 : num-1
    
    for i = 1: num-j-1
        
        if A(i)>A(i+1)
            
            temp = A(i);
            A(i) = A(i+1);
            A(i+1) = temp;

        end
    end
end

Minimum = A(1,1)
Maximum = A(n-1,1)
Median = A((n-1)/2,1)


SD = {};
% Standard Deviation
 for n = 1 : length(A)
     SD{n,1} = A(n,1) - mean;
     SD{n,1} = SD{n,1}.^2;
     SDtotal = SDtotal + SD{n,1};
 end

Variance = SDtotal / (l-1);


Standard_Deviation = sqrt(Variance)

%Task 4 a

% boxplot(A)
% xlabel('All Vehicles')
% ylabel('Miles per Gallon (MPG)')
% title('Miles per Gallon for All Vehicles')

%Task 4 h

% histogram(A)
% xlabel('MPG')
% ylabel('Frequency')
% title('Miles per Gallon for All Vehicles')








