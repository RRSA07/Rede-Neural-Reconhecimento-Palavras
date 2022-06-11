clear all
clc
load('audio.mat');
Fs=11025;
dur_frame=0.02; %0.02s=20ms
tam_f=floor(dur_frame*Fs);
for i=1:length(waves)
    z = wavread(waves(i,:));   
    z = filter([1 -0.97],1,z);  %preenfase
    pos=1;
    while(pos+tam_f<=length(z)) %enquanto ainda houver sinal
        frame=z(pos:pos+tam_f-1);   %divide o frame
        y=frame.*hamming(tam_f);    %aplica janela no frame
        c_lpc=wave2lpc(y,16);        %acha coeficientes lpc do frame
        c_lpcc=lpc2lpcc(c_lpc,16); %calcula coeficientes lpcc do frame, começa em 2 pois 1 = ganho
        c_wlpcc=pesa(c_lpcc,16);%pesa coeficientes lpcc do frame
        coef(pos,:)=c_wlpcc;    %gera matriz de características
        pos=pos+tam_f/2;        %proximo frame, overlap 50%
    end
    Coef(i,:)=mean(coef);   %coeficientes de cada amostra = média da matriz de características dessa amostra
end
Coef=normaliza(Coef,-1,1);%normaliza os coeficientes entre -1 e 1
Coef(1:length(Coef)/6,17)=1;
Coef(length(Coef)/6+1:2*length(Coef)/6,17)=2;
Coef(2*length(Coef)/6+1:3*length(Coef)/6,17)=3;
Coef(3*length(Coef)/6+1:4*length(Coef)/6,17)=4;
Coef(4*length(Coef)/6+1:5*length(Coef)/6,17)=5;
Coef(5*length(Coef)/6+1:6*length(Coef)/6,17)=6;
save('dados.mat','Coef');