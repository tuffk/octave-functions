function [x,y] = funcprob(a,b,opt)

source("ContinuousFunctions.m")
source("DscreteFunctions.m")

if(strcmpi(opt,"c") && strcmpi(class(a),"cell"))
	cont(a,b)
elseif(strcmpi(opt,"d"))
	disp("debugaso")
	disc(a,b)
else
	disp("opcion invalida detectada")
endif;
end;


#funcion llamada cuando la funcion dada es discreta

function [x,y] = disc(a,b)

	disp("funcion dicreta")
	x=0;y=0;kuz=0;
	while(x!=1)
	x=menu("selecciona una opcion", "salir","probabilidad en un punto","probabilidad en un rango","funcion acumulada","funcion de distrubucion");
	switch(x)
	case 2
	
		kuz=input("en que punto?");
		onePointD(a,kuz);
		
		case 3
		kuz=input("inicio intervalo (incluyente)");
		sharmuta=input("fin intervalo (incluyente)");
			acumD(a,kuz,sharmuta);
			
		case 4
		acumulamela(a);
		
		case 5
		bar(a(1,:),a(2,:),'g')
		
		otherwise
	endswitch;
	endwhile;

end;



#funcion llamada cuando la funcion dada es continua
%{
el input (la tabla de funciones e intervalos) debe darse en forma de
cell (clase de octave) en la que el intervalo este dado en la fila 1 y la funcion correspondiente en la fila 2 (en formato de funcion de octave)
por ejemplo
y={[1,2],[2,5];@(x) x,@(x) x.^2}
que corresponderia a
intervalo 	[1-2)	[2,5)
funcion 	x		x^2
%} 
#para acceder un elemento del un cell array se usa y{2,2}; si es un vector y{1,1}(1)
#para integrar usar la funcion quadgk(funcion,inicio,fin) por ejemplo quadgk(@(x) x.^2,0,1)
#combinalo con el cell array quadgk(y{2,1},0,1)
function [x,y] = cont(a,b)

	disp("funcion continua")
	x=0;
	while(x!=1)
		x= menu("selecciona una opciona","salir","probabilidad en un punto","probabilidad en un rango","grafica la funcion de distribucion de probabilidad","grafica la funcion de densidad de probabilidad");
		switch(x)
			case 2
			
			kuz = input("punto en el que deseas evaluar");
				%disp(evalPoint(a,kuz));
				disp("la integral es 0");
			case 3
				kuz=input("inicio intervalo (incluyente)");
				sharmuta=input("fin intervalo (incluyente)");
				disp(evalInterval(a,kuz,sharmuta));
				case 4
					kuz=input("inicio intervalo (incluyente)");
					sharmuta=input("fin intervalo (incluyente)");
					[X,y] = getPF(a,kuz,sharmuta);
					plot(X,y,'r');
				case 5
					kuz=input("inicio intervalo (incluyente)");
					sharmuta=input("fin intervalo (incluyente)");
					[X,y] = getPDF(a,kuz,sharmuta);
					plot(X,y,'r');
		otherwise
		endswitch
	endwhile;

end;
