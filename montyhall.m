% Definición de parámetros
num_experimentos = 1000000;  % Número de veces que se simula el concurso
num_puertas = 5;             % Número total de puertas
puertas_prohibidas_1 = 1;    % El concursante elige siempre la puerta 1
puertas_prohibidas_2 = [1, X]; % Puertas prohibidas para el presentador

% Inicialización de contadores
contador_z2 = 0;
contador_xk_z2 = zeros(1, num_puertas);

% Simulación del concurso
for experimento = 1:num_experimentos
    % Definición de X y Y (sorteo aleatorio)
    X = randi(num_puertas);
    Y = 1;
    
    % Definición de Z utilizando la función choose_door.m
    Z = choose_door(num_puertas, puertas_prohibidas_1, puertas_prohibidas_2);
    
    % Conteo de veces que se abre la puerta 2 (Pregunta 1.3)
    if Z == 2
        contador_z2 = contador_z2 + 1;
        % Conteo de veces que el premio estaba en la puerta k y se abrió la puerta 2 (Pregunta 1.4)
        if X == 2
            contador_xk_z2(X) = contador_xk_z2(X) + 1;
        end
    end
end

% Cálculo de probabilidades (Pregunta 1.5)
prob_xk_z2 = contador_xk_z2 / contador_z2;
prob_z2 = contador_z2 / num_experimentos;

% Gráfica de la PMF a priori (Pregunta 1.2)
pmf_priori = ones(1, num_puertas) * 0.2;
stem(1:num_puertas, pmf_priori);
title('PMF a priori de la ubicación del premio');
xlabel('Número de puerta');
ylabel('Probabilidad');

% Gráfica de la PMF a posteriori (Pregunta 1.5)
figure;
stem(1:num_puertas, prob_xk_z2);
title('PMF a posteriori de la ubicación del premio dado Z=2');
xlabel('Número de puerta');
ylabel('Probabilidad');
