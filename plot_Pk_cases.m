function plot_Pk_cases(n_cases, Pk_cases, k_max, values)
    for i =  1:n_cases
        P11 = Pk_cases(1,1,:,i);
        P11 = squeeze(P11);
        P21 = Pk_cases(2,1,:,i);
        P21 = squeeze(P21);
        P12 = Pk_cases(1,2,:,i);
        P12 = squeeze(P12);
        P22 = Pk_cases(2,2,:,i);
        P22 = squeeze(P22);
        figure, 
        plot(P11, 'go'),
        hold,
        plot(P12, 'r--'),
        plot(P21, 'b'),
        plot(P22, 'kx'),
        grid,
        axis([0 k_max 0 1]),
        xlabel("K"),
        ylabel("Values"),
        curr_vals = values(i,:);
        lambda = curr_vals(1);
        mu = curr_vals(2);
        title("Case " + i + ": {\lambda}=" + lambda + " and {\mu}=" + mu),
        legend({'P11','P12','P21','P22'});
    end
end