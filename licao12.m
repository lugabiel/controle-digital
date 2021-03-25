%% Questao 1
% Um modelo simplificado para dinâmica de satélites é o modelo de integrador duplo:
% 
% G(s)=\frac{1}{s^2}
% 
% Em termos de espaço de estados, no domínio do tempo discreto, o modelo é dado por:
% 
% \vec{x}[k+1] = \begin{bmatrix} 1 & T\\ 0 & 1\end{bmatrix}\vec{x}[k] + \begin{bmatrix} T^2/2\\ T\end{bmatrix}u[k].
% 
% Considerando T=0,46, determine o ganho K = [k_1~k_2] por realimentação completa de estados, u[k]=-K\vec{x}[k], que garanta os autovalores de malha-fechada z=0,8\pm j 0,25.  Informe o valor de k_1:

T = 0.12;
autovalor1 = 0.8 + 1i*0.25;
autovalor2 = 0.8 - 1i*0.25;

A = [1 T;0 1];
b = [T^2/2; T];
K = acker(A,b, [autovalor1 autovalor2])
display(K(1)) %% reposta

%% Questao 2
% (Adaptada do enade 2017)
% 
% Um sistema de controle digital SISO é representado pelo diagrama de blocos a seguir:
% 
% 
% O conjunto de estados é definido: saída da planta como x_1[k]; saída do controlador como x_2[k]; saída do sensor x_3[k]. O modelo em espaço de estados é dado por:

C = tf(1, [1 -1],-1);
G = tf(1, [1 -0.5],-1);
H = tf(0.375, [1 -0.25],-1);
sys = feedback(C*G,H)
pole(sys)
test = [0.5 1 0; 0 1 -1; 0.375 0 0.25]; %mudar essa matriz pra matriz A das opçoes (essa ta certa)
eig(test) % ver se os autovalores de test sao iguais aos polos do sistema, marca com base em B, no caso [1 0 0]