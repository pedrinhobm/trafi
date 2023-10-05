% Definir valores de lambda y mu
lambda_values = [0.01, 0.03, 0.1, 0.01, 0.01, 0.01, 0.03, 0.05];
mu_values = [0.02, 0.06, 0.2, 0.03, 0.04, 0.05, 0.05, 0.05];

% Número de casos
n_cases = length(lambda_values);

% Especificar el número máximo de iteraciones
k_max = 250;

% Llamar a la función para generar las matrices Pk para cada caso
Pk_cases = generate_evolution_Pk(k_max, n_cases, [lambda_values', mu_values']);

% Llamar a la función principal para graficar la evolución del segundo eigenvalue
get_1st_eigvect_and_plot_2nd_eigval_evolution(Pk_cases, k_max, n_cases, [lambda_values', mu_values']);
