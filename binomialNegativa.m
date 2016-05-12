function X = binomialNegativa(n,p,k)
 	X=[];
 	for i = 1:n
 		x=0;
 		exitos=0;
 		q=rand();
 		while q<=p || exitos < k
			if q<=p
				exitos += 1 ;
			endif
 			x=x+1;
 			q=rand();
 		endwhile
 		X=[X x];
 	endfor
 			
 end