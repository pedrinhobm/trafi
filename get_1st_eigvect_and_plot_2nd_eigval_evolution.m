function eigvec_1st = get_1st_eigvect_and_plot_2nd_eigval_evolution(Pk_cases, k_max, n_cases, values)
    k = 1:k_max;
    eigvec_1st = zeros(2,n_cases);

    for i = 1:n_cases
        P = Pk_cases(:,:,1,i);
        [V,D] = eig(P);
        if D(2,2) == 1.0
            eig_2nd = D(1,1);
            eigvec_1st(:,i) = V(:,2);
        else
            eig_2nd = D(2,2);
            eigvec_1st(:,i) = V(:,1);
        end
    
        figure,
        plot(k,eig_2nd.^k),
        grid,
        axis([0 k_max 0 1]),
        xlabel("K"),
        ylabel("Value of 2^{nd} eigenvalue"),
        curr_vals = values(i,:);
        lambda = curr_vals(1);
        mu = curr_vals(2);
        title("Evolution of the 2^{nd} eigenvalue for {\lambda}=" + lambda + " and {\mu}=" + mu);
    end
end
