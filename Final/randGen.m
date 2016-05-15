function x = randGen(D, arr)

D = toupper(D);

switch (D)
    case "M"
        x = exprnd(arr(1));

    case "N"
        x = normrnd(arr(1), arr(2));

    case "U"
        x = unifrnd(arr(1), arr(2));
end

x = round(x * 100);

end
