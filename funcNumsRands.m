function x = mult(prev,a,m)
	temp =(a*prev);
	x = mod(temp,m);
end;

function x = mix(prev,a,c,m)
	temp = ((a*prev)+c);
	x = mod(temp,m);
end;