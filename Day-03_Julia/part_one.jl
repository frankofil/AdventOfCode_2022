function process_rucksack(line)
    len = length(line)
    rs1 = SubString(line, 1, Int(len/2))
    rs2 = SubString(line, Int(len/2+1), len)
    for i in eachindex(rs1)
        for j in eachindex(rs2)
            if rs1[i] == rs2[j]
                if rs1[i] >= 'a' && rs1[i] <= 'z'
                    return rs1[i] - 'a' + 1
                elseif rs1[i] >= 'A' && rs1[i] <= 'Z'
                    return rs1[i] - 'A' + 27
                end
            end
        end
    end
    return 0
end

function process_group(l1, l2, l3)
    
end

sum = 0

open("input.txt", "r") do f
    for line in eachline(f)
        global sum += process_rucksack(line)
    end
end

println(sum)
