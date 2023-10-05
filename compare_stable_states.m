function compare_stable_states(experimental_stable_state, theoretical_stable_state, values)
    n_cases = size(experimental_stable_state, 2);
    
    figure,
    for i = 1:n_cases
        subplot(n_cases, 1, i),
        bar([experimental_stable_state(:,i), theoretical_stable_state(:,i)]);
        grid;
        axis([0.5 2.5 0 1]);
        ylabel("Probability");
        title("Stable State Comparison for Case " + i + ": {\lambda}=" + values(i,1) + ", {\mu}=" + values(i,2));
        legend({'Experimental P_{OFF}', 'Experimental P_{ON}', 'Theoretical P_{OFF}', 'Theoretical P_{ON}'}, 'Location', 'NorthEast');
    end
    xlabel("Stable States");
end
