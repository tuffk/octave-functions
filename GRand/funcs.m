source("funcNumRands.m");

function x = setVar(gen, lg)
    #variables globales para trabajar más facilmente
    global GEN;
    global LG;
    global X0;

    GEN = gen;
    LG = lg;
    X0 = lg(1);
end

function r = randC()
    global GEN;
    global LG;
    global X0;

    if (GEN == "mixto")
        r = mix(X0,LG(2), LG(3), LG(4));
    else
        r = mult(X0, LG(2), LG(3));
    end

    #En caso de loop
    if (X0 == r)
        X0 = LG(1);
    else
        X0 = r;
    end

    #Para que quede en un rango de [0,1]
    r = X0/LG(4);
end



#Generador de función uniforme

function xs = uni(a,b,c,N,M)
    m = c;
    xs = zeros(1,N);
    i = 1;
    while (i <= N)
        r1 = randC();
        r2 = randC();
        x = a + ( b - a ) * r1;
        f = 1/(b-a);
        if (r2 <= f/m)
            xs(i) = r1;
            i++;
        end
    end
    hist(xs,M);
end


#Generador de función exponencial

function xs = exp(a,b,N,M)
    m = e^b;
    xs = zeros(1,N);
    i = 1;
    while (i <= N)
        r1 = randC();
        r2 = randC();
        x = a + ( b - a ) * r1;
        f = e^x;
        if (r2 <= f/m)
            xs(i) = r1;
            i++;
        end
    end
    hist(xs,M);
end


#Generador de función normal

function xs = norm(a,b,u,o,N,M)
    m = 1 / (o *(2*pi)^(1/2));
    xs = zeros(1,N);
    i = 1;
    while (i <= N)
        r1 = randC();
        r2 = randC();
        x = a + ( b - a ) * r1;
        f = 1/(o*(2*pi)^(1/2)) * e ^ (-(x-u)^2 / (2*o^2));
        if (r2 <= f/m)
            xs(i) = r1;
            i++;
        end
    end
    hist(xs,M);
end


#Generador de función triangular

function xs = tria(a,b,c,N,M)
    m = 2 / (b-a);
    xs = zeros(1,N);
    i = 1;
    while (i <= N)
        r1 = randC();
        r2 = randC();
        x = a + ( b - a ) * r1;
        f = 0;

        if (x >= a && x < c)
            f = 2*(x-a) / ((b-a)*(c-a));
        end

        if (x >= c && x < b)
            f = 2*(b-x) / ((b-a)*(b-c));
        end

        if (r2 <= f/m)
            xs(i) = r1;
            i++;
        end
    end
    hist(xs,M);
end


#Generador de función poisson

function xs = pois(a,b,c,N,M)
    m = c-1;
    xs = zeros(1,N);
    i = 1;
    while (i <= N)
        r1 = randC();
        r2 = randC();
        x = ceil(a + ( b - a ) * r1);
        f = (c ^ x) * (e ^(-c)) / factorial(x);

        if (r2 <= f/m)
            xs(i) = r1;
            i++;
        end
    end
    hist(xs,M);
end


#Generador de función binomial

function y = bino(a,b,c,N,M)

    m = (b-a)*u;

    xs = zeros(1,N);
    i = 1;
    while (i <= N)
        r1 = randC();
        r2 = randC();
        x = ceil(a + ( b - a ) * r1);
        if (x >= c)

            f = factorial(x) / (factorial(c) * factorial(x-c)) * u ^ c * (1-u) ^ (x-c);

            if (r2 <= f/m)
                xs(i) = r1;
                i++;
            end
        end
    end
    hist(xs,M);
end
