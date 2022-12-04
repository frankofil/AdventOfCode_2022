// Read data
var fs = require("fs");
var readFile = function(path) {
    return fs.readFileSync(path).toString();
};

// Evaluate lines
var sum = 0;
function process_line(line) {
    ranges = line.replaceAll('-', ',').split(',').map(Number);
    if ((ranges[0] <= ranges[2] && ranges[1] >= ranges[3]) 
        || (ranges[0] >= ranges[2] && ranges[1] <= ranges[3]))
    {
            sum += 1;
    }
};

var lines = readFile('input.txt').split('\n');
lines.forEach(process_line);
console.log(sum);