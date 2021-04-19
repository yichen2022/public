import components.simplewriter.SimpleWriter;

/**
 * Put a short phrase describing the program here.
 *
 * @author Yi Chen
 *
 */
public class Loop {
    /**
     * The condition.
     */
    private Condition cond;
    /**
     * The statement sequence.
     */
    private StmtSeq ss;
    /**
     * The number of the while keyword.
     */
    private static final int WHILE = 8;
    /**
     * The number of the loop keyword.
     */
    private static final int LOOP = 9;
    /**
     * The number of the end keyword.
     */
    private static final int END = 3;
    /**
     * The number of the semicolon symbol.
     */
    private static final int SEMICOLON = 12;
    /**
     * The indent size.
     */
    private static final int INDENT_SIZE = 4;

    /**
     * Constructor.
     */
    public Loop() {
        this.cond = null;
        this.ss = null;
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
     * Parses a while statement.
     *
     * @param t
     *            the tokenizer.
     */
    public void parseLoop(Tokenizer t) {
        //Error check.
        if (t.getToken() != WHILE) {
            System.err.println("Illegal while statement.");
            return;
        }
        t.skipToken();
        this.cond = new Condition();
        this.cond.parseCond(t);
        //Error check.
        if (t.getToken() != LOOP) {
            System.err.println("Missing a loop");
            return;
        }
        t.skipToken();
        this.ss = new StmtSeq();
        this.ss.parseSS(t);
        //Error check.
        if (t.getToken() != END) {
            System.err.println("Expecting end");
            return;
        }
        t.skipToken();
        //Error check.
        if (t.getToken() != SEMICOLON) {
            System.err.println("Missing a semicolon");
            return;
        }
        t.skipToken();
    }

    /**
     * Pretty prints a while statement.
     *
     * @param offset
     *            the number of spaces.
     * @param out
     *            the output stream.
     */
    public void printLoop(int offset, SimpleWriter out) {
        printSpaces(offset, out);
        out.print("while ");
        //Error check.
        if (this.cond == null) {
            System.err.print("Missing a condition");
            return;
        }
        this.cond.printCond(out);
        out.println(" loop");
        //Error check.
        if (this.ss == null) {
            System.err.println("Missing a statement sequence");
            return;
        }
        this.ss.printSS(offset + INDENT_SIZE, out);
        printSpaces(offset, out);
        out.println("end;");
    }

    /**
     * Executes a while statement.
     *
     */
    public void execLoop() {
        //Error check.
        if (this.cond == null) {
            System.err.print("Missing a condition");
            return;
        }
        //Continue execution of statement sequence until condition is false.
        while (this.cond.evalCond()) {
            //Error check.
            if (this.ss == null) {
                System.err.println("Missing a statement sequence");
                return;
            }
            this.ss.execSS();
        }
    }
}
