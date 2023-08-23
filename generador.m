% Parámetros
M = 1e6;         % Cantidad de muestras
lambda = 1/0.5;    % Parámetro de la distribución exponencial

% Paso 1: Generar muestras uniformes
X = rand(1, M);

% Paso 2: Generar muestras exponenciales usando el método de la transformada inversa
Y = -log(1 - X) / lambda;

% Pregunta 3.1: Calcular el promedio
promedio = mean(Y)

% Pregunta 3.2: Graficar el histograma
binWidth = 0.001;
edges = 0:binWidth:max(Y);
histogram(Y, edges, 'Normalization', 'probability');
xlabel('Valor');
ylabel('Probabilidad');
title('Histograma de Muestras Exponenciales');
grid on;

% Pregunta 3.3:
%'La distribución exponencial se caracteriza por 
% tener una mayor concentración de valores en el extremo 
% izquierdo (valores bajos), mientras que la distribución 
% uniforme tiene una densidad constante en todo el rango de valores. 
% Esto se refleja en la forma del histograma y la concentración de la energía 
% en diferentes partes de la distribución.');

% En la distribución uniforme, la densidad de probabilidad 
% es constante en todo el rango entre 0 y 1, ya que cada valor tiene 
% la misma probabilidad de ser elegido. Por lo tanto, no hay una concentración particular de valores en ninguna parte del rango. Podríamos decir que la energía se distribuye uniformemente a lo largo de la distribución.

%Por otro lado, en la distribución exponencial, la densidad de probabilidad 
% es mayor en los valores más bajos y disminuye a medida que los valores 
% aumentan. Esto significa que hay una concentración más alta
% de valores cerca del origen. En otras palabras, la mayor energía 
% se concentra en los valores más bajos de la distribución exponencial.

%Por lo tanto, notamos que en la distribución exponencial 
% hay una acumulación de valores cerca del origen, mientras que en 
% la distribución uniforme, los valores están uniformemente 
% distribuidos a lo largo del rango de valores. 
