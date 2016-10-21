function [x,Error] = puntoFijo(x0, epsil, maxit)

	%epsil es la variable para evaluar cuando seguir o parar%
	%Error es un bool%
	%inicializacion de variables
x=0;
Error = true;
dif=0;
x1=0;
x2=0;
	
for i = 0:maxit		%El for es para iterar el procedimiento hasta superar maxit o converger

	x2=x1;		%asignacion del resultado anterior
	x1 =g(x1);		%calculo de x nueva
	dif = x2-x1;		%calculo de la diferencia


	if( abs(dif) < epsil )		%comprobacion de la diferencia, para ver si es menor que el rango de error permitido
		x= x1;
		Error = false;
		printf('convergio en la iteracion '  )	%Imprime la x en la que se detuvo
		i
		return; 		%Fin de la funcion al encontrar y devolver el valor de la X convergente

	endif

endfor	

x= "el metodo no converge"; % De otra manera, se devuelve mensaje de error
end;

