function [x,result] = continuous_convolution(f,g,x)

%CONTINUOUS_CONVOLUTION Numerical approximation of continuous convolution
%
%   [x,result] = continuous_convolution(f,g,x)
%
%   Calculates the convolution of two continuous functions using
%   MATLAB's discrete convolution algorithm.
%
%   Inputs:
%       f - Function handle for first signal
%       g - Function handle for second signal
%       x - Sampling domain
%
%   Outputs:
%       x - Convolution domain
%       result - Numerical convolution result
%
%   Example:
%       f = @(x) exp(-x.^2);
%       g = @(x) double(abs(x)<=2);
%


dx = x(2) - x(1);

signal_f = f(x);
signal_g = g(x);

result = conv(signal_f,signal_g,'same') * dx;

end