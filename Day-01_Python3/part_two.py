input = open('input.txt', 'r').read()
data = input.split('\n\n')

output = []
for x in data:
    temp = 0
    x = x.split()
    for i in x:
        temp += int(i)
    output.append(temp)
output.sort(reverse=True)

print(sum(output[:3]))
