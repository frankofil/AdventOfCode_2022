# This is my very stubborn approch of representing a tree structure without implementing a tree, enjoy :)

$stack = []
$answer = 0
$goal_size = 100000

def process_line(line)
    if line["$ cd "] != nil
        if line.split()[2] == ".."
            last = $stack.pop
            if $stack.length > 0
                $stack[-1] += last
            end
            if last <= $goal_size
                $answer += last
            end
        else
            $stack.append(0)
        end
    elsif line.split()[0] !~ /\D/
        $stack[-1] += line.split()[0].to_i
    end
end

File.foreach("input.txt") {|line| process_line(line)}
# Clear stack
while $stack.length > 0
    process_line("$ cd ..")
end
puts $answer