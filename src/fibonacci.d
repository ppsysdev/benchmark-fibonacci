import std.conv, std.stdio;

void main(string[] argv)
{
    int num;

    if (argv.length != 2)
        num = 0;
    else
        num = to!int(argv[1]);

    printf("Fibonacci(%d) : ", num);
    fibonacci(num).writeln;
}

float fibonacci(int n)
{
    if (n > 1)
        return fibonacci(n - 1) + fibonacci(n - 2);
    else if (n == 1)
        return (1).to!float;
    else
        return (0).to!float;
}
