using System;

class Fibonacci{

    public Fibonacci(){

    }

    static void Main(string[] args){
        Int32 num;

        if(args.Length != 1)
            num = 0;
        else
            num = Int32.Parse(args[0]);

        Fibonacci fib = new Fibonacci();

        System.Console.WriteLine("Fibonacci("+num+") : "+ fib.fibonacci(num));
    }

    private Int64 fibonacci(Int32 n){
        if(n > 1)
            return fibonacci(n - 1) +  fibonacci(n - 2);
        else if(n == 1)
            return Convert.ToInt64(1);
        else
            return Convert.ToInt64(0);
    }
}
