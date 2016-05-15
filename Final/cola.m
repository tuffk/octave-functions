function [l, lq, w, wq] = cola(DE, DS, S, D1P, D2P, T)

%{
DE = "M";
DS = "M";
S = 1;
D1P = [5];
D2P = [3];
T = 100000;
%}



source("randGen.m");

arrivals     = [];
entries      = [];
departures   = [];
queueT       = [];
serverWait   = zeros(S)(1:S);
serverStatus = zeros(S)(1:S);
queueSize    = 0;
systemSize   = 0;
iArrival     = 1;
cTime        = 0;


tempSum = 0;
while (tempSum < T)
    tempSum += randGen(DE, D1P);
    arrivals(end + 1)   = tempSum;
	entries(end + 1)    = 0;
	departures(end + 1) = 0;
end


sumita1 = 0; # acumula el tamaño de la cola
sumita2 = 0; # acumula el tamaño del sistema
tempArrivals = arrivals;

while (cTime < T)

	#arrivals
    if (cTime == tempArrivals(1))
        tempArrivals    = tempArrivals(2:end);
		queueT(end + 1) = iArrival;
		iArrival   += 1;
		queueSize  += 1;
		systemSize += 1;
    end


    for (i = 1 : length(serverWait))

		if (serverWait(i) > 0)
        	serverWait(i) -= 1;

			#departures
			if (serverWait(i) == 0)
				departures(serverStatus(i)) = cTime;
				systemSize -= 1;
			end

        end
    end


    if (queueSize > 0)

		for (i = 1 : length(serverWait))

			#entries
			if (serverWait(i) == 0)

				serverWait(i)      = randGen(DS, D2P);
				serverStatus(i)    = queueT(1);
				entries(queueT(1)) = cTime;
				queueT      = queueT(2:end);
				queueSize  -= 1;

            end

		end
    end

	%{
	if (mod(cTime, 100) == 0)
	    disp("==============");
	    disp(strcat("servs :: ", mat2str(serverWait)));
	    disp(strcat("queue :: ", mat2str(queueSize)));
	    disp(strcat("timee :: ", mat2str(cTime)));
	end
	%}

    sumita1 += queueSize;
	sumita2 += systemSize;
    cTime   += 1;

end




sumita3 = 0;
sumita4 = 0;
len3    = 0;
len4    = 0;

for (i = 1 : length(arrivals))

	if (arrivals(i) < entries(i))
		sumita3 += entries(i) - arrivals(i);
		len3    += 1;
	end

	if (arrivals(i) < departures(i))
		sumita4 += departures(i) - arrivals(i);
		len4    += 1;
	end
end

lq = sumita1 / cTime;
l = sumita2 / cTime;
wq = (sumita3 / len3)/10000;
w = (sumita4 / len4)/10000;

end
