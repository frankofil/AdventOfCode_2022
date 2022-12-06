function Has_duplicates(window)
    for i = 1, #window do
        local start, _ = string.find(window, window:sub(i, i), i+1)
        if start ~= nil then
            return true
        end
    end
    return false
end

-- Divide input into 4 letter windows
function Process_line(line)
    local answer = nil;
    for i = 1, #line-3 do
        local has_duplicates = Has_duplicates(line:sub(i, i+3))
        if not has_duplicates then
            answer = i + 3
            break
        end
    end
    return answer
end

for line in io.lines("input.txt") do
    print(Process_line(line))
  end