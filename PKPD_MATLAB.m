# Single Compartment PKPD Model in MATLAB

```
% Absorption
ka = 0.5; 
dose = 100; 
time1 = linspace(0, 10, 100); 
A = dose * (1 - exp(-ka * time1));
% Plot results
figure;
plot(time1, A, 'b-', 'LineWidth', 2);
xlabel('Time (hours)');
ylabel('Amount Absorbed (mg)');
title('Absorption');
grid on;
disp('Time (hours)   Amount Absorbed (mg)');
disp([time1', A']);

% Distribution
ke = 0.2;  
Vd = 10; 
time2 = linspace(0, 24, 100);
C2 = (dose / Vd) * exp(-ke * time2);
% Plot results
figure;
plot(time2, C2, 'b-', 'LineWidth', 2);
xlabel('Time (hours)');
ylabel('Concentration (mg/L)');
title('Distribution');
grid on;
disp('Time (hours)   Concentration (mg/L)');
disp([time2', C2']);
[~, idx_peak2] = max(C2);
peak_conc2 = C2(idx_peak2);
peak_time2 = time2(idx_peak2);
disp(['Peak concentration is ', num2str(peak_conc2), ' mg/L at ', num2str(peak_time2), ' hours.']);

% Metabolism
k = 0.2;
t_max3 = 24;
time3 = linspace(0, t_max3, 100); 
C3 = (dose * ka / (ka - k)) * (exp(-k * time3) - exp(-ka * time3));
% Plot the concentration over time
figure;
plot(time3, C3, 'LineWidth', 2);
xlabel('Time (hours)');
ylabel('Concentration (mg/L)');
title('Metabolism');
grid on;
disp('Time (hours)   Concentration (mg/L)');
disp([time3', C3']);
[~, idx_peak3] = max(C3);
peak_conc3 = C3(idx_peak3);
peak_time3 = time3(idx_peak3);
disp(['Peak concentration is ', num2str(peak_conc3), ' mg/L at ', num2str(peak_time3), ' hours.']);

% Excretion
t_max4 = 24;
time4 = linspace(0, t_max4, 100); 
C4 = dose * exp(-k * time4);
% Plot the concentration over time
figure;
plot(time4, C4, 'LineWidth', 2);
xlabel('Time (hours)');
ylabel('Concentration (mg/L)');
title('Excretion');
grid on;

disp('Time (hours)   Concentration (mg/L)');
disp([time4', C4']);
[~, idx_peak4] = max(C4);
peak_conc4 = C4(idx_peak4);
peak_time4 = time4(idx_peak4);
disp(['Peak concentration is ', num2str(peak_conc4), ' mg/L at ', num2str(peak_time4), ' hours.']);
