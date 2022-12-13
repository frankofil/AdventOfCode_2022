# This is my very stubborn approch of representing a tree structure without implementing a tree, enjoy :)

$stack = []
$directories = []

def process_line(line)
    if line["$ cd "] != nil
        if line.split[2] == ".."
            $directories.append($stack.pop)
            if $stack.length > 0
                $stack[-1] += $directories[-1]
            end
        else
            $stack.append(0)
        end
    elsif line.split[0] !~ /\D/
        $stack[-1] += line.split()[0].to_i
    end
end

File.foreach("input.txt") {|line| process_line(line)}
# Clear stack
while $stack.length > 0
    process_line("$ cd ..")
end
needed_space = 30000000 - (70000000 - $directories[-1])
puts $directories.reject{|x| x <= needed_space}.sort[0]