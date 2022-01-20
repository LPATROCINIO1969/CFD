% --------------------------------------------------------------
% Programa: PAREDE PLANA - UNIDIMENSIONAL
% Autor: L�cio P. Patroc�nio
% Descri��o: 
% --------------------------------------------------------------
% Este programa destina-se a realizar os c�lculos referentes a 
% taxa de transfer�ncia de calor, distribui��o e representa��o 
% gr�fica do perfil de temperatura de uma PAREDE PLANA com as 
% seguintes caracter�sticas:
% -> processo em regime permanente
% -> faces isot�rmicas
% -> condutividade t�rmica constante
% -> com ou sem gera��o interna de calor
% Condi��es de contorno:
% -> T1 = temperatura da face anterior = valor fixo
% -> T2 = temperatura da face posterior = valor fixo
%
% Obs.: As faces laterais s�o consideradas isoladas e n�o �
% necess�rio considerar o processo de convec��o, pois estaremos
% trabalhando apenas na regi�o material da parede. A convec��o
% n�o � considerada condi��o de contorno, pois j� fixamos as
% temperaturas nas faces extremas.
% --------------------------------------------------------------

clc;

% Entrada de dados

disp('ANALISE DA TRANSFER�NCIA DE CALOR UNIDIMENSIONAL EM PAREDE PLANA');
disp('================================================================');
T1 = input('Temperatura da Face anterior (K): ');
T2 = input('Temperatura da Face posterior (K): ');
largura = input('largura da parede (m): ');
altura = input('Altura da parede (m): ');
L = input('Espessura da parede(m): ');
k = input('Coeficiente de condutividade t�rmica da parede(W/mK): ');

% Verifica se h� gera��o uniforme de calor e em caso positivo
% informa o valor da gera��o interna de calor por unidade de volume
flag = true;
while(flag)
   resp = input('A parede possui gera��o interna de calor?<S/N> ','s');
   resp = upper(resp);
   if (resp ~= "S") && (resp ~= "N")
     flag = true;
   else
     flag = false;
   end
end
if (resp == 'S')
    qlinha = input('Informe a gera��o interna de calor por unidade de volume (W/m�): ');
else 
    qlinha = 0;
end



% C�lculo da �rea de face da parede
area = largura * altura;


% n�mero de n�s que ser�o utilizados na malha
n = input('Entre com o n�mero de n�s que ser�o utilizados na malha (incluindo os n�s extremos): ');
ndivisoes = n - 1;          % n�mero de divis�es utilizadas
delta = L/ndivisoes;        % espa�amento entre os n�s


% Define um vetor coluna n x 1 para armazenar as temperaturas dos n�s
Temp = zeros(n,1);
Tmatriz=zeros(n);

% Define uma matriz quadrada para armazenar os coeficientes.
% Cada linha representar� a equa��o de um n� e cada coluna representar� o
% coeficiente do n�.
% O tamanho da matriz ter� que ser igual ao n�mero de n�s.
A = zeros(n);

% vetor coluna dos termos independentes 
B = zeros(n,1);


% Preenchemos as posi��es correspondentes aos n�s das faces isot�rmicas com
% as temperaturas correspondentes.
A(1,1) = 1;
A(n,n) = 1;
B(1,1)= T1;
B(n,1) = T2;


% Preenchimento da matriz de coeficientes e vetor de termos independentes
% do n� 2 at� o n� (n-1)

for i = 2:(n-1)
     A(i,i+1) = 1;
     A(i,i) = -2;
     A(i,i-1)= 1;
     B(i,1)= (-1)*(delta^2)/k*qlinha;
end


% c�lculo das temperaturas
Temp = A\B;

% Preenchimento das posi�oes sobre a placa quadrada
xposicao=zeros(n,1);
yposicao=zeros(n,1);
for i = 1:n
   xposicao(i,1) = (i-1)*delta;
   yposicao(i,1) = (i-1)*delta;
end

% Preenchimento das temperaturas de TMATRIZ
cont=1;
for j = 1:n                % n� i,j na matriz de posi��es.
    for i = 1:n
        Tmatriz(i,j) = Temp(j,1);
    end
end



% Gr�fico da temperatura ao longo do eixo x
figure(1);
plot(xposicao,Temp,'r-');
title('Perfil de temperatura ao longo da espessura da Parede');
xlabel('x (m)');
ylabel('T (K)');
grid on;

% representa��o gr�fica da distribui��o de temperatura
figure(2);
mesh(xposicao,yposicao,Tmatriz);
figure(3);
surf(xposicao,yposicao,Tmatriz);
colorbar;


