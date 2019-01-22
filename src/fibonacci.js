#!/usr/bin/env nodejs

const args = process.argv.slice(2);

if(args.length != 1) {
    num = 0;
} else {
    num = args[0];
}

console.log("Fibonacci("+num+") :",fibonacci(num),"\n");

function fibonacci(n)
{
    if(n > 1)
        return fibonacci(n - 1) +  fibonacci(n - 2);
    else if(n == 1)
        return 1;
    else
        return 0;
}
