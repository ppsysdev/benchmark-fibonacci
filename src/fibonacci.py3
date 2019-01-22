#!/usr/bin/env python3

import sys


def fibonacci(n):
    if (n > 1):
        return fibonacci(n - 1) + fibonacci(n - 2)
    elif (n == 1):
        return 1
    else:
        return 0


if __name__ == '__main__':
    if len(sys.argv) != 2:
        num = 0
    else:
        num = int(sys.argv[1])

    print ("Fibonacci({0}) : ".format(num), fibonacci(num), "\n")

