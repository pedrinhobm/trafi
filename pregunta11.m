% Definir valores
k_max = 250; % Puedes ajustar esto según tus necesidades
n_cases = 8; % Número de casos
values = [
    0.01, 0.02;
    0.03, 0.06;
    0.1, 0.2;
    0.01, 0.03;
    0.01, 0.04;
    0.01, 0.05;
    0.03, 0.05;
    0.05, 0.05
];

% Generar evolución de Pk para cada caso
Pk_cases = generate_evolution_Pk(k_max, n_cases, values);

% Graficar la evolución de los componentes de Pk para cada caso
%plot_Pk_cases(n_cases, Pk_cases, k_max, values);

% Definir umbral de convergencia (ajusta según tus necesidades)
convergence_threshold = 1e-5;

% Encontrar valores de k para convergencia
convergence_k = find_convergence_k(Pk_cases, n_cases, convergence_threshold);

% Mostrar los resultados
disp("Valores de k para convergencia:");
disp(convergence_k);


