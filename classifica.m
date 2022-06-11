function [CLASS,acertos] = classifica(SAIDA_TESTE,OUT_SIM)
for i=1:length(OUT_SIM)
    if (OUT_SIM(i)>0.5)&&(OUT_SIM(i)<=1.5)
        CLASS(i)=1;
    else if (OUT_SIM(i)>1.50)&&(OUT_SIM(i)<=2.50)
        CLASS(i)=2;
    else if (OUT_SIM(i)>2.50)&&(OUT_SIM(i)<=3.5)
        CLASS(i)=3;
    else if (OUT_SIM(i)>3.50)&&(OUT_SIM(i)<=4.5)
        CLASS(i)=4;
    else if (OUT_SIM(i)>4.50)&&(OUT_SIM(i)<=5.5)
        CLASS(i)=5; 
    else if (OUT_SIM(i)>5.5)&&(OUT_SIM(i)<=6.5)
        CLASS(i)=6;
    else
        CLASS(i)=randi(6);
        end
        end
        end
        end
        end
    end
end
acertos=zeros(6,2);
acertos(:,1)=[1,2,3,4,5,6];
for i=1:length(SAIDA_TESTE)
    if(SAIDA_TESTE(i)==CLASS(i))
        switch CLASS(i)
            case 1,
                acertos(1,2)=acertos(1,2)+1;
            case 2,
                acertos(2,2)=acertos(2,2)+1;
            case 3,
                acertos(3,2)=acertos(3,2)+1;
            case 4,
                acertos(4,2)=acertos(4,2)+1;
            case 5,
                acertos(5,2)=acertos(5,2)+1;
            case 6,
                acertos(6,2)=acertos(6,2)+1;
        end        
    end
end
acertos(:,2)=acertos(:,2)*600/length(SAIDA_TESTE);
end