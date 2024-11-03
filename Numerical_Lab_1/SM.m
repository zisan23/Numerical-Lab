% Define the function
f = @(x) x^3-4*x^2+x+6;
% Range
a = 0;
b = 4;

% Maximum number of iterations
max_iter = 100;

% Initialize variables
iter = 0;
error = inf;
errors = [];
tolerance = 1e-10;

fprintf('Step       Value       Error       \n');

% Secant method iteration
while iter < max_iter && error > tolerance
    % Calculate the next approximation
    c = b - f(b) * (b - a) / (f(b) - f(a));

    % Update error
    error = abs(c - b);
    errors = [errors, error];

    % Update variables for next iteration
    a = b;
    b = c;
    iter = iter + 1;

    fprintf('%d       %f        %f\n', iter, c, error);
end

% Display the result
fprintf('The root of the function using Secant method is approximately: %.6f\n', c);

% Plot step vs. error on a logarithmic scale
figure; % Open a new figure window
semilogy(1:iter, errors, '-o'); % Logarithmic plot for error visualization
xlabel('Step');
ylabel('Log(Error)');
title('Secant Method: Step vs. Log(Error)');
grid on;
