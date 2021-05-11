%Author: Matthew T. Jacobs, 1412611, 1/17/19
%Given a matrix of Gazepoint data, checks if gaze is in or out of a target
%circle

% a = [time, xcoord, ycoord, validity boolean, trial number]
%a is cut down from all gaze to the 8 center seconds of each trial

function matrix = inRout(a)

    % cirle defined as r = 20, and its scalled 4.5 times. Radius is in pixels
    radius = 20*4.5;

    % screen is 1680 X 1050
    centerX = 840;
    centerY = 525;

    %adds a boolean value to each row saying in our out of circle
    %There is a buffer given so that it counts viewpoints as in the circle up
    %to 5 pixels further. 
    for i = 1:length(a)
    
        % xcoordinate of eye gaze scaled up from gazepoint to screen
        xcoord = a(i,2)*1680;
        % same idea 
        ycoord = a(i,3)*1050;
    
        inValue = sqrt((centerX-xcoord)^2+(centerY-ycoord)^2)<= radius +5;
    	a(i,6) = inValue;
        
    end
    matrix = a;
end