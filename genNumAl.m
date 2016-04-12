function x = genNumAl(gen, LG, func, LF, N,M)
	source("funcNumsRands.m")
	

	#{
	x=97;
	arr=[];
	for k= 1:5000
		x = mix(x,147,21,100);
		arr=[arr x];
	endfor
	disp(arr)
	#}

end;