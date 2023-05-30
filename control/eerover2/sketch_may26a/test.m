figure(1);
subplot(2, 2, 1);  % Example: 2 rows, 1 column, first subplot
ax1 = gca;  % Get handle to the current axes
subplot(2, 2, 2);  % Example: 2 rows, 1 column, second subplot
ax2 = gca;  % Get handle to the current axes

subplot(2, 2, 3);  
ax3 = gca;  
subplot(2, 2, 4);  
ax4 = gca; 

x = 1:100;
data1 = ones(1, 100);  % Example: 100 data points
data2 = zeros(1, 100); 

data1

% Update plots
plot(ax1, x, data1);
title(ax1, "Data 1");

plot(ax2, x, cumtrapz(data1));
title(ax2, "Data 2");

% global myStruct
% myStruct = struct();
% myStruct.field1 = [1, 2, 3];
% myStruct.field2 = 'Hello';
% modifyStruct();
% disp(myStruct)
% 
% function modifyStruct()
% 
%     global myStruct
%     % Modify the structure's field
%     myStruct.field1(1) = 100;
% 
%     % Create a new field
%     myStruct.field3 = 'New field';
% 
% end