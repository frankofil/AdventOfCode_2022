function process_group(l1, l2, l3)
    for i in eachindex(l1)
        if findnext(l1[i], l2, 1) !== nothing && findnext(l1[i], l3, 1) !== nothing
            if l1[i] >= 'a' && l1[i] <= 'z'
                return l1[i] - 'a' + 1
            elseif l1[i] >= 'A' && l1[i] <= 'Z'
                return l1[i] - 'A' + 27
            end
        end
    end
    return 0
end

sum = 0
open("input.txt", "r") do f
    lines = []
    for line in eachline(f)
        if length(lines) == 3
            global sum += process_group(lines[1], lines[2], lines[3])
            lines = [line]
        else
            push!(lines, line)
        end
    end
    global sum += process_group(lines[1], lines[2], lines[3])
end

println(sum)
