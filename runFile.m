
%Enter two pieces of information here:
%1)put the csv file here: Ex: "MJ_all_gaze.csv"; 
fileName = "---"; %Edit here

%2)add your start times here. (copy and paste seconds)
%Ex: [121, 240, 300, ...ect];
[startTimes ] = [---]; %Edit here


%No need to touch anything below here:
%--------------------------------------------------------------------------
m1 = xlsread(fileName, 'D:D');
m2 = xlsread(fileName, 'L:L');
m3 = xlsread(fileName, 'M:M');
m4 = xlsread(fileName, 'N:N');

m = [m1 m2 m3 m4];

a = inRout(trimTrials(m,startTimes,10,8));

propFix = [];

for t=1:size(startTimes)
    k = find(a(:,5)==t);
    
    %column one: % per trial of inside circle
    %column two: % per trial that it was valid
    propFix(t,1) = mean(a(k,6));
    propFix(t,2) = mean(a(k,4));
    
    k = find(a(:,5)==t && a(:,4)==1);
    propFix(t,3) = mean(a(k,6));
    
end



%write and save files

%build file names
intials = extractBetween(fileName, 1, 2);
saveFile = intials + "_proccessed_gaze_data.xlsx";
percentFile = intials + "_percent_inRout_trials.xlsx";

%saving files
headers1 = ['time','x','y','artifact','trialNum','inRout'];


xlswrite(saveFile,a);

xlswrite(percentFile, propFix); 
