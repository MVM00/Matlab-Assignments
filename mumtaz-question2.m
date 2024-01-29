% Question2

% Generate sequence
% Stepsize in radian
% stepsize=0.01;
% x = -pi/2:stepsize:pi/2;

clear all; close all;
t = -1500:1500; % Generates a time sequence (vector)
fs = 1000; % Defines the sample rate of the signals
x = t/fs;

% Amplitudes and phases
A = 5;
t1 = deg2rad(90);
t2 = deg2rad(-45);
t3 = deg2rad(72);
t4 = deg2rad(200);

% Y axis sequence values
x1 = gencos(x,A,t1);
x2 = gencos(x,A,t2);
x3 = gencos(x,A,t3);
x4 = gencos(x,A,t4);
x5 = x1 + x2 + x3 + x4

% Plots
subplot(5,1,1);
plot(x,x1);
grid on;
subplot(5,1,2);
plot(x,x2);
grid on;
subplot(5,1,3);
plot(x,x3);
grid on;
subplot(5,1,4);
plot(x,x4);
grid on;
subplot(5,1,5);
plot(x,x4);
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