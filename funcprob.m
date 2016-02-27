function [x,y] = funcprob(a,b,opt)

if(strcmpi(opt,"c") && strcmpi(class(a),"cell"))
	cont(a,b)
elseif(strcmpi(opt,"d"))
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
	x=menu("selecciona una opcion", "salir","probabilidad en un punto","probabilidad en un rango en un rango");
	switch(x)
	case 2
	{
		kuz=input("en que punto?");
		kuz;
		xx=nan;
for t = a(1,:)
			if(kuz == t)
				xx = a(2,t);
				break;
			endif;
		endfor;
		printf("la probabilidad en %d es: %d \n",kuz,xx)
		}
		case 3
		{
			kuz=input("inicio intervalo (incluyente)");
			sharmuta=input("fin intervalo (incluyente)");
			tot=0;
			for t = kuz:sharmuta
				for r = a(1,:)
					if t ==r
						tot+= a(2,r);
					endif;
				endfor;
			endfor;
			printf("la probabilidad del intervalo (%d<=x<=%d) es: %d\n",kuz,sharmuta,tot);
		}
		otherwise
	endswitch;
	endwhile;

end;


#funcion llamada cuando la funcion dada es continua
%{
el input (la tabla de funciones e intervalos) debe darse en forma de
cell (clase de octave) en la que el intervalo este dado en la fila 1 y la funcion correspondiente en la fila 2
por ejemplo
y={[1,2],[2,5];"x","x^2"}
que corresponderia a
intervalo 	[1-2)	[2,5)
funcion 	x		x^2
%} 
function [x,y] = cont(a,b)

	disp("funcion continua")

end;
