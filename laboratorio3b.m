% Valores proporcionados
arrival_rate = 25e3; % paquetes por segundo
packet_size = 2000; % bits
bitrate = 100e6; % bits por segundo

% Cálculo del retardo de transmisión
transmission_delay = packet_size / bitrate;
fprintf('El retardo de transmisión de cada paquete es: %.8f segundos\n', transmission_delay);

% Para el proceso CBR
N = 1e6; % Número de llegadas
arrival_times_cbr = linspace(0, (N - 1) / arrival_rate, N);

% Para el proceso Poisson
arrival_times_poisson = exprnd(1 / arrival_rate, 1, N);
arrival_times_poisson = cumsum(arrival_times_poisson);

% Supongamos que tienes una función getDepartureTimes(arrival_times, transmission_delay)
departure_times_cbr = getDepartureTimes(arrival_times_cbr, transmission_delay);
departure_times_poisson = getDepartureTimes(arrival_times_poisson, transmission_delay);

% Supongamos que tienes una función computeOccupancy(arrival_times, departure_times)
[times_cbr, occupancy_cbr] = computeOccupancy(arrival_times_cbr, departure_times_cbr);
[times_poisson, occupancy_poisson] = computeOccupancy(arrival_times_poisson, departure_times_poisson);

% Intervalo de interés
t_start = 1;
t_end = 1.0004;

% Filtrar datos en el intervalo [t_start, t_end]
idx_cbr = times_cbr >= t_start & times_cbr <= t_end;
idx_poisson = times_poisson >= t_start & times_poisson <= t_end;

% Graficar cantidad de paquetes en el sistema para CBR
figure;
stairs(times_cbr(idx_cbr), occupancy_cbr(idx_cbr));
title('Cantidad de Paquetes en el Sistema (CBR)');
xlabel('Tiempo (segundos)');
ylabel('Cantidad de Paquetes');
grid on;

% Graficar cantidad de paquetes en el sistema para Poisson
figure;
stairs(times_poisson(idx_poisson), occupancy_poisson(idx_poisson));
title('Cantidad de Paquetes en el Sistema (Poisson)');
xlabel('Tiempo (segundos)');
ylabel('Cantidad de Paquetes');
grid on;

% Supongamos que tienes las funciones computeSteadyStatePmf(event_times, occupancy)
pmf_steady_state_cbr = computeSteadyStatePmf(times_cbr, occupancy_cbr);
pmf_upon_arrival_cbr = computeUponArrivalPmf(occupancy_cbr);

pmf_steady_state_poisson = computeSteadyStatePmf(times_poisson, occupancy_poisson);
pmf_upon_arrival_poisson = computeUponArrivalPmf(occupancy_poisson);

% Comparar PMFs para CBR
figure;
bar(0:numel(pmf_steady_state_cbr)-1, pmf_steady_state_cbr, 'b');
hold on;
bar(0:numel(pmf_upon_arrival_cbr)-1, pmf_upon_arrival_cbr, 'r');
title('PMF para CBR');
xlabel('Cantidad de Paquetes en el Sistema');
ylabel('Probabilidad');
legend('Steady State', 'Upon Arrival');
grid on;

% Calcular probabilidades de encontrar 0 paquetes en el sistema para CBR
prob_zero_steady_state_cbr = pmf_steady_state_cbr(1);
prob_zero_upon_arrival_cbr = pmf_upon_arrival_cbr(1);

fprintf('Probabilidad de encontrar 0 paquetes en el sistema para CBR (Steady State): %.4f\n', prob_zero_steady_state_cbr);
fprintf('Probabilidad de encontrar 0 paquetes en el sistema para CBR (Upon Arrival): %.4f\n', prob_zero_upon_arrival_cbr);

% Comparar PMFs para Poisson
figure;
bar(0:numel(pmf_steady_state_poisson)-1, pmf_steady_state_poisson, 'b');
hold on;
bar(0:numel(pmf_upon_arrival_poisson)-1, pmf_upon_arrival_poisson, 'r');
title('PMF para Poisson');
xlabel('Cantidad de Paquetes en el Sistema');
ylabel('Probabilidad');
legend('Steady State', 'Upon Arrival');
grid on;

% Calcular probabilidades de encontrar 0 paquetes en el sistema para Poisson
prob_zero_steady_state_poisson = pmf_steady_state_poisson(1);
prob_zero_upon_arrival_poisson = pmf_upon_arrival_poisson(1);

fprintf('Probabilidad de encontrar 0 paquetes en el sistema para Poisson (Steady State): %.4f\n', prob_zero_steady_state_poisson);
fprintf('Probabilidad de encontrar 0 paquetes en el sistema para Poisson (Upon Arrival): %.4f\n', prob_zero_upon_arrival_poisson);

% Comparar PMFs para Poisson
figure;
bar(0:numel(pmf_steady_state_poisson)-1, pmf_steady_state_poisson, 'b');
hold on;
bar(0:numel(pmf_upon_arrival_poisson)-1, pmf_upon_arrival_poisson, 'r');
title('PMF para Poisson');
xlabel('Cantidad de Paquetes en el Sistema');
ylabel('Probabilidad');
legend('Steady State', 'Upon Arrival');
grid on;

% Calcular probabilidades de encontrar 0 paquetes en el sistema para Poisson
prob_zero_steady_state_poisson = pmf_steady_state_poisson(1);
prob_zero_upon_arrival_poisson = pmf_upon_arrival_poisson(1);

fprintf('Probabilidad de encontrar 0 paquetes en el sistema para Poisson (Steady State): %.4f\n', prob_zero_steady_state_poisson);
fprintf('Probabilidad de encontrar 0 paquetes en el sistema para Poisson (Upon Arrival): %.4f\n', prob_zero_upon_arrival_poisson);
