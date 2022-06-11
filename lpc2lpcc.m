function c_lpcc=lpc2lpcc(c_lpc,p_lpcc)
%LPCC Acha coeficientes LPCC a partir de coeficientes LPC
%   c_lpcc = coeficientes lpcc
%   c_lpc = coeficientes lpc
%   p_lpcc = ordem lpcc
    p_lpc=length(c_lpc);   %ordem lpc
    c_lpcc=zeros(1,p_lpcc); 
    c_lpcc(1)=c_lpc(1); 
    for m=2:p_lpc          % recursão para 1<=m<=p, no matlab, c_lpcc(1)=c0, e c_lpcc(2)=c1, logo, começa-se em 2
    	for k=1:m-1 
           c_lpcc(m)=c_lpc(m)+c_lpc(k)*c_lpcc(m-k)*(m-k)/m; 
        end 
    end 
    for m=p_lpc+1:p_lpcc   % recursão para m>p, ou seja, lpcc de ordem > que a do lpc que o origina
        for k=1:p_lpc 
            c_lpcc(m)=c_lpc(k)*c_lpcc(m-k)*(m-k)/m; 
        end 
    end 
    c_lpcc=-c_lpcc; 
end
