clc;
disp('C�lculo de condu��o de calor em placa plana');
disp('===========================================');
T1 = input('Entre temperatura da face esquerda: ');
T2 = input('Entre temperatura da face direita: ');
k = input('Entre com a condutividade t�rmica: ');
L = input('Entre com a espessura da parede: ');
A = input('Entre com a area da face da parede: ');

Q = k*A*(T1 - T2)/L;

fprintf('A taxa de transfer�ncia de calor � %4.2f W.', Q);
