#include <iostream>
#include <cstdlib>

long fibonacci(int n);

int main(int argc, char* argv[])
{
    int num;

    if(argc != 2)
        num = 0;
    else
        num = std::atoi(argv[1]);

    std::cout << "Fibonacci(" << num << ") : " << fibonacci(num) << std::endl;

    return 0;
}

long fibonacci(int n)
{
    if(n > 1)
        return fibonacci(n - 1) +  fibonacci(n - 2);
    else if(n == 1)
        return 1;
    else
        return 0;
}
