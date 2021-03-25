alfa = 1.2;
T = 0.05;
%numerador = [1,0.1*alfa];
%denominador = [1,-1];
numerador = conv([1 0.1*alfa],(1));
denominador = conv([1 -1],(1));
K = 1;
C = K; % controlador proporcional
freq = 1; % frequencia disturbio senoidal [rad/s]
Gz = tf(numerador,denominador,T);
S = 1/(1+C*Gz);
ponto = exp(i*freq*T);
resp = abs(evalfr(S,ponto));
mag2db(resp)