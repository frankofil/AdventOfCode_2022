input = open('input.txt', 'r').read()
data = input.split('\n\n')

output = 0
for x in data:
    temp = 0
    x = x.split()
    for i in x:
        temp += int(i)
    if temp > output:
        output = temp

print(output)
