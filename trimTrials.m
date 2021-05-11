%Author: Matthew T. Jacobs, 1412611, 1/17/19
%Given a matrix of Gazepoint data, and a vector of start times, this
%function labels the middle X seconds of each trial and deletes unneccesary
%rows


%a = [time, xcoord, ycoord, validity boolean] gazepoint data
%startTimes = [time in seconds each trial starts]
%trialLength = length in seconds of a trial
%tLProcess = # of seconds midtrial to process

%startTimes = [0]; %won't compile unless there is some vector here

%optimize with this:
%find
%min
%m(k:j,:) = [];


function trimmed = trimTrials(a, startTimes, trialLength, tLProcess)

    trialNum = 1; %for labling the trial
    index = 1; %Index for the row in the matrix
    numTrials = size(startTimes); %number of trials recorded
    cut = (trialLength-tLProcess)/2; %# of seconds to cut from start/end of trial
   
    %loops through for each trial
    for i = 1:numTrials
        delete = true;
        while delete %deletes every row up until start time+1 second
            if a(index, 1)<startTimes(i) +cut;
                startTimes(i)+ cut; 
                a(index, :) = [];
            else
                delete = false; 
                add = true;
                while add %adds trial number to 8 seconds of trial
                    if startTimes(i)+(trialLength-cut) < a(index,1)
                        add = false;
                        trialNum = trialNum + 1;
                    else
                        a(index, 5) = trialNum;
                        index = index +1;
                    end
                end
            end
        end
    end
    
    %deletes the extra rows off the end of the matrix
    
    lastIndex = size(a,1);
    a(index:lastIndex, :) = []; 
  
    trimmed = a; 
end




