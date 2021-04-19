import components.simplereader.SimpleReader;
import components.simplereader.SimpleReader1L;
import components.simplewriter.SimpleWriter;
import components.simplewriter.SimpleWriter1L;

/**
 * Put a short phrase describing the program here.
 *
 * @author Yi Chen
 *
 */
public final class InterpreterMain {

    /**
     * Private constructor so this utility class cannot be instantiated.
     */
    private InterpreterMain() {
    }

    /**
     * Main method.
     *
     * @param args
     *            the command line arguments
     */
    public static void main(String[] args) {
        /*
         * Get input file name
         */
        String fileName = args[0];
        SimpleReader file = new SimpleReader1L(fileName);
        //The output stream.
        SimpleWriter out = new SimpleWriter1L();
        //The tokenizer.
        Tokenizer t = new Tokenizer(file);
        //The program object.
        Program p = new Program();
        p.parseProg(t); //Parses the program.
        p.printProg(out); //Pretty prints the program.
        p.execProg(); //Executes the program.
        //Closes the input and output streams.
        file.close();
        out.close();
    }

}
