%% gerando modelo em espaco da planta de 2a ordem a partir
%  da funcao de transferencia de malha aberta do processo.
num = [1];
den = [0.3 1 0];
Ts = tf(num,den)
Ts = zpk(Ts)
Tz = c2d(Ts,0.01,'zoh')
%% definindo modelo em espaco de estados
Tz = zpk(Tz)
[zNum, zDen] = tfdata(Ts,'v')
[A,B,C,D] = tf2ss(num,den)
%% controle por alocacao de polos
p = [0.9 -.5];
K = place(A,B,p)
