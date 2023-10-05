function Pk_cases = generate_evolution_Pk(k_max, n_cases, values)
    Pk_cases = zeros(2,2,k_max,n_cases);
    
    for i = 1:n_cases
        curr_vals = values(i,:);
        lambda = curr_vals(1);
        mu = curr_vals(2);
        P = [1-lambda ,mu; lambda ,1-mu];
        Pk_cases(:,:,1,i) = P;
    
        for j=2:k_max
            Pk_cases(:,:,j,i) = Pk_cases(:,:,j-1,i)*P;
        end
    end
end