% Question1

% Generate sequence
% Stepsize in radian
% stepsize=0.01;
% x = -pi/2:stepsize:pi/2;

clear all; close all;
t = -1500:1500; % Generates a time sequence (vector)
fs = 1000; % Defines the sample rate of the signals
x = t/fs;

% Amplitudes and phases
a1 = 13;
t1 = deg2rad(45);
a2 = 20;
t2 = deg2rad(-30);

% Y axis sequence values
x1 = gencos(x,a1,t1);
x2 = gencos(x,a2,t2);
x3 = x1 + x2;

% Plots
subplot(3,1,1);
plot(x,x1);
grid on;
subplot(3,1,2);
plot(x,x2);
grid on;
subplot(3,1,3);
plot(x,x3);
dim = [0.2 0.5 0.3 0.3];
str = {'Amplitude: 13','Phase 45, 0.125'};
annotation('textbox',dim,'String',str,'FitBoxToText','on');
grid on;

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