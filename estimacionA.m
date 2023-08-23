% Generar 100,000 muestras de una variable uniforme entre 0 y 1
num_samples = 100000;
samples = rand(1, num_samples);

% Definir los bordes de los bines con un ancho de bin de 0.001
bin_width = 0.001;
edges = 0:bin_width:1;

% Calcular el histograma utilizando la función histogram()
histogram_values = histogram(samples, edges);

% Graficar el histograma
figure;
stem(histogram_values.BinEdges(1:end-1), histogram_values.Values);
xlabel('Valor del bin');
ylabel('Frecuencia');
title('Histograma de muestras');

% Estimar la PDF a partir de los valores del histograma y el ancho del bin
pdf_estimated = histogram_values.Values / (num_samples * bin_width);

% Graficar el estimado de la PDF
figure;
plot(histogram_values.BinEdges(1:end-1), pdf_estimated);
xlabel('Valor');
ylabel('Estimado de la PDF');
title('Estimado de la PDF a partir del histograma');

% Repetir para 10K y 1M muestras
num_samples_10k = 10000;
samples_10k = rand(1, num_samples_10k);
histogram_values_10k = histogram(samples_10k, edges);
pdf_estimated_10k = histogram_values_10k.Values / (num_samples_10k * bin_width);

num_samples_1m = 1000000;
samples_1m = rand(1, num_samples_1m);
histogram_values_1m = histogram(samples_1m, edges);
pdf_estimated_1m = histogram_values_1m.Values / (num_samples_1m * bin_width);
