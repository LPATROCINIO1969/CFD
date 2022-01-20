% --------------------------------------------------------------
% Programa: PAREDE PLANA - UNIDIMENSIONAL
% Autor: Lúcio P. Patrocínio
% Descrição: 
% --------------------------------------------------------------
% Este programa destina-se a realizar os cálculos referentes a 
% taxa de transferência de calor, distribuição e representação 
% gráfica do perfil de temperatura de uma PAREDE PLANA com as 
% seguintes características:
% -> processo em regime permanente
% -> faces isotérmicas
% -> condutividade térmica constante
% -> com ou sem geração interna de calor
% Condições de contorno:
% -> T1 = temperatura da face anterior = valor fixo
% -> T2 = temperatura da face posterior = valor fixo
%
% Obs.: As faces laterais são consideradas isoladas e não é
% necessário considerar o processo de convecção, pois estaremos
% trabalhando apenas na região material da parede. A convecção
% não é considerada condição de contorno, pois já fixamos as
% temperaturas nas faces extremas.
% --------------------------------------------------------------

clc;

% Entrada de dados

disp('ANALISE DA TRANSFERÊNCIA DE CALOR UNIDIMENSIONAL EM PAREDE PLANA');
disp('================================================================');
T1 = input('Temperatura da Face anterior (K): ');
T2 = input('Temperatura da Face posterior (K): ');
largura = input('largura da parede (m): ');
altura = input('Altura da parede (m): ');
L = input('Espessura da parede(m): ');
k = input('Coeficiente de condutividade térmica da parede(W/mK): ');

% Verifica se há geração uniforme de calor e em caso positivo
% informa o valor da geração interna de calor por unidade de volume
flag = true;
while(flag)
   resp = input('A parede possui geração interna de calor?<S/N> ','s');
   resp = upper(resp);
   if (resp ~= "S") && (resp ~= "N")
     flag = true;
   else
     flag = false;
   end
end
if (resp == 'S')
    qlinha = input('Informe a geração interna de calor por unidade de volume (W/m³): ');
else 
    qlinha = 0;
end



% Cálculo da área de face da parede
area = largura * altura;


% número de nós que serão utilizados na malha
n = input('Entre com o número de nós que serão utilizados na malha (incluindo os nós extremos): ');
ndivisoes = n - 1;          % número de divisões utilizadas
delta = L/ndivisoes;        % espaçamento entre os nós


% Define um vetor coluna n x 1 para armazenar as temperaturas dos nós
Temp = zeros(n,1);
Tmatriz=zeros(n);

% Define uma matriz quadrada para armazenar os coeficientes.
% Cada linha representará a equação de um nó e cada coluna representará o
% coeficiente do nó.
% O tamanho da matriz terá que ser igual ao número de nós.
A = zeros(n);

% vetor coluna dos termos independentes 
B = zeros(n,1);


% Preenchemos as posições correspondentes aos nós das faces isotérmicas com
% as temperaturas correspondentes.
A(1,1) = 1;
A(n,n) = 1;
B(1,1)= T1;
B(n,1) = T2;


% Preenchimento da matriz de coeficientes e vetor de termos independentes
% do nó 2 até o nó (n-1)

for i = 2:(n-1)
     A(i,i+1) = 1;
     A(i,i) = -2;
     A(i,i-1)= 1;
     B(i,1)= (-1)*(delta^2)/k*qlinha;
end


% cálculo das temperaturas
Temp = A\B;

% Preenchimento das posiçoes sobre a placa quadrada
xposicao=zeros(n,1);
yposicao=zeros(n,1);
for i = 1:n
   xposicao(i,1) = (i-1)*delta;
   yposicao(i,1) = (i-1)*delta;
end

% Preenchimento das temperaturas de TMATRIZ
cont=1;
for j = 1:n                % nó i,j na matriz de posições.
    for i = 1:n
        Tmatriz(i,j) = Temp(j,1);
    end
end



% Gráfico da temperatura ao longo do eixo x
figure(1);
plot(xposicao,Temp,'r-');
title('Perfil de temperatura ao longo da espessura da Parede');
xlabel('x (m)');
ylabel('T (K)');
grid on;

% representação gráfica da distribuição de temperatura
figure(2);
mesh(xposicao,yposicao,Tmatriz);
figure(3);
surf(xposicao,yposicao,Tmatriz);
colorbar;


