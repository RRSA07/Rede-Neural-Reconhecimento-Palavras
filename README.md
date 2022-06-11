# Rede-Neural-Reconhecimento-Palavras-Matlab
Este trabalho busca analisar o desempenho de rede neurais do tipo MLP (Multilayer perceptron) em problemas de reconhecimento de voz dependentes do falante (speaker-dependent). Todos os classificadores utilizam dados extraídos dos arquivos de áudio na forma de 16 coeficientes LPCC (Linear Predictive Cepstral Coefficients), obtidos a partir de um igual numero de coeficientes LPC (Linear Predictive Coding) através de uma função recursiva.

1. Dataset

O vocabulário é composto de seis palavras: "galáxia", "manifestação", "maravilhoso", "onipotente", "paixão", "perdão". Uma pessoa grava essas seis palavras vinte vezes, sendo essas palavras salvas em arquivos .wav, em um banco de dados de falas. Há. Então, 120 arquivos de onda, sendo cada um deles treinado e testado.

2. Pré-Processamento

Os sinais de fala são gravados em ambientes com níveis variados de ruído. Após isso, esses sinais xn são filtrados por um filtro yn=xn-a.xn-1, onde yn é o sinal filtrado e o valor de a utilizado vale 0,97 - tal procedimento é realizado visando aproximar os dados neste trabalho utilizados aos do artigo original, gravados em ambiente com pouco ruído. Os sinais possuem uma taxa de amostragem de 11kHz. Resultados razoáveis podem ser obtidos quando os dados de entrada estão rodeados de silêncio.

3. Taxa de amostragem

84 amostras são escolhidas com taxa de amostragem 11kHz, que é adequada para representar todos os sons de fala.

4. Janelamento

Para evitar descontinuidades no fim dos segmentos de fala, o sinal deve ser reduzido a zero ou um valor próximo de zero, reduzindo, dessa forma, as incompatibilidades. Nesse trabalho, a fala é dividida em frames de 20ms com overlapping de 10ms utilizando para isso a janela de Hamming.

5. Metodologia

Foi gravado o áudio contendo as palavras com taxa de amostragem de 11 KHZ, com uma pessoa falando 20 vezes cada palavra totalizando 120 arquivos de onda e realizou-se a extração das características utilizando os métodos de janela de Hamming, filtro, LPC, LPCC e a ponderação dos coeficientes, com a função gera_dados.m. Extraímos os coeficientes de cada áudio para treinar as redes neurais artificiais (RNA) e plotamos os gráficos para comparar os dados.
Utilizou-se o software Excel para organizar a matriz que tinha os coeficientes e separar os dados que seriam utilizados para treinar e testar as RNAs, foram utilizados 70% dos dados para treino e 30% dos dados para teste da rede. Realizaram-se testes na rede neural para encontrar os melhores parâmetros da rede como: quantidade de neurônios, método de treinamento entre outros. Para criar e treinar a rede MLP utiliza-se a função feedforward.m e a função classifica.m para classificar o resultado da rede neural. No modo multiclasse, os vetores de saída são valores arbitrários representando as possíveis classes de dado.
