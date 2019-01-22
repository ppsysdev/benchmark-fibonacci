#!/usr/bin/env perl

sub fibonacci {
    my $n = $_[0]; # number

    if ($n > 1) {
        return fibonacci($n - 1) + fibonacci($n - 2);
    } elsif ($n == 1) {
        return 1;
    } else {
        return 0;
    }
}

my $num;
if ($#ARGV == 0) {
    $num = int($ARGV[0]);
} else {
    $num = 0;
}


printf "Fibonacci(%d) : %ld\n", $num, fibonacci($num);
