function [l,lq,w,wq] = comparaCola(DE,DS,S,d1p,d2p,T)
	source("cola.m")
	[l,lq,w,wq] = cola(DE,DS,S,d1p,d2p,T);
	L = d1p(1)/(d2p(1)-d1p(1));
	LQ = (d1p(1)^2)/(d2p(1)*(d2p(1)-d1p(1)));
	W=1/(d2p(1)-d1p(1));
	WQ=(d1p(1))/(d2p(1)*(d2p(1)-d1p(1)));
	disp("las diferencias entre la simulacion y los calculos son:")
	disp("L")
	printf("S: %f, C: %f",l,L),disp("")
	disp("LQ")
	printf("S: %f, C: %f",lq,LQ),disp("")
	disp("W")
	printf("S: %f, C: %f",w,W),disp("")
	disp("WQ")
	printf("S: %f, C: %f",wq,WQ),disp("")

end