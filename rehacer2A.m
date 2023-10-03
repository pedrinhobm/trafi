% Inicializar el generador de números aleatorios
rng(20206156);

% Parámetros del sistema ON/OFF para el escenario B
a_values = [0.01, 0.01, 0.01, 0.01];
b_values = [0.02, 0.03, 0.04, 0.05];

% Número de instancias
num_instances = 10000;

% Número de pasos (t=60 segundos, delta_t=0.06 segundos)
num_steps = round(60 / 0.06);

% Estado inicial ON (π0 = [0 1])
initial_state = 1;

% Graficar y analizar el escenario B
figure;
subplot(3, 2, 1);

for i = 1:length(a_values)
    % Construir la matriz de transición P
    P = [1 - b_values(i), a_values(i); b_values(i), 1 - a_values(i)];
    
    % Estimar la PMF con estima_PMF_on_off_markov_chain
    PMF_matrix = estima_PMF_on_off_markov_chain(initial_state, P, num_steps, num_instances);

    % Crear vector de tiempo para la estimación de PMF
    time_vector_estimation = (0:0.06:(num_steps * 0.06))';

    % Calcular la evolución teórica del vector de probabilidad hasta el instante t=60
    v_theoretical = zeros(2, num_steps + 1);
    v_theoretical(:, 1) = [0; 1]; % Iniciar en el estado 'ON'

    for k = 2:(num_steps + 1)
        v_theoretical(:, k) = P * v_theoretical(:, k - 1);
    end

    % Crear vector de tiempo para la PMF teórica
    time_vector_theoretical = (0:0.06:(num_steps * 0.06))';

    % Subgráfica para cada caso del escenario B
    subplot(3, 2, i);
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
    title(['Escenario B - Caso ' num2str(i)]);
    xlabel('Tiempo (s)');
    ylabel('Probabilidad');
    legend('Estimado OFF', 'Teórico OFF', 'Estimado ON', 'Teórico ON');
    grid on;
end

% Añadir título general
annotation('textbox', [0 0.9 1 0.1], 'String', 'Evolución de la PMF vs Tiempo - Escenario B', 'EdgeColor', 'none', 'HorizontalAlignment', 'center', 'FontSize', 14);

