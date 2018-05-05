function [ output ] = generate_uncertainty( expre )
% Returns uncertainty expression
    variables = symvar(expre);
    syms output;
    for m = 1:length(variables)
        symbol = variables(m)
        partial_diff = diff(expre,  symbol);
        uncertainty_str = sym(strcat('w_', char(symbol)));
        if( m == 1)
            output = (partial_diff * uncertainty_str)^2;
        else
            output = output + (partial_diff * uncertainty_str)^2;
        end
    end
    output = sqrt(output);
end

