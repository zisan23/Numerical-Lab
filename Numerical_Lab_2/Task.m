% Given Data Points
timex = [0, 6, 12, 18, 24];
tempy = [15, 10, 20, 25, 18];

n = length(timex);

% Divided-Difference Table
div_diff_table = zeros(n, n);
div_diff_table(:, 1) = tempy'; % Assigning first column with temperature values

for j = 2:n
    for i = 1:n-j+1
        div_diff_table(i, j) = (div_diff_table(i+1, j-1) - div_diff_table(i, j-1)) / ...
            (timex(i+j-1) - timex(i));
    end
end

% Display Divided-Difference Table
disp("Divided Difference Table:");
disp(div_diff_table);

% Newton Polynomial Function
function y = newton_polynomial(x, timex, div_diff_table, n)
    y = div_diff_table(1, 1);
    term = 1;
    for i = 2:n
        term = term * (x - timex(i-1));
        y = y + term * div_diff_table(1, i);
    end
end

% Polynomial String Construction (Without Symbolic Variables)
polynomial_terms = {};
for i = 2:n
    term_str = '';
    for j = 1:i-1
        term_str = strcat(term_str, sprintf('(x - %.2f)', timex(j)));
    end
    polynomial_terms{end+1} = sprintf('%.2f * %s', div_diff_table(1, i), term_str); %#ok<*AGROW>
end

disp("Interpolating Polynomial:");
disp(strjoin(polynomial_terms, ' + '));

% Times to Estimate
times_to_estimate = [3, 9, 21];
eval_temp = arrayfun(@(x_val) newton_polynomial(x_val, timex, div_diff_table, n), times_to_estimate);

% Display Evaluation Results
disp("Evaluated Result:");
fprintf("3 a.m.: %.2f°C\n", eval_temp(1));
fprintf("9 a.m.: %.2f°C\n", eval_temp(2));
fprintf("21 p.m.: %.2f°C\n", eval_temp(3));
% Plot the Polynomial
t = linspace(0, 24, 500);
temp_curve = arrayfun(@(x_val) newton_polynomial(x_val, timex, div_diff_table, n), t);

figure;
plot(t, temp_curve, 'b-', 'LineWidth', 1.5);
hold on;
scatter(timex, tempy, 'r', 'filled');
scatter(times_to_estimate, eval_temp, 'g', 'filled');
title('Temperature vs Time');
xlabel('Time (hours)');
ylabel('Temperature (°C)');
legend('Interpolating Polynomial', 'Original Data Points', 'Estimated Temperature', 'Location', 'northeast'); % Explicitly specify a supported location
grid on;
