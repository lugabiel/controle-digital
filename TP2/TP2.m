%% gerando modelo em espaco da planta de 2a ordem a partir
%  da funcao de transferencia de malha aberta do processo.

num = [1];
den = [0.3 1 0];
Ts = tf(num,den);
Tz = c2d(Ts,0.01,'zoh')

% definindo modelo em espaco de estados
Tz = zpk(Tz)
[zNum, zDen] = tfdata(Tz,'v')

[A,B,C,D] = tf2ss(zNum,zDen)

%definindo matriz para contrla usando metodo LQR
Q = [1 0;
     0 1];
R = 1
K = lqrd(A,B,Q,R);
[At,Bt,Ct,Dt,Et] = ss((A - B*K),B,C,D,0.01)




%t = [0:0.1:5]';
%[y, t, x] = step(sys,t);
%for i=1:3
%  subplot(3,1,i); 
%  plot(t, x(:,i));  % look at how I indexed into x 
%end 

