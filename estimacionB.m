% Paso 1: Generar M muestras uniformes entre 0 y 1
M = 10; % Cambiar a 10000 para 10K muestras o 1000000 para 1M muestras
samples = rand(1, M);

% Paso 2: Calcular y graficar el histograma
binWidth = 0.001;
edges = 0:binWidth:1;
histogram(samples, edges);
title('Histograma de Muestras Uniformes');
xlabel('Valor');
ylabel('Frecuencia');

% Paso 3: Relación entre el histograma y la probabilidad
% La probabilidad de que la VA caiga en un bin dado es proporcional a la altura del bin en el histograma.



% La relación entre los histogramas y la probabilidad de que VA se encuentre dentro de un cierto rango se basa en 
% la idea de que la altura de cada barra en el histograma está relacionada con la frecuencia de las muestras que se 
% encuentran dentro de ese rango. Cuanto más alta sea la barra, más muestras estarán dentro de este rango de valores. 
% La probabilidad de que VA aterrice en ese contenedor en particular es proporcional a la altura de la barra.

% Paso 4: Estimado de la PDF
pdf_estimated = histcounts(samples, edges, 'Normalization', 'pdf');
bin_centers = edges(1:end-1) + binWidth/2;
figure;
stem(bin_centers, pdf_estimated);
title('Estimado de la PDF');
xlabel('Valor');
ylabel('PDF Estimada');

% Paso 5: Repetir para diferentes cantidades de muestras
M_values = [10000, 1000000];
for i = 1:length(M_values)
    M = M_values(i);
    samples = rand(1, M);
    
    % Calcular y graficar el histograma
    figure;
    histogram(samples, edges);
    title(['Histograma de Muestras Uniformes - M = ' num2str(M)]);
    xlabel('Valor');
    ylabel('Frecuencia');
    
    % Estimado de la PDF
    pdf_estimated = histcounts(samples, edges, 'Normalization', 'pdf');
    figure;
    stem(bin_centers, pdf_estimated);
    title(['Estimado de la PDF - M = ' num2str(M)]);
    xlabel('Valor');
    ylabel('PDF Estimada');
end

