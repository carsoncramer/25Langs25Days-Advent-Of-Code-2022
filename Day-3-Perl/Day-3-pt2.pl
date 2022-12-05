#link to problem: https://adventofcode.com/2022/day/3
use strict;
use warnings; #internet told me I need these

open(FH, '<', "input.txt") or die $!; #open file or die lol

my $total = 0; #storing the total as a scalar int
my @lines = (); #empty array that will hold the input
while(<FH>){ #loops through the file line by line
    push @lines, $_; #add to array
    if(scalar(@lines) == 3){ #once it hits 3 elements
        for my $i (0..(length $lines[0])){ #loops through the first string
            if(($lines[1] =~ substr($lines[0], $i, 1)) and ($lines[2] =~ substr($lines[0], $i, 1))){ #if the other two strings contain that char
                if(ord(substr($lines[0], $i, 1)) < 96){ #if its uppercase
                    $total += ord(substr($lines[0], $i, 1)) - 38; #add the ascii value - 38
                }
                else{ #if its lowercase
                    $total += ord(substr($lines[0], $i, 1)) - 96; #add the ascii value -96
                }
                last;
            }
        }
        for(0..3){ #empty the array
            pop @lines;
        }
    }
}
print "$total";
close(FH);