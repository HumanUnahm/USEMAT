function [ output ] = generate_clean_uncertainty( expre )
% Returns uncertainty expression
    variables = symvar(expre);
    output = "[";
    for m = 1:length(variables)
        symbol = variables(m);
        partial_diff = diff(expre,  symbol);
        uncertainty_str = sym(strcat('w_', char(symbol)));
        if( m == 1)
            output = strcat(output, '(',char((partial_diff * uncertainty_str)),')^2');
        else
            output = strcat(output, '+(', char((partial_diff * uncertainty_str)),')^2');
        end
    end
    output = strcat(output,']^(1/2)');
end

