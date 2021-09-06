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

B = VT(:,6);
total = 0;
new_total = 0;
SDtotal = 0;

l = 0;
n = 0;

%Calculating Total
for n = 1 : length(B)
    new_total = new_total + B(n,1);
      n = n + 1;
      l = l+1;
    
end
%Calculating Mean
mean = new_total / l


%Bubblesort function
num = numel(B);
for j = 0 : num-1
    
    for i = 1: num-j-1
        
        if B(i)>B(i+1)
            
            temp = B(i);
            B(i) = B(i+1);
            B(i+1) = temp;
            
        end
    end
end

Minimum = B(1,1)
Maximum = B(n-1,1)
Median = B((n-1)/2,1)
B;

SD = {};
% Standard Deviation
 for n = 1 : length(B)
     SD{n,1} = B(n,1) - mean;
     SD{n,1} = SD{n,1} * SD{n,1};
     SDtotal = SDtotal + SD{n,1};
     n = n + 1;
 end

Variance = SDtotal / (l-1);

Standard_Deviation = sqrt(Variance)

%Task 4 b

% boxplot(B)
% 
% xlabel('All Vehicles')
% ylabel('Acceleration')
% title('Acceleration for All Vehicles')

%Task 4 i

% histogram(B)
% xlabel('Acceleration')
% ylabel('Frequency')
% title('Acceleration of each Vehicle')

