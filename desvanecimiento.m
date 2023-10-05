% Definir valores de lambda y mu
lambda_values = [0.01, 0.03, 0.1, 0.01, 0.01, 0.01, 0.03, 0.05];
mu_values = [0.02, 0.06, 0.2, 0.03, 0.04, 0.05, 0.05, 0.05];

% Número de casos
n_cases = length(lambda_values);

% Especificar el número máximo de iteraciones
k_max = 250;

% Valor umbral para considerar que la potencia del segundo eigenvalue se ha desvanecido
umbral = 0.0015;

% Iterar sobre cada caso
for i = 1:n_cases
    % Obtener el segundo eigenvalue
    P = [1 - lambda_values(i), mu_values(i); lambda_values(i), 1 - mu_values(i)];
    [~, D] = eig(P);
    eig_2nd = D(2, 2);
    
    % Calcular la potencia del segundo eigenvalue para varios valores de k
    second_eigenvalue_power = eig_2nd .^ (1:k_max);
    
    % Encontrar el primer 'k' donde la potencia cae por debajo del umbral
    desvanecimiento_k = find(second_eigenvalue_power < umbral, 1, 'first');
    
    % Mostrar los resultados o un mensaje si no se encuentra un valor de 'k'
    if isempty(desvanecimiento_k)
        disp(['Caso ' num2str(i) ': No se encontró un valor de k donde la potencia se desvanece.']);
    else
        disp(['Caso ' num2str(i) ': Valor de k donde la potencia se desvanece = ' num2str(desvanecimiento_k)]);
    end
end











