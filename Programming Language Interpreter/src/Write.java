import java.util.ArrayList;

import components.simplewriter.SimpleWriter;

/**
 * Put a short phrase describing the program here.
 *
 * @author Yi Chen
 *
 */
public class Write {
    /**
     * The ID list.
     */
    private IDList idlist;
    /**
     * The value of the write keyword.
     */
    private static final int WRITE = 11;
    /**
     * The value of the semicolon.
     */
    private static final int SEMICOLON = 12;

    /**
     * Constructor.
     */
    public Write() {
        this.idlist = null;
    }

    /**
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
     * Parses a write statement.
     *
     * @param t
     *            the tokenizer.
     */
    public void parseWrite(Tokenizer t) {
        //Error check.
        if (t.getToken() != WRITE) {
            System.err.println("Error: Illegal write statement.");
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
     * Pretty prints a write statement.
     *
     * @param offset
     *            the number of spaces.
     * @param out
     *            the output stream.
     */
    public void printWrite(int offset, SimpleWriter out) {
        printSpaces(offset, out);
        out.print("write ");
        //Error check.
        if (this.idlist == null) {
            System.err.println("No id list");
            return;
        }
        this.idlist.printIDList(out);
        out.println(";");
    }

    /**
     * Executes a write statements.
     *
     * @param out
     *            the output stream.
     */
    public void execWrite(SimpleWriter out) {
        //All identifiers.
        ArrayList<Identifier> identifiers = this.idlist
                .execIDList(new ArrayList<Identifier>());
        for (Identifier id : identifiers) {
            //Undefined name check.
//            if (!symbols.hasKey(s)) {
//                System.err.println(s + " is not defined.");
//                return;
//            }
            out.println(id.getIdName() + " = " + id.getIdVal());
        }
    }
}
