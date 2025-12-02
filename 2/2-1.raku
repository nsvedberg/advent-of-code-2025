#!/usr/bin/env raku
#
# Advent of Code, Day 2: Gift Shop
# Part 1
# 2025-12-02

unit sub MAIN ($file);

my $input = $file.IO.slurp;

my $sum = 0;

for $input.split(',') -> $range {
    $range ~~ /(\d+) \- (\d+)/;
   
    for $0 .. $1 -> $id {
        next unless $id.chars mod 2 == 0;
       
        my $a = $id.substr(0, $id.chars div 2);
        my $b = $id.substr($id.chars div 2, $id.chars);
       
        if $a == $b {
            $sum += $id;
        }
    }
}

say "Sum: $sum";
