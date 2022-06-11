function [NA]=normaliza(A,limite_inferior,limite_superior)
%   NA = vetor normalizado
R = [limite_inferior limite_superior];
dR = diff( R );

NA =  A - min( A(:)); % set range of A between [0, inf)
NA =  NA ./ max( NA(:)) ; % set range of A between [0, 1]
NA =  NA .* dR ; % set range of A between [0, dRange]
NA =  NA + R(1); % shift range of A to R
end