% Define the function
f = @(x) x^2 - 5*x + 6;

% Define the interval [a, b]
a = 0;
b = 6;

% Maximum number of iterations
max_iter = 100;

% Initialize variables
iter = 0;
error = inf;
x_real = 2;

% Bisection method iteration
while iter < max_iter
    c = (a + b) / 2; % Midpoint
    if f(c) == 0
        break; 
    elseif f(a) * f(c) < 0
        b = c; % Root is in [a, c]
    else
        a = c; % Root is in [c, b]
    end
    error = abs(c - x_real);
    iter = iter + 1;
end

error = abs(c - x_real);

% Display the result
fprintf('The root of the function using Bisection method is approximately: %.6f\n', c);
fprintf('Error: %.6f%%\n', error/x_real * 100);
