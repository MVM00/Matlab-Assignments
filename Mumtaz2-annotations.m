% Question_1

% Generate sequence
% Stepsize in radian
% stepsize=0.01;
% x = -pi/2:stepsize:pi/2;

clear all; close all;
t = -1500:1500; % Generates a time sequence (vector)
fs = 1000; % Defines the sample rate of the signals
x = t/fs;

% Amplitudes and phases
A1 = 13;
A2 = 20;
t1 = deg2rad(45);
t2 = deg2rad(-30);

% Y axis sequence values
x1 = gencos(x,A1,t1);
x2 = gencos(x,A2,t2);
x3 = x1 + x2
disp(max(x3));
% Plots
a(1) = subplot(3,1,1);
annotation('textbox','String',"Annotation 1",'Position',a(1).Position,'Vert','bottom','FitBoxToText','on')
plot(x,x1);
grid on;
a(2) = subplot(3,1,2);
annotation('textbox','String',"Annotation 2",'Position',a(2).Position,'Vert','bottom','FitBoxToText','on')
plot(x,x2);
grid on;
a(3) = subplot(3,1,3);
%annotation('textbox','String',"Magnitude measured by taking maximum value of sine wave",'Position',a(3).Position,'Vert','bottom','FitBoxToText','on')
xarr = [0.70 0.78];    % adjust length and location of arrow 
yarr = [0.25 0.325];      % adjust hieght and width of arrow
annotation('textarrow',xarr,yarr,'String',[' Magnitude max(x3) = ' num2str(max(x3))],'FontSize',13,'Linewidth',2)
plot(x,x3);
grid on;
%subplot(5,1,4);
%plot(x,x4);
%grid on;
%subplot(5,1,5);
%plot(x,x4);
%grid on;

function f = gencos(x,a,t)
% gencos  Generate a cosine waveform.
%   Parameters:
%       x: floating point, number sequence
%       a: integer, wave amplitude
%       t: floating point, phase degree in radians
%   Output:
%       f: floating point, y values for corresponding input sequence x
%   Example:
%       stepsize=0.01;
%       x = -pi/2:stepsize:pi/2;
%       a1 = 13;
%       t1 = deg2rad(45);
%       a2 = 20;
%       t2 = deg2rad(-30);
%       x1 = gencos(x,a1,t1);
%       plot(x,x1);
%       grid on;

    f = a * cos(2 * pi * x + t);
end
