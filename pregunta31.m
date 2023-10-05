% Definir valores de lambda y mu
lambda_values = [0.01, 0.03, 0.1, 0.01, 0.01, 0.01, 0.03, 0.05];
mu_values = [0.02, 0.06, 0.2, 0.03, 0.04, 0.05, 0.05, 0.05];

% Número de casos
n_cases = length(lambda_values);

% Valores de k para verificar
k_values = [5, 10, 20, 40, 80, 120];

% Inicializar matrices para almacenar resultados
prob_ratio_results = zeros(n_cases, 1);
theoretical_probabilities = zeros(2, n_cases);

for i = 1:n_cases
    lambda = lambda_values(i);
    mu = mu_values(i);
    
    % Crear la matriz de transición P para el caso actual
    P = [1 - lambda, lambda; mu, 1 - mu];
    
    % Calcular eigenvalues y eigenvectors
    [V, D] = eig(P);
    
    % Tomar la diagonal de eigenvalues
    eigenvalues = diag(D);
    
    % Encontrar el índice del eigenvalue '1'
    index_eigenvalue_1 = find(round(eigenvalues, 10) == 1, 1);
    
    % Obtener el eigenvector asociado al eigenvalue '1'
    eigvec_1st = V(:, index_eigenvalue_1);
    
    % Calcular las probabilidades teóricas en estado estable usando potencias de la matriz diagonal de eigenvalues
    pi_off = eigvec_1st(1) / sum(eigvec_1st);
    pi_on = eigvec_1st(2) / sum(eigvec_1st);
    
    % Almacenar el cociente y las probabilidades teóricas
    prob_ratio_results(i) = pi_off / pi_on;
    theoretical_probabilities(:, i) = [pi_off; pi_on];
end

% Mostrar los resultados
disp('Cociente de probabilidad (pi_off / pi_on) para cada caso:');
disp(prob_ratio_results);

disp('Probabilidades teóricas en estado estable para cada caso:');
disp(theoretical_probabilities);
