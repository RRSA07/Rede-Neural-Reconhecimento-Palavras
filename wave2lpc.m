function c_lpc=wav2lpc(x,p,t_frame); 
%LPCC Acha coeficientes LPCC a partir de coeficientes LPC
%   c_lpcc = coeficientes lpcc
%   c_lpc = coeficientes lpc
%   p_lpcc = ordem lpcc
%   t_frame = tamanho do frame no qual é calculada a autocorrelação

%autocorrelação
    if nargin<3         %se t_frame não especificado, usar para o sinal todo
        t_frame=length(x);
    end
    r=zeros(1,p+1); %inicializa r com zeros
    for m=1:p+1         % m = 0,1,2,...,p, mas como matlab n aceita indice 0, m = 1,2,3,...,p+1
        sum=0; 
        for n=1:t_frame-m+1 
            sum=sum+x(n).*x(n+m-1); %http://aparate.elth.ucv.ro/POPA/Matla/matlabsignal.pdf, p29
        end 
        r(m)=sum; 
    end 
%Levinson-Durbin: valores iniciais
    k=zeros(1,p);     %inicializa k com zeros  
    k(1)=r(2)/r(1);     % k(1) = (r(1+1)-0)/E0 = r(2)/E0 = r(2)/r(1)
    a=zeros(p,p);     %inicializa a com zeros
    a(1,1)=k(1); 
    E=zeros(1,p);     %inicializa E com zeros
    E(1)=(1-k(1)^2)*r(1);   %E(1)=(1-k(1)²)r0, ou seja, E0=r(1), sendo r(1) o primeiro r, r0
%Levinson-Durbin: proximos valores
    for i=2:p 
        c=zeros(1,i); 
        sum=0; 
        for j=1:i-1 
        	sum=sum+(a(i-1,j).*r(i+1-j)); 
        end 
        c(i)=sum; 
        k(i)=(r(i+1)-c(i))/E(i-1);
        a(i,i)=k(i); 
        for j=1:i-1 
            a(i,j)=a(i-1,j)-k(i).*a(i-1,i-j); 
        end 
        E(i)=(1-k(i)^2)*E(i-1);
    end 
%Coeficientes 
    d=zeros(1,p);   %inicializa d com zeros
    for j=1:p 
        d(j)=a(p,j); 
    end 
    c_lpc=d; 
end