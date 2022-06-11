function [y] = overlaphamming(x,Fs,dur_frame)
%Hamming com Overlap Aplica a janela de hamming em um sinal com overlap de
%50%
%   x = sinal
%   Fs = sampling rate, em kHz
%   dur_frame = duração do frame, em ms
%   tam_frame
    dur_frame=dur_frame/1000; %converte pra s
    tam_f=floor(dur_frame*Fs); %tamanho da janela = tamanho do frame
    nx = length(x); %tamanho do sinal
    w = hamming(tam_f)';   %janela      
    pos=1;
    while (pos+tam_f<=nx)
            y(pos:pos+tam_f-1) = x(pos:pos+tam_f-1).*w';
            pos = pos + tam_f/2;
    end
end
% fs= sample rate, em Hz
% tam_frame = tamanho do frame, em pontos
% dur_frame = tam_frame/fs = duração do frame, em s
% como o frame dura 20ms = 0.02s, então, o tamanho do frame será
% tam_frame = dur_frame * fs = 0.02 * 11025 = 220,5, como esse numero é
% fracional, usa-se 220