function [l, lq, w, wq] = comparaCola(DE, DS, S, d1p, d2p, T)

	DE = "M";
	DS = "M";
	S = 1;
	d1p = [10];
	d2p = [2];
	T = 100000;


	source("cola.m")

	[l, lq, w, wq] = cola(DE, DS, S, d1p, d2p, T);

	L = d2p(1) / (d1p(1) - d2p(1));
	LQ = (d2p(1) ^ 2) / (d1p(1) * (d1p(1) - d2p(1)));
	W = 1 / (d1p(1) - d2p(1));
	WQ = (d2p(1)) / (d1p(1) * (d1p(1) - d2p(1)));

	disp(strcat("l  (", strPretty(l), ") :: L  (", strPretty(L), ") :: e (", strPretty(abs(L-l)/L), ")"));
	disp(strcat("lq (", strPretty(lq), ") :: LQ (", strPretty(LQ), ") :: e (", strPretty(abs(LQ-lq)/LQ), ")"));
	disp(strcat("w  (", strPretty(w), ") :: W  (", strPretty(W), ") :: e (", strPretty(abs(W-w)/W), ")"));
	disp(strcat("wq (", strPretty(wq), ") :: WQ (", strPretty(WQ), ") :: e (", strPretty(abs(WQ-wq)/WQ), ")"));

end

function s = strPretty(x)
	s = mat2str(x,3);
end
