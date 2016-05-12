function [l,lq,w,wq] = cola(DE,DS,S,d1p,d2p,T)
	source("randGen.m")
	sumale=0;
	llegale=[];
	while sumale < T
		sumale += randGen(DE,d1p);
		#sumale+= exprnd(1);
		llegale(end+1) = sumale;
	endwhile
	disp(llegale)
	#disp(llegale);
	zain =0;#es el itmepo !!!
	tajat = 0; # es la cola
	
	esperame=[];
	esperame = zeros(S)(1:S);
	while zain < T
	
		for d = llegale
			if (revisamela(zain,llegale(1)))
				llegale=llegale(2:end);
				tajat += 1;
			endif
		endfor
		
		
		temp =1;
		for s = esperame
			esperame(temp)-=1;
			temp+=1;
		endfor
		temp=1;
		if tajat > 0
			for s = esperame
				if esperame(temp) <=0 
					esperame(temp) = randGen(DS,d2p);
					tajat -=1;
				endif
				temp+=1;
			endfor
		endif

		
		%{
		disp("==============")
		disp("servs")
		disp(esperame)
		disp("cola")
		disp(tajat)
		disp("actual")
		disp(zain)
		%}
		
		
		
		zain+=1;
	endwhile
end

function x = revisamela(act,rev)
	if ( act < (rev+1) && act>rev-1)
		x=1;
		return;
	endif
	x=0; 
	return
end