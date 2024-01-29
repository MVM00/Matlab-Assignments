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
p1 = 90;
p2 = -45;
p3 = 72;
p4 = 200;
p0 = 0;

t1 = deg2rad(p1);
t2 = deg2rad(p2);
t3 = deg2rad(p3);
t4 = deg2rad(p4);
% to measure x5 phase
t0 = deg2rad(p0);

% Y axis sequence values
x1 = gencos(x,A,t1);
x2 = gencos(x,A,t2);
x3 = gencos(x,A,t3);
x4 = gencos(x,A,t4);
x5 = x1 + x2 + x3 + x4;
x0 = gencos(x,A,t0);


% Plots
f1 = figure;
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
plot(x,x5);
grid on;

% e
% 1. create the complex amplitudes corresponding to the sinusoids
x1_c = compamp(x1, p1);
x2_c = compamp(x2, p2);
x3_c = compamp(x3, p3);
x4_c = compamp(x4, p4);

% 2. Give the numerical values of z_1, need missing values first:
% 2.2 Find amplitude and phase of x5
% amplitude
x5a = max(x5);
% phase
t5 = acos(dot(x0,x5) / (norm(x0)*norm(x5)));
% phase in degrees
p5 = rad2deg(t5);

% complex amplitudes of x5
x5_c = compamp(x5, p5);

% We already have the polar coordinates form for our sinusoids, given 
% amplitude and phase. For completeness we'll display corresponding 
% complex numbers for every sinusoid then coordinates in polar and
% Cartesian form.

disp('*** Complex number notation ***')
z1 = A*exp(1i*t1);
z2 = A*exp(1i*t2);
z3 = A*exp(1i*t3);
z4 = A*exp(1i*t4);
z5 = A*exp(1i*t5);
disp('x1: ' + string(z1))
disp('x2: ' + string(z2))
disp('x3: ' + string(z3))
disp('x4: ' + string(z4))
disp('x5: ' + string(z5))

disp('*** Polar coordinates (amplitude, phase) ***')
% Polar coordinates, using anonymous function
% https://uk.mathworks.com/help/matlab/matlab_prog/anonymous-functions.html
pc = @(z) [abs(z)  rad2deg(angle(z))]; 
pc1 = pc(z1);
pc2 = pc(z2);
pc3 = pc(z3);
pc4 = pc(z4);
pc5 = pc(z5);
disp('x1 amplitude: ' + string(pc1(1)) + ", phase: " + string(pc1(2)))
disp('x2 amplitude: ' + string(pc2(1)) + ", phase: " + string(pc2(2)))
disp('x3 amplitude: ' + string(pc3(1)) + ", phase: " + string(pc3(2)))
disp('x4 amplitude: ' + string(pc4(1)) + ", phase: " + string(pc4(2)))
disp('x5 amplitude: ' + string(pc5(1)) + ", phase: " + string(pc5(2)))

disp('*** Cartesian coordinates (x, y)) ***')
[x1,y1] = pol2cart(t1, A);
[x2,y2] = pol2cart(t2, A);
[x3,y3] = pol2cart(t3, A);
[x4,y4] = pol2cart(t4, A);
[x5,y5] = pol2cart(t5, A);
disp('x1 (' + string(x1) + ", " + string(y1) + ")")
disp('x2 (' + string(x2) + ", " + string(y2) + ")")
disp('x3 (' + string(x3) + ", " + string(y3) + ")")
disp('x4 (' + string(x4) + ", " + string(y4) + ")")
disp('x5 (' + string(x5) + ", " + string(y5) + ")")

% TODO plot arrows

%f2 = figure;
%x0=-10;
%y0=-10;
%width=550;
%height=400;
%set(gcf,'units','points','position',[x0,y0,width,height]);
%xarr = [0 x1/5];    
%yarr = [0 y1/5];
%annotation('textarrow',xarr,yarr,'String',' x1 ','FontSize',13,'Linewidth',2)
%plot(x1,y1);
%plot(x2,y2);
%plot(x3,y3);
%plot(x4,y4);
%plot(x5,y5);

% f. Verify that x5 = x1 + x2 + x23 + x4 + x5.
% Show a plot of these five complex
% numbers as vectors.


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

function f = compamp(a, p)
% compamp Return the sinusoid complex amplitude
%   Parameters:
%       a: floating point, sinusoid amplitude array 
%       p: floating point, phase in degrees

    f = a * exp(1i * deg2rad(p));
end
