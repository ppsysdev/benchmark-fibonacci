local function fibonacci(n)
    if n > 1 then
        return fibonacci(n - 1) +  fibonacci(n - 2);
    elseif n == 1 then
        return 1;
    else
        return 0;
    end
end

function main(argc, argv)
    local num;

    if argc ~= 1 then
        num = 0;
    else
        num = tonumber(argv[1]);
    end

    print("Fibonacci("..num..") : "..fibonacci(num).."\n");
end

main(#arg, arg);

