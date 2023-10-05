% Definir valores de lambda y mu
lambda_values = [0.01, 0.03, 0.1, 0.01, 0.01, 0.01, 0.03, 0.05];
mu_values = [0.02, 0.06, 0.2, 0.03, 0.04, 0.05, 0.05, 0.05];

% Número de casos
n_cases = length(lambda_values);

% Valores de k para verificar
k_values = [5, 10, 20, 40, 80, 120];

for i = 1:n_cases
    % Crear la matriz de transición P para el caso actual
    lambda = lambda_values(i);
    mu = mu_values(i);
    P = [1 - lambda, mu; lambda, 1 - mu];
    
    % Calcular eigenvalues y eigenvectors
    [V, D] = eig(P);
    
    disp(['Caso ' num2str(i)]);
    
    % Imprimir encabezado de la tabla
    fprintf('%-6s %-15s %-45s %-45s %-15s\n', 'k', 'VD^kV^{-1}', 'P^k');
    
    % Verificar VD^kV^{-1} es igual a P^k para varios valores de k
    for k = k_values
        result = V * (D^k) * inv(V);
        Pk = P^k;
        
        % Verificar si son iguales (considerando la tolerancia numérica)
        verified = isequal(round(result, 4), round(Pk, 4));
        
        % Imprimir resultados en forma de tabla
        fprintf('%-6d %-15s %-45s %-45s %-15s\n', k, mat2str(result,4), mat2str(Pk,4), mat2str(verified), '------------------------');
    end
    
    disp('==============================');
end
