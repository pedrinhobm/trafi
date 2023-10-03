% Parámetros del sistema ON/OFF
a = 0.45;
b = 0.25;

% Construir la matriz de transición P
P = [1 - a, b; a, 1 - b];

% Número de instancias
num_instances = 10000;

% Número de pasos (t=60 segundos, delta_t=0.06 segundos)
num_steps = round(60 / 0.06);

% Estimar la PMF con estima_PMF_on_off_markov_chain
PMF_matrix = estima_PMF_on_off_markov_chain(0, P, num_steps, num_instances);

% Crear vector de tiempo para la estimación de PMF
time_vector_estimation = (0:0.06:(num_steps * 0.06))';

% Calcular la evolución teórica del vector de probabilidad hasta el instante t=60
v_theoretical = zeros(2, num_steps + 1);
v_theoretical(:, 1) = [1,0];

for k = 2:(num_steps + 1)
    v_theoretical(:, k) = P * v_theoretical(:, k - 1);
end

% Crear vector de tiempo para la PMF teórica
time_vector_theoretical = (0:0.06:(num_steps * 0.06))';

% Graficar la evolución de la PMF en una sola gráfica
figure;
hold on;

% Línea continua de color azul para la probabilidad estimada de estar en estado 'OFF'
plot(time_vector_estimation, PMF_matrix(1, :), 'b-', 'LineWidth', 2);

% Cruces de color azul para la PMF teórica de estar en estado 'OFF'
plot(time_vector_theoretical, v_theoretical(1, :), 'bx');

% Línea continua de color rojo para la probabilidad estimada de estar en estado 'ON'
plot(time_vector_estimation, PMF_matrix(2, :), 'r-', 'LineWidth', 2);

% Cruces de color rojo para la PMF teórica de estar en estado 'ON'
plot(time_vector_theoretical, v_theoretical(2, :), 'rx');

% Añadir etiquetas y leyenda
title('Evolución de la PMF vs Tiempo');
xlabel('Tiempo (s)');
ylabel('Probabilidad');
legend('Estimado OFF', 'Teórico OFF', 'Estimado ON', 'Teórico ON');
grid on;
hold off;
