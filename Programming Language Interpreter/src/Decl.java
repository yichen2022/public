import java.util.ArrayList;

import components.simplewriter.SimpleWriter;

/**
 * Put a short phrase describing the program here.
 *
 * @author Yi Chen
 *
 */
public class Decl {
    /**
     * The number corresponding to the int keyword.
     */
    private static final int INT = 4;
    /**
     * The number corresponding to the semicolon symbol.
     */
    private static final int SEMICOLON = 12;
    /**
     * The ID list.
     */
    private IDList idlist;
    /**
     * The indent size.
     */
    private static final int INDENT_SIZE = 4;

    /**
     * Constructor.
     */
    public Decl() {
        this.idlist = null;
    }

    /**
     * Prints the number of spaces.
     *
     * @param offset
     *            the number of spaces to print.
     * @param out
     *            the output stream.
     */
    private static void printSpaces(int offset, SimpleWriter out) {
        for (int i = 1; i <= offset; i++) {
            out.print(" ");
        }
    }

    /**
     * Parses a declaration.
     *
     * @param t
     *            the tokenizer.
     */
    public void parseDecl(Tokenizer t) {
        //Error check.
        if (t.getToken() != INT) {
            System.err.println("Error: Invalid declaration.");
            return;
        }
        t.skipToken();
        this.idlist = new IDList();
        this.idlist.parseIDList(t);
        //Error check.
        if (t.getToken() != SEMICOLON) {
            System.err.println("Missing a semi-colon");
            return;
        }
        t.skipToken();
    }

    /**
     * Pretty prints a declaration.
     *
     * @param out
     *            the output stream.
     */
    public void printDecl(SimpleWriter out) {
        printSpaces(INDENT_SIZE, out);
        out.print("int ");
        //Error check.
        if (this.idlist == null) {
            System.err.println("Missing identifier list.");
            return;
        }
        this.idlist.printIDList(out);
        out.println(";");
    }

    /**
     * Executes a declaration.
     *
     */
    public void execDecl() {
        //Error check.
        if (this.idlist == null) {
            System.err.println("Missing identifier list.");
            return;
        }
        this.idlist.execIDList(new ArrayList<Identifier>());
    }
}
