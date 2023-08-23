function [puertas_elegidas] = choose_door(num_puertas, puertas_prohibidas_1, puertas_prohibidas_2)
    niter = length(puertas_prohibidas_1);
    puertas_elegidas = zeros(niter, 1);
    for iter = 1:niter
        temp = zeros(1, num_puertas);
        temp(puertas_prohibidas_1(iter)) = 1;
        temp(puertas_prohibidas_2(iter)) = 1;
        index = find(temp == 0);
        ii = randi(length(index));
        puertas_elegidas(iter) = index(ii);
    end
end
