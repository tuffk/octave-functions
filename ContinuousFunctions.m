% IMPORTANT
% To include the functions in the mainFile use -- source(ContinuousFunctions.m)

function s = ContinuousFunctions()

    Y = {[1,2],[2,5];@(x) 1,@(x) 2};
    A = 1;
    B = 5;

    %Interval
    disp(evalInterval(Y,A,B));

    %Point
    disp(evalPoint(Y,A));

    Y = {[-inf,inf];@(x) 1./(1 .+ x.^2) };
    A = 0;
    B = inf;

    %Infinite interval
    disp(evalInterval(Y,A,B));


    Y = {[1,2],[2,5];@(x) x,@(x) x.^2};
    A = 0;
    B = 10;
    %Plot of probability function
    [x,y] = getPF(Y,A,B);
    %plot(x,y,'r');

    %Plot of probability density function
    [x,y] = getPDF(Y,A,B);
    %plot(x,y,'r');

    %Cumulative function
    Y = {[1,10];@(x) x.^3.+x.^2};
    disp(getCumulativeFunction(Y));
end


function s = evalInterval(Y,A,B)

	s = 0;

	[rows,columns] = size(Y);

	for (i = 1 : columns)

		interval = Y{1,i};
		iStart = interval(1);
		iEnd = interval(2);
		if (iStart <= B && iEnd >= A)
			if (iStart < A) iStart = A; end
			if (iEnd > B) iEnd = B; end
			s += quadgk(Y{2,i},iStart,iEnd);
		end
	end
end


function s = evalPoint(Y,A)

	[rows,columns] = size(Y);
    s = 0;
	for (i = 1 : columns)

		interval = Y{1,i};
		iStart = interval(1);
		iEnd = interval(2);
		if (iStart <= A && iEnd >= A)
			s = feval(Y{2,i},A);
			break;
		end
	end
end

function [x,y] = getPF(Y,A,B)
    x = [A:0.1:B];
    len = size(x,2);
    y = zeros(1,len);

    for (i = 1:len)
        y(i) = evalPoint(Y,x(i));
    end
end

function [x,y] = getPDF(Y,A,B)
    x = [A:0.1:B];
    len = size(x,2);
    y = zeros(1,len);

    for (i = 1:len)
        y(i) = evalInterval(Y,-inf,x(i));
    end
end

function s = getCumulativeFunction(Y)

    [rows,columns] = size(Y);
    s = 0;

	for (i = 1 : columns)

		interval = Y{1,i};
		iStart = interval(1);
		iEnd = interval(2);
        [x,y] = getPDF(Y,iStart,iEnd);

        s = polyfit(x,y,5);
        poly = "";
        [pRows,pColumns] = size(s);

        for (j = 1 : pColumns)
            coef = round(s(j)*100)/100;
            if (coef != 0)
                poly = cstrcat(poly,num2str(coef,'%+f'),"x^", num2str(pColumns-j)," ");
            end
        end
        s = poly;
    end
end
