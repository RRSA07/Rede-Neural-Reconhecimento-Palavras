%REDE NEURAL MLP 
clear all
clc
load dados_rede.mat;
rand('seed',1);
%%%%parametros MLP 
neuronios=[18,10];
net.trainParam.epochs=100;
net.trainParam.goal=1e-20;
net.trainParam.min_grad=1e-30;
%%%%dados
x=ENTRADA_TREINO;
t=SAIDA_TREINO;
net = feedforwardnet(neuronios,'trainlm');%cria a rede
[net,tr] = train(net,x,t);%treina a rede
view(net);
OUT_SIM=sim(net,ENTRADA_TREINO);
% treino
[CLASS,acertos]=classifica(SAIDA_TREINO,OUT_SIM);
fprintf('Acertos(%%) TREINAMENTO:\n');
disp(acertos);
%	Testa
OUT_SIM=sim(net,ENTRADA_TESTE);
[CLASS,acertos]=classifica(SAIDA_TESTE,OUT_SIM);
fprintf('Acertos(%%) TESTE:\n');
disp(acertos);
