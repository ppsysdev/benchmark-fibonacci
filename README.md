# benchmark-exec-time
Timing the fibonacci series calculations in different programming languages

*Check results from result.html or result.ods file*


**Reasons for choosing a Fibonacci calculations to test the languages:**
1. Simple to code
2. Easy to implement
3. Tests languages ability to use the stack

#### Operations:
1. Read command line arguments
2. Perform if else
3. Do type casting
4. Call fibonacci function in recursive manner
5. Print the calculated result

Use:
```
make
# FIBNUM: number, to calculate fibonacci number at particular position.
make benchmark FIBNUM=05
make clean
```

**Benchmarking tool: GNU time 1.7**

#### Compiler Versions:
1. gcc 7.3.0
2. g++ 7.3.0
3. clang 6.0.0-1
4. Python 2.7.15
5. Python 3.6.7
6. DMD64 D Compiler v2.084.0
7. rustc 1.29.2 (17a9dc751 2018-10-05)
8. Java version "1.8.0_181"
   Java HotSpot(TM) 64-Bit Server VM (build 25.181-b13, mixed mode)
9. Mono C# compiler version 4.6.2.0
10. Lua 5.3.5
11. NodeJS v10.13.0
12. Perl v5.26.1 (built for x86_64-linux-gnu-thread-multi)

#### Hardware Info:
CPU Model: Intel(R) Core(TM) i5-6200U CPU @ 2.30GHz
CPU Cores: 4
Cache Size: 3072 KB
Bogomips: 4800.00

RAM : 3.72 GB (4 GB)
Swap: 3.73 GB

#### Operating System
Ubuntu 18.04.1 LTS (Bionic Beaver)
Kernel 4.15.0-43-generic x86_64


<br><br><br>

_This work is ideated from discussions on nim-forum, I am greatful for that._
