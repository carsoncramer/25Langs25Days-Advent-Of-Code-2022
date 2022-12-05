#link to problem: https://adventofcode.com/2022/day/3
use strict;
use warnings; #internet told me I need these

open(FH, '<', "input.txt") or die $!; #open file or die lol

my $total = 0; #storing the total as a scalar int

while(<FH>){ #loops through the file line by line
    for my $i (0..((length $_) / 2) - 1){ #loops through the first half of the string
        if(substr($_, (length $_) / 2, length($_)) =~ substr($_, $i, 1)){ #if the second half contains that char from the first half
            if(ord(substr($_, $i, 1)) < 96){ #if its uppercase
                $total += ord(substr($_, $i, 1)) - 38; #add the ascii value - 38
            }
            else{ #if its lowercase
                $total += ord(substr($_, $i, 1)) - 96; #add the ascii value -96
            }
            
            last;
        }
    }
}
print "$total";
close(FH);