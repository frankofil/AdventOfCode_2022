import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.util.*;

public class PartTwo {

    private List<Stack<String>> stacks = new ArrayList<Stack<String>>();
    
    private void processLine(String line) {
       String[] commands = line.split(" ");
       int moves = Integer.parseInt(commands[1]);
       int moveFrom = Integer.parseInt(commands[3]) - 1;
       int moveTo = Integer.parseInt(commands[5]) - 1;

       ArrayList<String> tempArr = new ArrayList<>();
       
        for (int i = 0; i < moves; i++)
        {
            tempArr.add(stacks.get(moveFrom).pop());
        }
        for (int i = tempArr.size() - 1; i >= 0; i--)
        {
            stacks.get(moveTo).push(tempArr.get(i));
        }
    }

    private void initializeData() {
        String[][] _stacks = {
            {"W", "M", "L", "F"},
            {"B", "Z", "V", "M", "F"},
            {"H", "V", "R", "S", "L", "Q"},
            {"F", "S", "V", "Q", "P", "M", "T", "J"},
            {"L", "S", "W"},
            {"F", "V", "P", "M", "R", "J", "W"},
            {"J", "Q", "C", "P", "N", "R", "F"},
            {"V", "H", "P", "S", "Z", "W", "R", "B"},
            {"B", "M", "J", "C", "G", "H", "Z", "W"}
        };

        for (int i = 0; i < _stacks.length; i++)
        {
            boolean initialized = false;
            for (String elem : _stacks[i])
            {
                if (!initialized)
                {
                    stacks.add(new Stack<>());
                    initialized = true;
                }
                this.stacks.get(i).push(elem);
            }
        }
    }

    private void printResult()
    {
        for (Stack<String> _stack : stacks)
        {
            System.out.print(_stack.peek());
        }
        System.out.println();
    }

    public static void main(String[] args) throws FileNotFoundException, IOException {
        PartTwo app = new PartTwo();
        app.initializeData();

        FileReader fr = new FileReader("input.txt");
        BufferedReader br = new BufferedReader(fr);
        String line;
        while ((line = br.readLine()) != null) {
            app.processLine(line);
        }
        br.close();
        fr.close();

        app.printResult();
    }
}

