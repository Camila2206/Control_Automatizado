% EJERCICIOS DE PROGRAMACIÓN - SCRIPTS EN MATLAB PARA RESOLVER E.D
%
%   Autores: Camila Cueva, Jonnathan Espinoza y Edgar Sánchez
%   Fecha: 03 de junio de 2021

% EJERCICIO 04:
%   (2r sen(t))dr + (2t+ (r^2)cos(t))dt=0

clc, clear all;
syms r t c g(t) 

% PASO 1: Determinar si es una ecuación exacta
%    Paso 1.1: Cuando "r" es constante
 dM=((2*r)*sin(t)); 
 derivadaM=diff(dM, 't');
 disp('La derivada cuando r es constantes equivale a: ')
 disp(derivadaM)
 
 %    Paso 1.2: Cuando 't' es constante
 dN=((2*t)+((r^2)*cos(t))); 
 derivadaN=diff(dN, 'r');
 disp('La derivada cuando t es constantes equivale a: '),
 disp(derivadaN)
 
 aux= true; % Variable para comprobar que la igualdad de las ecuaciones es verdadera
 if derivadaM == derivadaN
     disp('YA QUE EL VALOR DE LAS DERIVADAS ES IGUAL, SE TRATA DE E.D EXACTA '),
     aux= true;
%    ****EN EL CASO DE QUE EL VALOR DE LAS DEREIVADAS SEA IGUAL*****

% PASO 2: Integrar M o N y obtener f(r,t)
%    Paso 2.1: Integrar M con respecto a "r", manteniendo a "t" como constante
%    Integrando M:  (2r*sen(t))dr
     disp("El resultado de la integración es : ")
     integralM=int(dM);
     disp(integralM+c)
     reemplazo=int(dM)+g(t);
     disp("Reemplazando la constante(c) en g(t) tenemos f(r,t) ")
     pretty(reemplazo)

%    Paso 2.2: Derivar parcialmente la última expresión con respecto a "t", manteniendo a "r" como constante
     derivadaP=diff(reemplazo, 't');
     disp("La derivada parcial es:")
     pretty(derivadaP)

%   Paso 2.3. Igualar la ecuación anterior a N(r,t)
     ecIgualada=derivadaP+(-dN);
     disp("La ecuación resultante es:")
     pretty(ecIgualada)
     
%    Paso 2.4. Despejar g'(t)
     derivadaG=dN-diff(integralM,'t');
     g=int(derivadaG, 't');
     disp("El valor de g(t) es:")
     pretty(g)
     
%    Presentar f(r,t)
     funcion="f(r,t)="+string(integralM)+string(g);
     disp(funcion)
     
% PASO 3: Igualar f(r,t) = C
     solGeneral=integralM+g+c; 
     disp('La solución para la E.D. Exacta es:')
     pretty(solGeneral)
     
%    ****EN EL CASO DE QUE EL VALOR DE LAS DEREIVADAS NO SEA IGUAL*****
 else
     disp('YA QUE EL VALOR DE LAS DERIVADAS NO ES IGUAL, NO SE TRATA DE E.D EXACTA ')
     aux = false;
 end
