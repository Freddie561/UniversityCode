clc;
clear;

imported_table = 'nuclear_plants_small_dataset.csv';
Imported_Table = readtable(imported_table);

%Data placed in their own tables


Status_of_Data = table2cell(Imported_Table(:,1));
PRS1 = table2cell(Imported_Table(:,2));
PRS2 = table2cell(Imported_Table(:,3));
PRS3 = table2cell(Imported_Table(:,4));
PRS4 = table2cell(Imported_Table(:,5));
PS1 = table2cell(Imported_Table(:,6));
PS2 = table2cell(Imported_Table(:,7));
PS3 = table2cell(Imported_Table(:,8));
PS4 = table2cell(Imported_Table(:,9));
VS1 = table2cell(Imported_Table(:,10));
VS2 = table2cell(Imported_Table(:,11));
VS3 = table2cell(Imported_Table(:,12));
VS4 = table2cell(Imported_Table(:,13));



%Shuffling Data

lengthOfData = height(Imported_Table);
for n = 1: lengthOfData
    randomVar = randi(height(PRS1));
    Random_Status_of_Data(n,1) = Status_of_Data(randomVar,1);
    Status_of_Data(randomVar) = [];
    R_PRS1(n,1) =  PRS1(randomVar,1);
    PRS1(randomVar) = [];
    R_PRS2(n,1) =  PRS2(randomVar,1);
    PRS2(randomVar) = [];
    R_PRS3(n,1) =  PRS3(randomVar,1);
    PRS3(randomVar) = [];
    R_PRS4(n,1) =  PRS4(randomVar,1);
    PRS4(randomVar) = [];
    R_PS1(n,1) =  PS1(randomVar,1);
    PS1(randomVar) = [];
    R_PS2(n,1) =  PS2(randomVar,1);
    PS2(randomVar) = [];
    R_PS3(n,1) =  PS3(randomVar,1);
    PS3(randomVar) = [];
    R_PS4(n,1) =  PS4(randomVar,1);
    PS4(randomVar) = [];
    R_VS1(n,1) =  VS1(randomVar, 1);
    VS1(randomVar) = [];
    R_VS2(n,1) =  VS2(randomVar,1);
    VS2(randomVar) = [];
    R_VS3(n,1) =  VS3(randomVar,1);
    VS3(randomVar) = [];
    R_VS4(n,1) =  VS4(randomVar,1);
    VS4(randomVar) = [];
end


shuffledDataTable = [Random_Status_of_Data(:),R_PRS1(:),R_PRS2(:),R_PRS3(:),R_PRS4(:),R_PS1(:),R_PS2(:),R_PS3(:),R_PS4(:),R_VS1(:),R_VS2(:),R_VS3(:),R_VS4(:)];


%Training and Test Sets

DataLength70 = round(length(R_PRS1) * 0.7);
DataLength30 = (length(R_PRS1) - DataLength70);

for n = 1: DataLength70
    
    TrainingTableData(n,1) =  shuffledDataTable(n,1);
    TrainingTableData(n,2) =  shuffledDataTable(n,2);
    TrainingTableData(n,3) =  shuffledDataTable(n,3);
    TrainingTableData(n,4) =  shuffledDataTable(n,4);
    TrainingTableData(n,5) =  shuffledDataTable(n,5);
    TrainingTableData(n,6) =  shuffledDataTable(n,6);
    TrainingTableData(n,7) =  shuffledDataTable(n,7);
    TrainingTableData(n,8) =  shuffledDataTable(n,8);
    TrainingTableData(n,9) =  shuffledDataTable(n,9);
    TrainingTableData(n,10) =  shuffledDataTable(n,10);
    TrainingTableData(n,11) =  shuffledDataTable(n,11);
    TrainingTableData(n,12) =  shuffledDataTable(n,12);
    
end

next_index = DataLength70 + 1;
length_of_Testing = length(R_PRS1) - DataLength70;

for n = 1: length_of_Testing
    
    
    TestingTableData(n,1) =  shuffledDataTable(next_index,1);
    TestingTableData(n,2) =  shuffledDataTable(next_index,2);
    TestingTableData(n,3) =  shuffledDataTable(next_index,3);
    TestingTableData(n,4) =  shuffledDataTable(next_index,4);
    TestingTableData(n,5) =  shuffledDataTable(next_index,5);
    TestingTableData(n,6) =  shuffledDataTable(next_index,6);
    TestingTableData(n,7) =  shuffledDataTable(next_index,7);
    TestingTableData(n,8) =  shuffledDataTable(next_index,8);
    TestingTableData(n,9) =  shuffledDataTable(next_index,9);
    TestingTableData(n,10) =  shuffledDataTable(next_index,10);
    TestingTableData(n,11) =  shuffledDataTable(next_index,11);
    TestingTableData(n,12) =  shuffledDataTable(next_index,12);
    
    next_index = next_index + 1;
    
end

clear PRS1;
clear PRS2;
clear PRS3;
clear PRS4;
clear PS1;
clear PS2;
clear PS3;
clear PS4;
clear VS1;
clear VS2;
clear VS3;
clear VS4;
clear R_PRS1;
clear R_PRS2;
clear R_PRS3;
clear R_PRS4;
clear R_PS1;
clear R_PS2;
clear R_PS3;
clear R_PS4;
clear R_VS1;
clear R_VS2;
clear R_VS3;
clear R_VS4;









