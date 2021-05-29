% EJERCICIOS DE PROGRAMACIÓN - SCRIPTS EN MATLAB PARA RESOLVER E.D
%
%   Autores: Camila Cueva, Jonnathan Espinoza y Edgar Sánchez
%   Fecha: 03 de junio de 2021

% EJERCICIO 02:
%   y'=sen(x) Condición inicial: y(0)=1

clc, clear all;

% RESOLVER E.D
ED = 'Dy = sin(x)'; % definicion de mi Ecuacion Diferencial
ci = 'y(0) = 1'; % definicion de mi Condicion Inicial
y = dsolve(ED, ci, 'x'); % Resolucion de la E.D.

presentar="El resultado de la ecuación diferencial es ="+string(y);
disp(presentar)

% GRAFICAR FUNCION
x = linspace(-3, 1, 50); % generacion de un vector con los valores de x
vy = eval(y); % evaluacion de mi fución y
hold on % permite superponer los gráficos
plot(x, vy, 'r'); % graficar
title('Ejercicio 02');
xlabel('x');
ylabel('y');
grid on

% GRAFICAR CAMPO DE DIRECCIONES
f = @(x,y) sin(x); % declaramos la funcion. Equivalente a inline('y', 'x', 'y')
iz=-5; paso=0.5; der=5; % definimos el intervalo para el meshgrid
[xcd, ycd] = meshgrid(iz:paso:der, iz:paso:der);
[n, m] = size(xcd);
dx = ones(n,m);
dy = f(xcd, ycd);
quiver(xcd, ycd, dx, dy);

% GRAFICAR CONDICION INICIAL
plot(0, 1, '*g'); % grafica los puntos de la condicion inicial
legend(['y=', char(y)], 'Campo Direccional', '(0, 1)'); % agregar leyenda

hold off