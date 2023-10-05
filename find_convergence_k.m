function convergence_k = find_convergence_k(Pk_cases, n_cases, convergence_threshold)
    convergence_k = zeros(1, n_cases);

    for i = 1:n_cases
        Pk = Pk_cases(:,:,:,i);
        
        for k = 2:size(Pk, 3)
            column_sum_diff = sum(abs(Pk(:,1,k) + Pk(:,2,k) - Pk(:,1,k-1) - Pk(:,2,k-1)));

            if column_sum_diff < convergence_threshold
                convergence_k(i) = k;
                break;
            end
        end
    end
end
