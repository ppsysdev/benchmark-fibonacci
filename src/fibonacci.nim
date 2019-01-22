import os
import strutils

proc fibonacci(n: int): float =
    if n > 1:
        result = fibonacci(n-1) + fibonacci(n-2)
    elif n == 1:
        result = float(n)
    else:
        result = float(0)

var num = 0

if paramCount() == 1:
    num = parseInt(commandLineParams()[0]);

echo "Fibonacci(",num,") : ",fibonacci(num)
