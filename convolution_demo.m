%% Continuous Signal Convolution
%
% Numerical approximation of the continuous convolution integral
%
% (f * g)(x) = ∫ f(t) g(x - t) dt
%
% using MATLAB's discrete conv() function and the sampling interval.
%
% Author : Mohammadreza Abdolmaleki
% Date   : August 2026


%% Initialization

clc
clear
close all

%% Signal Definitions
% Define input signals


x = -10:0.01:10;



%% Define input functions

f = @(x) double(abs(x)<=1);
g = @(x) double(abs(x)<=3);


%% Evaluate input functions

signal_f = f(x);
signal_g = g(x);


%% Numerical Convolution
[x,result] = continuous_convolution(f,g,x);

%% Visualization
figure(...
    'Color','w',...
    'Position',[100 100 1200 400]);

subplot(1,3,1)
plot(x,signal_f,...
    'r',...
    'LineWidth',1.5)
title('Signal f(x)')
%xlim([-7 7])
xticks(-5:1:5)
xlabel('x')
ylabel('Amplitude')
grid on
grid minor

subplot(1,3,2)
plot(x,signal_g,...
    'b',...
    'LineWidth',1.5)
title('Signal g(x)')
%xlim([-7 7])
xticks(-5:1:5)
xlabel('x')
ylabel('Amplitude')
grid on
grid minor

subplot(1,3,3)
plot(x, result,...
    'k',...
    'LineWidth',2)
title('Convolution f(x) * g(x)')
%xlim([-5 5])
xticks(-5:1:5)
xlabel('x')
ylabel('Amplitude')
grid on
grid minor


%% Export Figure

if ~isfolder('figures')
    mkdir('figures')
end

exportgraphics(gcf,...
    'figures/convolution_result.png',...
    'Resolution',300)