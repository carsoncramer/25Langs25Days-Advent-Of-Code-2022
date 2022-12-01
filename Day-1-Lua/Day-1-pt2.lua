
-- Link to Day-1 Problem: https://adventofcode.com/2022/day/1

file = io.input("input.txt", "r");


storage = {}
count = 0
-- put all of the data into storage
for line in file:lines() do
    if line == "" then
        storage[#storage + 1] = count
        count = 0
    else
        count = count + tonumber(line)
    end
end
--sort it based on value
table.sort(storage, function(a, b) return a > b end)

--sum the 3 highest values
i = 0
total = 0
for k, v in ipairs(storage) do
    if i < 3 then
        total = total + v
        i = i + 1
    else
        break
    end 
end

print(total)

io.close(file);
