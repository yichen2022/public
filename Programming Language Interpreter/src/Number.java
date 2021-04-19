import components.simplewriter.SimpleWriter;

/**
 * Put a short phrase describing the program here.
 *
 * @author Yi Chen
 *
 */
public class Number {
    /**
     * The value of the integer.
     */
    private int val;
    /**
     * The token number of an integer.
     */
    private static final int INTEGER = 31;

    /**
     * Constructor.
     */
    public Number() {
        this.val = 0;
    }

    /**
     * Parses an integer.
     *
     * @param t
     *            the tokenizer.
     */
    public void parseInt(Tokenizer t) {
        //Error check.
        if (t.getToken() != INTEGER) {
            System.err.println("Error: Not an integer.");
            return;
        }
        this.val = t.intVal();
        t.skipToken();
    }

    /**
     * Prints the value.
     *
     * @param out
     *            the output stream.
     */
    public void printVal(SimpleWriter out) {
        out.print(this.val);
    }

    /**
     * Returns the value of the integer.
     *
     * @return the integer value.
     */
    public int getVal() {
        return this.val;
    }
}
