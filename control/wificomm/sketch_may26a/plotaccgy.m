
configureCallback(arduinoObj,"terminator",@off);
delete(arduinoObj)
%% 
length(accxlist)
length(accylist)
length(1:count)
%%
% Plotting the lines
%plot(1:count, acclist*90, 'r-')
%plot(1:count, cumtrapz(-gylist), 'r-')
%plot(1:count, accxlist*90, 'b-', 1:count, cumtrapz(-gyylist), 'r-');

% Adding labels and title
% xlabel('x');
% ylabel('y');
% title(['Plot of Two' ...
%     ' Lines']);
% legend('Line 1', 'Line 2');

plot(ax1, 1:count, accxlist);
title(ax1, "accX");

plot(ax2, 1:count, accylist);
title(ax2, "accY");

plot(ax3, 1:count, gyxlist);
title(ax3, "gyX");


plot(ax4, 1:count, gyylist);
title(ax4, "gyY");

drawnow;


%%
s = serialportlist("available") 


global ax1
global ax2
global ax3
global ax4
figure(1);
subplot(2, 2, 1);  % Example: 2 rows, 1 column, first subplot
ax1 = gca;  % Get handle to the current axes
subplot(2, 2, 2);  % Example: 2 rows, 1 column, second subplot
ax2 = gca;  % Get handle to the current axes

subplot(2, 2, 3);  
ax3 = gca;  
subplot(2, 2, 4);  
ax4 = gca; 

% Set 'limitrate' mode for efficient plotting
set(gcf, 'GraphicsSmoothing', 'off');  % Turn off graphics smoothing
set(gcf, 'Renderer', 'painters');  % Use the 'painters' renderer
set(gcf, 'DoubleBuffer', 'on');  % Enable double-buffering
drawnow limitrate;  % Update the figure window at a limited rate

%% 
global accxlist
global accylist
global acczlist
global gyxlist
global gyylist
global gyzlist
global count
accxlist = []
accylist = []
acczlist = []
gyxlist = []
gyylist = []
gyzlist = []
count = 0
arduinoObj = serialport(s(5),115200)

%%
configureTerminator(arduinoObj,"CR/LF");
flush(arduinoObj);
arduinoObj.UserData = struct("accdata",[], "gydata", [], "Count",1)


%%
% xlabel('x');
% ylabel('y');
% title(['Plot of Two', 'Lines']);
% legend('Line 1', 'Line 2');
% Create figure windows and axes


configureCallback(arduinoObj,"terminator",@readData);

function readData(src, ~)

global accxlist
global accylist
global acczlist
global gyxlist
global gyylist
global gyzlist
global count

% Read the ASCII data from the serialport object.
data = readline(src);



words = split(data);
disp(words)
% disp(words(1))
% disp(words(2))

accxlist(end+1) = str2double(words{1});
accylist(end+1) = str2double(words{2});
acczlist(end+1) = str2double(words{3});
gyxlist(end+1) = str2double(words{4});
gyylist(end+1) = str2double(words{5});
gyzlist(end+1) = str2double(words{6});
count = count +1;


global ax1
global ax2
global ax3
global ax4

% Update plots
% plot(ax1, 1:count, accxlist);
% title(ax1, "accX");
% 
% plot(ax2, 1:count, accylist);
% title(ax2, "accY");
% 
% plot(ax3, 1:count, cumtrapz(-gyxlist));
% title(ax3, "integrate gyX");


drawnow limitrate;  % Refresh the plots

%plot(1:count, acclist*90, 'b-', 1:count, -gylist, 'r-');

% Adding labels and title


% src.UserData.accdata(end+1) = acc;
% src.UserData.gydata(end+1) = gy;
% src.UserData.Count = count +1;

% 
% % Convert the string data to numeric type and save it in the UserData
% % property of the serialport object.
% src.UserData.Data(end+1) = str2double(data);
% 
% % Update the Count value of the serialport object.
% src.UserData.Count = src.UserData.Count + 1;
% 
% % If 1001 data points have been collected from the Arduino, switch off the
% % callbacks and plot the data.
% if src.UserData.Count > 1001
%     configureCallback(src, "off");
%     plot(src.UserData.Data(2:end));
% end
end


function off(src, ~)

configureCallback(src, "off");

end
%% 


