% Parámetros del sistema ON/OFF
a = 0.45;
b = 0.25;

% Construir la matriz de transición P
P = [1 - a, b; a, 1 - b];

% Estado inicial (vector de probabilidad π0 = [1 0])
v0 = [1; 0];

% Número de pasos
num_steps_1 = round(1.02 / 0.06);  % Intervalo de 0 a 1.02 segundos
num_steps_2 = round(60 / 0.06);     % Intervalo de 0 a 60 segundos

% Calcular la evolución teórica del vector de probabilidad hasta el instante k
vk_theoretical_1 = zeros(2, num_steps_1 + 1);
vk_theoretical_1(:, 1) = v0;
vk_theoretical_2 = zeros(2, num_steps_2 + 1);
vk_theoretical_2(:, 1) = v0;

for k = 2:(num_steps_1 + 1)
    vk_theoretical_1(:, k) = P * vk_theoretical_1(:, k - 1);
end

for k = 2:(num_steps_2 + 1)
    vk_theoretical_2(:, k) = P * vk_theoretical_2(:, k - 1);
end

% Generar muestras utilizando estima_PMF_on_off_markov_chain
num_instances = 1000;
PMF_matrix_1 = estima_PMF_on_off_markov_chain(0, P, num_steps_1, num_instances);
PMF_matrix_2 = estima_PMF_on_off_markov_chain(0, P, num_steps_2, num_instances);

% Crear vector de tiempo
time_vector_theoretical_1 = (0:0.06:(num_steps_1 * 0.06))';
time_vector_theoretical_2 = (0:0.06:(num_steps_2 * 0.06))';

% Crear vector de tiempo para la estimación de PMF
time_vector_estimation_1 = (0:0.06:(num_steps_1 * 0.06))';
time_vector_estimation_2 = (0:0.06:(num_steps_2 * 0.06))';

% Graficar la evolución teórica del estado 'OFF' (0) en azul y el estado 'ON' (1) en rojo
figure;

% Gráfico para el intervalo de 0 a 1.02 segundos
subplot(2, 1, 1);
plot(time_vector_theoretical_1, vk_theoretical_1(1, :), 'b', 'LineWidth', 2);
hold on;
plot(time_vector_estimation_1, PMF_matrix_1(2, :), 'r', 'LineWidth', 2);
title('Evolución de PMF - Intervalo 0 a 1.02 segundos');
xlabel('Tiempo (s)');
ylabel('Probabilidad');
legend('Teórico (OFF)', 'Estimado (ON)');
ylim([0, 1]);
grid on;

% Gráfico para el intervalo de 0 a 60 segundos
subplot(2, 1, 2);
plot(time_vector_theoretical_2, vk_theoretical_2(1, :), 'b', 'LineWidth', 2);
hold on;
plot(time_vector_estimation_2, PMF_matrix_2(2, :), 'r', 'LineWidth', 2);
title('Evolución de PMF - Intervalo 0 a 60 segundos');
xlabel('Tiempo (s)');
ylabel('Probabilidad');
legend('Teórico (OFF)', 'Estimado (ON)');
ylim([0, 1]);
grid on;

