FIBNUM := 30
BNCHLOG := logs/benchmark-$(FIBNUM).log

default: fibonacci_c fibonacci_cpp fibonacci_py fibonacci_d \
		 fibonacci_nim fibonacci_rust fibonacci_java fibonacci_net \
		 fibonacci_lua fibonacci_js fibonacci_pl

#----------------------------------------------------------

fibonacci_c: src/fibonacci.c
	gcc src/fibonacci.c -o bin/fibonacci_gcc
	gcc -O3 src/fibonacci.c -o bin/fibonacci_gcc_optimized
	clang src/fibonacci.c -o bin/fibonacci_clang
	clang -O3 src/fibonacci.c -o bin/fibonacci_clang_optimized
	clang -Ofast src/fibonacci.c -o bin/fibonacci_clang_fast_optimized

fibonacci_cpp: src/fibonacci.cpp
	g++ src/fibonacci.cpp -o bin/fibonacci_g++
	g++ -O3 src/fibonacci.cpp -o bin/fibonacci_g++_optimized
	clang++ src/fibonacci.cpp -o bin/fibonacci_clang++
	clang++ -O3 src/fibonacci.cpp -o bin/fibonacci_clang++_optimized
	clang++ -Ofast src/fibonacci.cpp -o bin/fibonacci_clang++_fast_optimized

fibonacci_py: src/fibonacci.py2 src/fibonacci.py3
	cp src/fibonacci.py2 bin/fibonacci_py2
	cp src/fibonacci.py3 bin/fibonacci_py3
	chmod +x bin/fibonacci_py2 bin/fibonacci_py3

fibonacci_d: src/fibonacci.d
	dmd -m64 src/fibonacci.d -of=bin/fibonacci_d
	dmd -m64 -O -release -inline -boundscheck=off src/fibonacci.d -of=bin/fibonacci_d_optimized
	@rm -f bin/fibonacci_d*.o

fibonacci_nim: src/fibonacci.nim
	nim c --opt:speed -d:release  -o:bin/fibonacci_nim_speed_optimized src/fibonacci.nim
	@rm -rf src/nimcache

fibonacci_rust: src/fibonacci.rust
	rustc -o bin/fibonacci_rust src/fibonacci.rust
	rustc -o bin/fibonacci_optimized_rust src/fibonacci.rust -O

fibonacci_java: src/fibonacci.java
	javac -d bin/ src/fibonacci.java

fibonacci_net: src/fibonacci.cs
	mcs -out:bin/fibonacci_cs.exe src/fibonacci.cs

fibonacci_lua: src/fibonacci.lua
	luac -o bin/fibonacci_lua.luac src/fibonacci.lua

fibonacci_js: src/fibonacci.js
	cp src/fibonacci.js bin/fibonacci_js.js
	chmod +x bin/fibonacci_js.js

fibonacci_pl: src/fibonacci.pl
	cp src/fibonacci.pl bin/fibonacci_pl5.pl
	chmod +x bin/fibonacci_pl5.pl

#----------------------------------------------------------
benchmark:
	\time -v bin/fibonacci_gcc $(FIBNUM) 2>&1 | tee -a $(BNCHLOG)
	\time -v bin/fibonacci_gcc_optimized  $(FIBNUM) 2>&1 | tee -a $(BNCHLOG)
	\time -v bin/fibonacci_clang $(FIBNUM) 2>&1 | tee -a $(BNCHLOG)
	\time -v bin/fibonacci_clang_optimized $(FIBNUM) 2>&1 | tee -a $(BNCHLOG)
	\time -v bin/fibonacci_clang_fast_optimized $(FIBNUM) 2>&1 | tee -a $(BNCHLOG)
	\time -v bin/fibonacci_g++ $(FIBNUM) 2>&1 | tee -a $(BNCHLOG)
	\time -v bin/fibonacci_g++_optimized $(FIBNUM) 2>&1 | tee -a $(BNCHLOG)
	\time -v bin/fibonacci_clang++ $(FIBNUM) 2>&1 | tee -a $(BNCHLOG)
	\time -v bin/fibonacci_clang++_optimized $(FIBNUM) 2>&1 | tee -a $(BNCHLOG)
	\time -v bin/fibonacci_clang++_fast_optimized $(FIBNUM) 2>&1 | tee -a $(BNCHLOG)
	\time -v bin/fibonacci_py2  $(FIBNUM) 2>&1 | tee -a $(BNCHLOG)
	\time -v bin/fibonacci_py3  $(FIBNUM) 2>&1 | tee -a $(BNCHLOG)
	\time -v bin/fibonacci_d  $(FIBNUM) 2>&1 | tee -a $(BNCHLOG)
	\time -v bin/fibonacci_d_optimized  $(FIBNUM) 2>&1 | tee -a $(BNCHLOG)
	\time -v bin/fibonacci_nim_speed_optimized $(FIBNUM) 2>&1 | tee -a $(BNCHLOG)
	\time -v bin/fibonacci_rust $(FIBNUM) 2>&1 | tee -a $(BNCHLOG)
	\time -v bin/fibonacci_optimized_rust $(FIBNUM) 2>&1 | tee -a $(BNCHLOG)
	\time -v java -cp bin/ Fibonacci $(FIBNUM) 2>&1 | tee -a $(BNCHLOG)
	\time -v bin/fibonacci_cs.exe $(FIBNUM) 2>&1 | tee -a $(BNCHLOG)
	\time -v lua bin/fibonacci_lua.luac $(FIBNUM) 2>&1 | tee -a $(BNCHLOG)
	\time -v bin/fibonacci_js.js  $(FIBNUM) 2>&1 | tee -a $(BNCHLOG)
	\time -v bin/fibonacci_pl5.pl  $(FIBNUM) 2>&1 | tee -a $(BNCHLOG)

# result:
# grep -e 'Command being timed' -e 'wall clock' benchmark-* -h | awk -F':' '{ if($1 ~ /Command being timed/) printf $NF","; else print $(NF-1)":"$(NF); }' > result.csv
# grep -e 'Command being timed' -e 'wall clock' benchmark-* -h | awk -F':' '{ if($1 ~ /Command being timed/) printf $NF","; else print $(NF-1)":"$(NF); }' | xargs -i echo {} | perl -p -e 's/( \d+,)/,$1/'
#
#----------------------------------------------------------

clean:
	@rm -f bin/fibonacci*_* bin/*.class
	@rm -rf src/nimcache
	@rm -f logs/*.log

clean_all:
	clean
	@rm -f bench*.log result.csv
