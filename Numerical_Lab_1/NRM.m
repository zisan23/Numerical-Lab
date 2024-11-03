% Define the function
f = @(x) x^3-4*x^2+x+6;

% Define the derivative of the function
df = @(x)3*x^2-8*x+1;


% Initial guess
x0 = 0;

% Maximum number of iterations
max_iter = 20;
tolerance = 1e-6;

% Initialize variables
x = x0;
iter = 0;
error = inf;
errors = [];

fprintf('Step       Value       Error       \n');

% Newton-Raphson iteration
while iter < max_iter && error > tolerance
    x_new = x - f(x) / df(x);
    error = abs(x_new - x);
    errors = [errors, error];
    x = x_new;
    iter = iter + 1;
    fprintf('%d       %f        %f\n', iter, x, error);
end

% Display the result
fprintf('The root of the function using Newton-Raphson method is approximately: %.6f\n', x);
fprintf('Error (last step): %.6f\n', error);
fprintf('The number of iterations: %d\n', iter);

% Plot step vs. error on a logarithmic scale
figure; % Open a new figure window
semilogy(1:iter, errors, '-o'); % Plot with log scale for y-axis
xlabel('Step');
ylabel('Log(Error)');
title('Newton-Raphson Method: Step vs. Log(Error)');
grid on;
