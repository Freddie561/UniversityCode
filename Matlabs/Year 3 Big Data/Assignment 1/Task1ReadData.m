clear;
clc;

fid = fopen('car_data.txt','r'); %Finds text file

all = {}; %Creation of initial matrix

formatSpec = "%[^=]=%[^;]; "; %Characters to search for

line = fgetl(fid); %Avoids first line as to not inflate data by adding an extra fictitious line

data = fscanf(fid , formatSpec); %Scans text file

NewData = splitlines(data); %splits each by row

Char_Array = string(NewData); %Converts each cell to a string

Test = strsplit(data,{'\t','\r'}); %Splits string by a tab and a new line

TestT = Test'; % Transposing of data

V = reshape(TestT,[9,406]); %Reshaping data to fit to a spreadsheet format

VT = V'; %Another transpose
 
%Try catch for troubleshooting if data format cannot be imported
try
    VT = str2double(VT);
catch ME
    throw(ME);
end

%Closing text file
fclose(fid);

