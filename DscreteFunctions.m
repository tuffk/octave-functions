function s = DescreteFunctions(a,b)

end

function xx = onePointD(a,kuz)
	xx=0;	
	
	[f,c] = size(a);
	for tac = 1:c
		if(kuz == a(1,tac))
			xx = a(2,tac);
		endif
	endfor;
	printf("la probabilidad en %d es: %d \n",kuz,xx);
end

function s = acumD(a, kuz, sharmuta)
	tot=0;zain=1;
		for r = a(1,:)
		r;
			if (r>=kuz && r<=sharmuta)
				tot+= a(2,zain);
			endif;
			zain+=1;
		endfor;
	printf("la probabilidad del intervalo (%d<=x<=%d) es: %d\n",kuz,sharmuta,tot);
	
end

function s= acumulamela(a)
	for t = a(1,:)
	
	endfor
end