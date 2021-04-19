import java.util.ArrayList;

import components.simplereader.SimpleReader;
import components.simplereader.SimpleReader1L;
import components.simplewriter.SimpleWriter;

/**
 * Put a short phrase describing the program here.
 *
 * @author Yi Chen
 *
 */
public class Read {
    /**
     * The ID list.
     */
    private IDList idlist;
    /**
     * The read token.
     */
    private static final int READ = 10;
    /**
     * The semicolon token.
     */
    private static final int SEMICOLON = 12;
    /**
     * The input stream.
     */
    private SimpleReader in;

    /**
     * Constructor.
     */
    public Read() {
        this.idlist = null;
        this.in = new SimpleReader1L();
    }

    /**
     * Prints the number of spaces.
     *
     * @param offset
     *            the number of spaces.
     * @param out
     *            the output stream.
     */
    private static void printSpaces(int offset, SimpleWriter out) {
        for (int i = 1; i <= offset; i++) {
            out.print(" ");
        }
    }

    /**
     * Parses a read statement.
     *
     * @param t
     *            the tokenizer.
     */
    public void parseRead(Tokenizer t) {
        //Error check.
        if (t.getToken() != READ) {
            System.err.println("Error: Illegal read statement.");
            return;
        }
        t.skipToken();
        this.idlist = new IDList();
        this.idlist.parseIDList(t);
        //Error check.
        if (t.getToken() != SEMICOLON) {
            System.err.println("Missing a semi-colon.");
            return;
        }
        t.skipToken();
    }

    /**
     * Pretty prints a read statement.
     *
     * @param offset
     *            the number of spaces.
     * @param out
     *            the output stream.
     */
    public void printRead(int offset, SimpleWriter out) {
        printSpaces(offset, out);
        out.print("read ");
        //Error check.
        if (this.idlist == null) {
            System.err.println("No id list");
            return;
        }
        this.idlist.printIDList(out);
        out.println(";");
    }

    /**
     * Executes a read statement. Prompts the user for values of variables.
     *
     * @param out
     *            the output stream.
     */
    public void execRead(SimpleWriter out) {
        ArrayList<Identifier> identifiers = this.idlist
                .execIDList(new ArrayList<Identifier>());
        for (Identifier id : identifiers) {
            //Prompts the user for a value of a variable.
            out.print("Enter a value for " + id.getIdName() + ": ");
            int val = this.in.nextInteger();
            id.setIdVal(val); //Updates the value.
        }
    }
}
