%This script uses the read in data function from task 1. 

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

MPG = VT(:,1);
Acceleration = VT(:,6);
Horsepower = VT(:,4);
Weight = VT(:,5);

%Acceleration v MPG (Task E)

% scatter(Acceleration,MPG,'filled')
% xlabel('Acceleration')
% ylabel('MPG')
% title('MPG v Acceleration')
% legend('MPG & Acceleration')

% Horsepower v MPG (Task F)

% scatter(Horsepower,MPG,'filled')
% 
% xlabel('Horsepower')
% ylabel('MPG')
% title('MPG v Horsepower')
% legend('MPG & Horsepower')

% Weight v Horsepower (Task G)

% scatter(Weight,Horsepower,'filled')
% 
% xlabel('Weight')
% ylabel('Horsepower')
% title('Horsepower v Weight')
% legend('Horsepower & Weight')



