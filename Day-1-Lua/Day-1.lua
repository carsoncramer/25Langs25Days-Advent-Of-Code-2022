
-- Link to Day-1 Problem: https://adventofcode.com/2022/day/1

file = io.input("input.txt", "r");

max = -1
count = 0;
--read in data and then calculate the max
for line in file:lines() do
    if line == "" then
        count = 0
    else
        count = count + tonumber(line)
        if count > max then
            max = count
        end
    end
end

io.write(max)

io.close(file);
