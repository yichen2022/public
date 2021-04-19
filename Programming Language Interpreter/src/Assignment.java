import components.simplewriter.SimpleWriter;

/**
 * Put a short phrase describing the program here.
 *
 * @author Yi Chen
 *
 */
public class Assignment {
    /**
     * The identifier.
     */
    private Identifier id;
    /**
     * The expression.
     */
    private Expression exp;
    /**
     * The number of an identifier token.
     */
    private static final int ID = 32;
    /**
     * The number of the equal sign symbol.
     */
    private static final int EQUALS = 14;
    /**
     * The number of the semicolon.
     */
    private static final int SEMICOLON = 12;

    /**
     * Constructor.
     */
    public Assignment() {
        this.id = null;
        this.exp = null;
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
     * Parses an assignment.
     *
     * @param t
     *            the tokenizer.
     */
    public void parseAssign(Tokenizer t) {
        //Error check.
        if (t.getToken() != ID) {
            System.err.println("Error: Invalid identifier");
        }
        this.id = Identifier.parseID(t);
        //Error check.
        if (t.getToken() != EQUALS) {
            System.err.println("Error: Illegal token");
            return;
        }
        t.skipToken();
        this.exp = new Expression();
        this.exp.parseExp(t);
        //Error check.
        if (t.getToken() != SEMICOLON) {
            System.err.println("Missing a semi-colon.");
            return;
        }
        t.skipToken();
    }

    /**
     * Pretty prints an assignment statement.
     *
     * @param offset
     *            the number of spaces.
     * @param out
     *            the output stream.
     */
    public void printAssign(int offset, SimpleWriter out) {
        //Error check.
        if (this.id == null) {
            System.err.println("Missing an identifier");
            return;
        }
        printSpaces(offset, out);
        this.id.printIdName(out);
        out.print(" = ");
        //Error check.
        if (this.exp == null) {
            System.err.println("Missing an expression");
            return;
        }
        this.exp.printExp(out);
        out.println(";");
    }

    /**
     * Executes an assignment statement.
     *
     */
    public void execAssign() {
        //Error check.
        if (this.id == null) {
            System.err.println("Missing an identifier");
            return;
        }
        //Error check.
        if (this.exp == null) {
            System.err.println("Missing an expression");
            return;
        }
        int val = this.exp.evalExp();
        this.id.setIdVal(val); //Updates the value of the identifier.
    }
}
