function [x,Error] = newtonRaphson(x0, epsil, maxit)

x=0;
Error = true;
dif=0;
x1= x2 = x0;
									%Inicicalizacion de variables

for i = 1:maxit



	x2=x1;							%Almacenamiento del resultado anterior
	x1 = x2-((f(x1))/(df(x1)));		%Calculo de nueva X
	dif = x2-x1;					%Calculo de diferencia

	if(abs(dif) < epsil)			%Comprobacion de la diferencia, para ver si es menor que el rango de error aceptable
		
		x= x1;
		Error = false;
		printf('convergio en la iteracion '  )			%Indica en que X se detuvo 
		i
		return; 										%Terminacion de la funcion al encontrar solucion 
	endif;

endfor;													
x= "el metodo no converge"; 							%De otro modo, se indica un error

end;