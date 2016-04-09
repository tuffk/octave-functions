function [x, A, d, Solucion] = montante(M, b, op)
	x=0;
	A=0;
	d=0;
	Solucion=0;
	%inicializamos las variables


piv=0;
piva=1;
%inicializacion del pivote anterior

%ly=size(M)(1);
%lx=size(M)(2);
c=[M,b,eye(size(M))];%creamos la matriz MUY extendida con la matriz, el vector de resultados  y la matriz de identidad
for i = 1:length(M);%recorre en x
	piv=c(i,i);
	if(i-1 !=0)
			piva=c(i-1,i-1);%obenemos el pivote anterior
	endif

	for j = 1:length(M);%recorre en y

		if(i!=j)
			temp1=-1*c(i,:)*c(j,i);% operacion para obtener el vector fila para sumar
			temp2 = c(j,:)*piv;% operaacion oara obtener el otro vector fila para sumar
			c(j,:)=temp2+temp1;%al suamrlos se hace 0 el elemento que queremos tener como 0


		endif;
	endfor;

endfor;

M;
c;
D=[c(1:length(M),1:length(M))];% sacamos la matriz inicial tras el metodo de montante de la matriz MUY aumentada

	if(det(D)==0)%si el determinante es 0 salimos y devolvemos el error

		return
	else
		x=[c(:,length(M)+1)];% sacamos el vector columna con lso resutlados
		for i=1:length(M)% 
		
		x(i)=x(i)/D(i,i); % "despejamos X"

		endfor

P=[c(1:length(M),length(c)-length(M)+1:length(c))];%sacamos la matriz que esta en donde estaba la de identidad
A=P/c(1,1);%hacemos la divicion para que nos regrese la inversa
%printf("el determinante \n")
d=c(length(M),length(M));%el determinante es el ultimo elemento de la diagonal es el determinante 
		Solucion=op;%just for the lols
endif;

end
