function x = genNumAl(gen, LG, func, LF, N,M)

	#importar librerias

	source("funcNumRands.m");
	source("funcs.m");

	#Input prueba
	#gen = "mixto";
	#LG = [1 147 21 997];
	#func = "normal";
	#LF = [-10 10 1 1];
	#N = 100;
	#M = 20;

	#Definir el metodo

	setVar(gen, LG);

	#Seleccion de la funcion

	switch (func)

		case "uniforme"
			#parametros de LF = [ini,fin,c]
			x = uni(LF(1), LF(2), LF(3), N, M);

		case "exponencial"
			#parametros de LF = [ini,fin]
			x = exp(LF(1), LF(2), N, M);

		case "normal"
			#parametros de LF = [ini,fin, miu, signma]
			x = norm(LF(1), LF(2), LF(3), LF(4), N, M);

		case "triangular"
			#parametros de LF = [a, b ,c]
			x = tria(LF(1), LF(2), LF(3), N, M);

		case "poisson"
			#parametros de LF = [ini, fin, lambda]
			x = pois(LF(1), LF(2), LF(3), N, M);

		case "binomial"
			#parametros de LF = [ini, fin, k]
			x = bino(LF(1), LF(2), LF(3), N, M);
	end

end;
