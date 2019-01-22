class Fibonacci{

    public Fibonacci(){

    }

    public static void main(String args[]){
        Integer num;

        if(args.length != 1)
            num = 0;
        else
            num = Integer.valueOf(args[0]);

        Fibonacci fib = new Fibonacci();

        System.out.println("Fibonacci("+num+") : "+ fib.fibonacci(num));
    }

    private Long fibonacci(Integer n){
        if(n > 1)
            return fibonacci(n - 1) +  fibonacci(n - 2);
        else if(n == 1)
            return Long.valueOf(1);
        else
            return Long.valueOf(0);
    }
}
