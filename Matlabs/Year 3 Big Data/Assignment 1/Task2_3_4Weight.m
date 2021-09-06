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

D = VT(:,5);
total = 0;
new_total = 0;
SDtotal = 0;
n = 1;
l = 0;


%Calculating Total
for n = 1 : length(D)
    new_total = new_total + D(n,1);
      n = n + 1;
      l = l+1;
    
end
%Calculating Mean
mean = new_total / l


%Bubblesort function
num = numel(D);
for j = 0 : num-1
    
    for i = 1: num-j-1
        
        if D(i)>D(i+1)
            
            temp = D(i);
            D(i) = D(i+1);
            D(i+1) = temp;
            
        end
    end
end

Minimum = D(1,1)
Maximum = D(n-1,1)
Median = D((n-1)/2,1)
D;

SD = {};
% Standard Deviation
 for n = 1 : length(D)
     SD{n,1} = D(n,1) - mean;
     SD{n,1} = SD{n,1} * SD{n,1};
     SDtotal = SDtotal + SD{n,1};
     n = n + 1;
 end

Variance = SDtotal / (l-1);

Standard_Deviation = sqrt(Variance)

%Task 4 d

% boxplot(D)
% 
% xlabel('All Vehicles')
% ylabel('Weight')
% title('Weight for All Vehicles')

%Task 4 k

% histogram(D)
% xlabel('Weight')
% ylabel('Frequency')
% title('Weight of each Vehicle')
