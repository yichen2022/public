import components.simplewriter.SimpleWriter;

/**
 * Put a short phrase describing the program here.
 *
 * @author Yi Chen
 *
 */
public class If {
    /**
     * The condition.
     */
    private Condition cond;
    /**
     * The first statement sequence.
     */
    private StmtSeq ss1;
    /**
     * The second statement sequence.
     */
    private StmtSeq ss2;
    /**
     * The if keyword.
     */
    private static final int IF = 5;
    /**
     * The then keyword.
     */
    private static final int THEN = 6;
    /**
     * The else keyword.
     */
    private static final int ELSE = 7;
    /**
     * The end keyword.
     */
    private static final int END = 3;
    /**
     * The semicolon symbol.
     */
    private static final int SEMICOLON = 12;
    /**
     * The indent size.
     */
    private static final int INDENT_SIZE = 4;
    /**
     * The alternative number.
     */
    private int altNo;

    /**
     * Constructor.
     */
    public If() {
        this.cond = null;
        this.ss1 = null;
        this.ss2 = null;
        this.altNo = 0;
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
     * Parses an if statement.
     *
     * @param t
     *            the tokenizer.
     */
    public void parseIf(Tokenizer t) {
        //Error check.
        if (t.getToken() != IF) {
            System.err.println("Illegal if token.");
            return;
        }
        t.skipToken();
        this.cond = new Condition();
        this.cond.parseCond(t);
        //Error check.
        if (t.getToken() != THEN) {
            System.err.println("Missing a then.");
            return;
        }
        t.skipToken();
        this.ss1 = new StmtSeq();
        this.ss1.parseSS(t);
        //If there is else, second alternative.
        if (t.getToken() == ELSE) {
            this.altNo = 2;
            t.skipToken();
            this.ss2 = new StmtSeq();
            this.ss2.parseSS(t);
        } else {
            this.altNo = 1;
        }
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
     * Pretty prints an if statement.
     *
     * @param offset
     *            the number of spaces.
     * @param out
     *            the output stream.
     */
    public void printIf(int offset, SimpleWriter out) {
        printSpaces(offset, out);
        out.print("if ");
        //Error check.
        if (this.cond == null) {
            System.err.println("Missing a condition");
            return;
        }
        this.cond.printCond(out);
        out.println(" then");
        //Error check.
        if (this.ss1 == null) {
            System.err.println("Missing a statement sequence");
            return;
        }
        this.ss1.printSS(offset + INDENT_SIZE, out);
        //If there is else, print else statement sequence.
        if (this.altNo == 2) {
            //Error check.
            if (this.ss2 == null) {
                System.err.println("Missing a statement sequence for else.");
                return;
            }
            printSpaces(offset, out);
            out.println("else");
            this.ss2.printSS(offset + INDENT_SIZE, out);
        }
        printSpaces(offset, out);
        out.println("end;");
    }

    /**
     * Executes an if statement.
     *
     */
    public void execIf() {
        //Error check.
        if (this.cond == null) {
            System.err.println("Missing a condition");
            return;
        }
        //Evaluate condition
        boolean b = this.cond.evalCond();
        //If true, execute the statement sequence.
        if (b) {
            //Error check.
            if (this.ss1 == null) {
                System.err.println("Missing a statement sequence");
                return;
            }
            this.ss1.execSS();
        } else if (this.altNo == 2) { //Executes else statement if present.
            //Error check.
            if (this.ss2 == null) {
                System.err.println("Missing a statement sequence for else.");
                return;
            }
            this.ss2.execSS();
        }
    }
}
