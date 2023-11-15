clc;
clear;
close all;
% Question 1
% A causal LTI system has the following system function
% H = (1-exp(1i*pi/3)*z^-1)*(1-exp(-1i*pi/3)*z^-1)*(1+(1/0.85)*z^-1)/((1-0.9*exp(1i*pi/3)*z^-1)*(1-0.9*exp(-1i*pi/3)*z^-1)*(1+0.85*z^-1));

% (a) Expand the impulse response and plot the pole-zero diagram using Matlab’s zplane function
% and indicate the region of convergence for the system function.
% Hint: Instead of multiplication, you can also use the function conv to multiply the polynomials at
% the denominator and numerator.

% Following the hint, we obtain the coefficients in numerator and denominator with two
% convolution operations:
b = conv(conv([1 -1], [1 -1]),[1 1/0.85])
% b = [1.0000   -0.8235   -1.3529    1.1765]
a = conv(conv([1 -0.9], [1 -0.9]),[1 0.85])
figure()
zplane(b,a)

% region of convergence (ROC), see
% https://www.ee.columbia.edu/~dpwe/e4810/matlab/pezdemo/help/theory.html
% "For a causal system (impulse response h(n) is zero for n< 0), the ROC is the exterior of a circle, including ¥"
% also https://uk.mathworks.com/matlabcentral/answers/276628-how-can-determine-the-region-of-convergence
% here we look at the coefficient of z^-1 to determine region of
% convergence, TODO - decide/define/plot where region of convergion is

% (b) Using Matlab plot the magnitude and phase responses of H(ejw).
figure()
freqz(b,a)

% (c) Plot the group delay of H H(ejw). For the group delay you can use the Matlab function
% grpdelay. You may also numerically derivate the unwrapped phase to obtain the group delay.
figure()
grpdelay(b,a)

% TODO part 1d
