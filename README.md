# Grupo de Estudo de CFD (Computer Fluid Dymanic) utilizando ANSYS WORKBENCH
*Repositório do material do grupo de estudo sobre DINÂMICA DOS FLUIDOS COMPUTACIONAL* 

## Orientação de Estudo para o ANSYS

### Preparação...
1. Instalar o ANSYS WORKBENCH em seu computador.
* Entre no link [Download da versão free Ansys Student](https://www.ansys.com/academic/students/ansys-student) e siga os passos indicados no tópico INSTALLATION STEPS. Algumas dúvidas podem ser esclarecidas no vídeo [Vídeo 1 -  Como Instalar o free ANSYS Workbench em seu computador](https://youtu.be/mYv2VJ1btyk).
* Procure verificar se o seu computador atende aos requisitos indicados no tópico SYSTEM AND BROWSER REQUIREMENTS.
2. Uma vez concluída a instalação, sugere-se assistir ao [vídeo Getting Started with Ansys Student](https://youtu.be/GwrpAceViD8) e reproduzir os passos descritos para testar se o software foi corretamente instalado.
### Entendendo o que é CFD...
3. Antes de começar a usar o ANSYS, é interessante entender o conceito de Computational Fluid Dynamic (CFD), o qual será utilizado neste estudo. Um vídeo introdutório sobre o assunto é:
* [Vídeo 2: Introdução a Fluidodinâmica](https://youtu.be/y-63TFm9QIM).
### Conhecendo o ANSYS WORKBENCH...
4. Antes de começar a construir qualquer modelo no ANSYS, vamos entender um pouco os conceitos introdutórios e o ambiente do software. Para isso, recomendo os seguinte vídeos explicativos:
* [Vídeo 3: Tutorial Básico de Ansys para Iniciantes](https://youtu.be/aFxGct4fLoQ)
* [Vídeo 4: Introdução ao Ansys - parte 1](https://youtu.be/x_JRrMuQTaI)
### Modelos introdutórios
5. Vamos iniciar o estudo do ANSYS WORKBENCH com dois exemplos que utilizam conceitos básicos de modelagem na interface Mechanical. Procure observar como é definida a ferramenta de análise, construção das geometrias básicas, a definição de malha e as condições de contorno utilizadas nas superfícies e volumes. Também é importante, nesta etapa entender  o processo de geração e apresentação das soluções de modelagem.
* [Video 5: Modelagem de Transferência de Calor Por Condução 1D - Corpo Cilíndrico](https://youtu.be/tb8lCXSzULc)
* [Vídeo 6: Utilização do Mechanical para Análise de Tensões e deformações em uma Viga](https://youtu.be/T9KA6nGC_fE)
6. Uma ferramenta importante para modelagem dentro do ANSYS WORKBENCH e o FLUENT, aplicação destinada a realizar a modelagem de escoamentos fluidos e transferência de calor típicos de análise CFD. Neste exemplo, veremos: a definição da geometria de uma tubulação, o uso do MESH com elementos tetraédricos e definição de regiões nomeadas, a associação de um modelo físico para simular e analisar o resultado no fluent, a ferramenta de pós-processamento para apresentar os resultados finais.
* [Vídeo 7: Modelagem de escoamento turbulento em uma tubulação cilíndrica - 1](https://youtu.be/ffUuxEP3UuQ)
7. Neste vídeo, mostramos como uma análise de escoamento externo, 2D,  laminar, viscoso em regime permanente, sobre uma superfície plana pode ser realizado. A variável de interesse passa a ser a velocidade (componente x). Neste exemplo é importante ficar atento aos seguintes aspectos: a sequência de produção do modelo (geometria, malha, análise), as condições de contorno que foram assumidas, e principalmente, a forma como o resultado é processado no final do vídeo.
* [Vídeo 8: Modelagem de escoamento externo, laminar , 2d, viscoso em regime permanente sobre uma placa plana](https://youtu.be/ax1se0EJESI)
8. Muitas modelagens de fenômenos 3D apresentam uma simetria em relação a sua profundidade que permite que sejam analisados em uma modelagem 2D. Neste exemplo, vamos representar o escoamento cruzado laminar de um fluido viscoso em torno de um cilindro. Durante esse processo, teremos a formação de vórtices e, portanto, será modelado como um processo REGIME TRANSIENTE para poder mostrar a geração e movimentação desses vórtices. Também vamos dividir a região da malha em sub-regiões para que possamos detalhar melhor pontos próximos da superfície do cilindro e outras regiões de interesse. O modelo permitirá a visualização das linhas de corrente e serão analisados e representados graficamente a velocidade, pressão e vorticidade.
* [Vídeo 9: Escoamento cruzado com um cilindro](https://youtu.be/76BkGEnHByA)
9. Esta atividade consiste em modelar um trocador de calor de multiplos tubos paralelos com escoamento fluido cruzado. Analisaremos o escoamento e a troca de calor que ocorre nesse dispositivo. Para isso, faremos uma modelagem 3D, embora o dispositivo tenha uma simetria que permite fazer uma avaliação 2D. Na etapa de modelagem geométrica e de malha, usaremos diversas operações importantes, tais como pattern (geometry) e boolean, para criação e separação dos componentes físicos do dispositivo.
* [Vídeo 10: Fluid Flow and Heat Transfer Analysis | Cross Flow Heat Exchanger | ANSYS Fluent Tutorial | CFD](https://youtu.be/-03gO3UwFeA)

## Vídeos das Reuniões - Período: 2022/2
* 20/08 - [1a. reunião via TEAMS - link](https://youtu.be/y4DeN_3ROHE) e [vídeo demonstrativo do Ansys Workbench - Static Structural](https://youtu.be/08QIIcrG1ic) 
* 27/08 - [2a. reunião via TEAMS - link](https://youtu.be/XkeKymPYEp4)
* 17/09 - [3a. reunião via TEAMS - link](https://youtu.be/ax1se0EJESI)
* 24/09 - [4a. reunião via TEAMS - link](https://youtu.be/76BkGEnHByA)
* 09/10 - [5a. reunião via TEAMS - parte 1 - link](https://youtu.be/D4U_wAbUcPs)  - *modelagem do trocador de calor no Design Modeler*
  * 09/10 - [5a. reunião via TEAMS - parte 2 - link](https://youtu.be/apzvo77UIws)  - *criação da malha do trocador de calor no Mesh*
