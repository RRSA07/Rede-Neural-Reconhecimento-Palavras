function [Cw] = pesa(C,p)
%   Usa o band pass filter dado por wm=[1+(p/2)*sin(pi*m/p)] para encontrar
%   os coeficientes LPCC pesados (weighted LPCC, ou wLPCC)
%       C = Coeficientes LPCC
%       Cw = Coeficientes LPCC pesados
%       p = ordem
    for m=1:p
        Cw(m)=(1+(p/2)*sin(pi*m/p))*C(m);
    end
end

