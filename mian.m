% Parámetros
k_max = 250;
n_cases = 8;
init_state = [0.5; 0.5];
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

% Generar evolución Pk
Pk_cases = generate_evolution_Pk(k_max, n_cases, values);

% Obtener 1er eigenvector y graficar 2do eigenvalue
eigvec_1st_cases = get_1st_eigvect_and_plot_2nd_eigval_evolution(Pk_cases, k_max, n_cases, values);

% Plotear probabilidades estacionarias teóricas y experimentales
plot_experimental_and_theoretical_stable_state(Pk_cases, n_cases, eigvec_1st_cases, init_state);
