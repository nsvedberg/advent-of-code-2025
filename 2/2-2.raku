#!/usr/bin/env raku
#
# Advent of Code, Day 2: Gift Shop
# Part 2
# 2025-12-02

sub invalid(Int $id) {
    # Break the string into pieces of 1, then 2, and so on...
    for 1 .. $id.chars div 2 -> $divisor {
        next unless $id.chars mod $divisor == 0;

        my $invalid = True;
        my $index = 0;

        until $index == $id.chars - $divisor {
            my $a = $id.substr($index, $divisor);
            my $b = $id.substr($index + $divisor, $divisor);
           
            if $a != $b {
                # If the pieces are different, this cannot be an invalid ID.
                $invalid = False;
                last;
            }

            $index += $divisor;
        }

        # If all pieces are the same, this is an invalid ID.
        return True if $invalid;
    }

    return False;
}

unit sub MAIN ($file);

my $input = $file.IO.slurp;

my $sum = 0;

for $input.split(',') -> $range {
    $range ~~ /(\d+) \- (\d+)/;
   
    for $0 .. $1 -> $id {
        $sum += $id if invalid($id);
    }
}

say "Sum: $sum";
