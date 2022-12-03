#Link to Day-2 problem: https://adventofcode.com/2022/day/2
{:ok, contents} = File.read("input.txt") #read in input file + verify it gets read properly

String.split(contents, ~r([^A-Z]), trim: true) #split on anything thats not a uppercase letter

|> Enum.map(fn x -> to_charlist(x) end) #convert strings to charlist

|> Enum.chunk_every(2) #break into pairs of 2

|> Enum.map(fn [[you] | [[me]]] -> #pattern match the char values from within the list of char lists (for some reason 'me' needs to be escaped twice to get the char value)
                                cond do #if...
                                    you == me - 23 -> 3 + (me - 87) # there is a tie
                                    (you == 65 and me != 90) or (you == 66 and me != 88) or (you == 67 and me != 89) -> 6 + (me - 87) #I win
                                    true -> me - 87 # you win
                                end
             end
            ) #creates a table of the scores for each game

|> Enum.sum() #sum table

|> IO.puts() #print total
