%% gerando modelo em espaco da planta de 2a ordem a partir
%  da funcao de transferencia de malha aberta do processo.

num = [1];
den = [0.3 1 0];
Ts = tf(num,den)
Ts = zpk(Ts)
Tz = c2d(Ts,0.01,'zoh')

% definindo modelo em espaco de estados
Tz = zpk(Tz)
[zNum, zDen] = tfdata(Ts,'v')

%%
[A,B,C,D] = tf2ss(num,den)
p = [0.9 -1.0];
K = place(A,B,p)

%definindo matriz para contrla usando metodo LQR
%Q = [0.001 0;
%     0 1];
%Q = Q
%R = 1;
%K = lqr(A,B,Q,R)

%A = A - B*K
%[At,Bt,Ct,Dt,Et] = ss((A - B*K),B,C,D)
%bode(A,B,C,D);

%%

%t = [0:0.1:5]';
%[y, t, x] = step(sys,t);
%for i=1:3
%  subplot(3,1,i); 
%  plot(t, x(:,i));  % look at how I indexed into x 
%end 

