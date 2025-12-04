#!/usr/bin/env raku
#
# Advent of Code, Day 3: Lobby
# 2025-12-03

my sub activate(@bank, Int $n) {
    my @batteries of Int;

    for 1..$n -> $k {
        my $bat;
        my $start = @batteries.tail // -1;

        for $start ^..^ @bank.elems-$n+$k -> $index {
            $bat //= $index;
            $bat = $index if @bank[$index] > @bank[$bat];
        }

        @batteries.push($bat);
    }

    return @batteries.map({ @bank[$_] }).join.Int;
}

unit sub MAIN ($file);

my $input = $file.IO.slurp;

my $sum1 = 0;
my $sum2 = 0;

for $input.lines.map: { .comb.map({ .Int }) } -> @bank {
    $sum1 += activate(@bank, 2);
    $sum2 += activate(@bank, 12);
}

say "Sum (part 1): $sum1";
say "Sum (part 2): $sum2";
