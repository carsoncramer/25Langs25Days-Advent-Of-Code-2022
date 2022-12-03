#Link to Day-2 problem: https://adventofcode.com/2022/day/2
{:ok, contents} = File.read("input.txt") #read in input file + verify it gets read properly

String.split(contents, ~r([^A-Z]), trim: true) #split on anything thats not a uppercase letter

|> Enum.map(fn x -> to_charlist(x) end) #convert strings to charlist

|> Enum.chunk_every(2) #break into pairs of 2

|> Enum.map(fn [[you] | [[me]]] -> #pattern match the char values from within the list of char lists (for some reason 'me' needs to be escaped twice to get the char value)
                                cond do #if...
                                    me == 88 -> (case you do 65 -> 3; 66 -> 1; 67 -> 2 end) #I need to lose
                                    me == 89 -> 3 + (you - 64) #I need to tie
                                    me == 90 -> 6 + (case you do 65 -> 2; 66 -> 3; 67 -> 1 end) # I need to win
                                end
             end
            ) #creates a table of the scores for each game

|> Enum.sum() #sum table

|> IO.puts() #print total
