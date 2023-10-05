function plot_experimental_and_theoretical_stable_state(Pk_cases, n_cases, eigvec_1st_cases, init_state)
    Pk_stable_cases = zeros(2,2,n_cases);
    experimental_stable_state = zeros(2,n_cases);
    theorical_stable_state = zeros(2,n_cases);
    
    for i = 1:n_cases
        Pk_stable_cases(:,:,i) = Pk_cases(:,:,250,i);
        Pk_stable = Pk_stable_cases(:,:,i);
        % Ref: https://timeseriesreasoning.com/contents/introduction-to-discrete-time-markov-processes/
        experimental_stable_state(:,i) = init_state*Pk_stable';
        eigvec_1st = eigvec_1st_cases(:,i);
        theorical_stable_state(:,i) = eigvec_1st/sum(eigvec_1st);
    end
    
    figure,
    plot(1:n_cases,theorical_stable_state(1,:),'r^'),
    hold,
    plot(1:n_cases,theorical_stable_state(2,:),'md'),
    plot(1:n_cases,experimental_stable_state(1,:),'co'),
    plot(1:n_cases,experimental_stable_state(2,:),'gx'),
    grid,
    axis([1 n_cases 0 1]),
    xlabel("Cases"),
    ylabel("Probability"),
    title("Probability in Stable State with initial state P_{OFF}=" + init_state(1) + " and P_{ON}=" + init_state(2)),
    legend({'Theoretical P_OFF','Theoretical P_ON','Experimental P_OFF','Experimental P_ON'}, 'Location','NorthWest');
end