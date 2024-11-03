% Define the function
f = @(x) x^3 - 4 * x^2 + x + 6;

% Define the derivative of the function for Newton-Raphson
df = @(x) 3 * x^2 - 8 * x + 1;

% Parameters
max_iter = 100;
tolerance = 1e-10;

% ----------------------
% Newton-Raphson Method
% ----------------------
x0 = 0; % Initial guess
x = x0;
iter = 0;
error = inf;
errors_newton = []; % Array to store errors for Newton-Raphson

while iter < max_iter && error > tolerance
    x_new = x - f(x) / df(x);
    error = abs(x_new - x);
    errors_newton = [errors_newton, error]; % Store the error
    x = x_new;
    iter = iter + 1;
end
n_iter_newton = iter; % Number of iterations for Newton-Raphson

% ----------------------
% Secant Method
% ----------------------
a = 0; % Initial guess a
b = 4; % Initial guess b
iter = 0;
error = inf;
errors_secant = []; % Array to store errors for Secant method

while iter < max_iter && error > tolerance
    c = b - f(b) * (b - a) / (f(b) - f(a));
    error = abs(c - b);
    errors_secant = [errors_secant, error]; % Store the error
    a = b;
    b = c;
    iter = iter + 1;
end
n_iter_secant = iter; % Number of iterations for Secant method

% ----------------------
% Plotting the Errors
% ----------------------
figure;
semilogy(1:n_iter_newton, errors_newton, '-o', 'DisplayName', 'Newton-Raphson'); % Plot Newton-Raphson errors
hold on;
semilogy(1:n_iter_secant, errors_secant, '-x', 'DisplayName', 'Secant'); % Plot Secant errors
xlabel('Step');
ylabel('Log(Error)');
title('Comparison of Error Convergence: Newton-Raphson vs. Secant');
legend('show'); % Show legend to distinguish methods
grid on;
hold off;

