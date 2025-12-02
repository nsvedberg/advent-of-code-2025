#!/usr/bin/env raku
#
# Advent of Code, Day 1: Secret Entrance
# 2025-12-01

unit sub MAIN ($file);

my $input = open $file;
my Int $position = 50;

my Int $count1 = 0;
my Int $count2 = 0;

for $input.lines -> $line {
    $line ~~ / (<[LR]>) (\d+) /;

    my Int $turn = $1 * ($0 eq 'L' ?? -1 !! 1);

    # Correct for edge case
    $count2 -= 1 if $position == 0 and $turn < 0;

    # Update position
    $position += $turn;
    # Update count if position passed through zero
    $count2 += abs($position div 100);

    # Handle wrapping
    $position = $position % 100;
    $position += 100 if $position < 0;

    # Correct for edge case
    $count2 += 1 if $position == 0 and $turn < 0;

    # Update count if position ended on zero 
    $count1 += 1 if $position == 0;
}

say "Part one: $count1, part two: $count2";
