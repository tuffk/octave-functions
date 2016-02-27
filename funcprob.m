function [x,y] = funcprob(a,b,opt)

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
	x=menu("selecciona una opcion", "salir","probabilidad en un punto","probabilidad en un rango");
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
		x= menu("selecciona una opciona","salir","probabilidad en un punto","probabilidad en un rango")
		switch(x)
			case 2
				
			case 3
				kuz=input("inicio intervalo (incluyente)");
				sharmuta=input("fin intervalo (incluyente)");
				tot =0; comi = kuz; fin = sharmuta;
				[f,c]=size(a);
				i=1;
				while (i<c)
					if comi < a{1,i}(1)
						comi = a{1,i}(1);
					endif
					if fin > a{1,i}(2)
						fin = a{1,i}(2);
					else
						fin = sharmuta;
					endif
					tot += quadgk(y{2,i},comi,fin);
					i+=1;
				endwhile
		otherwise
		endswitch
	endwhile;

end;
