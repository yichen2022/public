import components.simplewriter.SimpleWriter;

/**
 * Put a short phrase describing the program here.
 *
 * @author Yi Chen
 *
 */
public class StmtSeq {
    /**
     * The statement.
     */
    private Stmt stmt;
    /**
     * The statement sequence.
     */
    private StmtSeq ss;
    /**
     * The number corresponding to the identifier token.
     */
    private static final int ID = 32;
    /**
     * The number corresponding to the if keyword.
     */
    private static final int IF = 5;
    /**
     * The number corresponding to the while keyword.
     */
    private static final int WHILE = 8;
    /**
     * The number corresponding to the read keyword.
     */
    private static final int READ = 10;
    /**
     * The number corresponding to the write keyword.
     */
    private static final int WRITE = 11;
    /**
     * The alternative number.
     */
    private int altNo;

    /**
     * Constructor.
     */
    public StmtSeq() {
        this.stmt = null;
        this.ss = null;
        this.altNo = 0;
    }

    /**
     * Parses a statement sequence.
     *
     * @param t
     *            the tokenizer.
     */
    public void parseSS(Tokenizer t) {
        this.stmt = new Stmt();
        this.stmt.parseStmt(t);
        //Determine alternative number.
        if (t.getToken() == ID || t.getToken() == IF || t.getToken() == WHILE
                || t.getToken() == READ || t.getToken() == WRITE) {
            this.altNo = 2;
            this.ss = new StmtSeq();
            this.ss.parseSS(t);
        } else {
            this.altNo = 1;
        }
    }

    /**
     * Pretty prints a statement sequence.
     *
     * @param offset
     *            the number of spaces.
     * @param out
     *            the output stream.
     */
    public void printSS(int offset, SimpleWriter out) {
        //Error check.
        if (this.stmt == null) {
            System.err.println("Statement is missing.");
            return;
        }
        this.stmt.printStmt(offset, out);
        //Recursively print statement sequence if second alternative.
        if (this.altNo == 2) {
            //Error check.
            if (this.ss == null) {
                System.err.println("Illegal statement.");
                return;
            }
            this.ss.printSS(offset, out);
        }
    }

    /**
     * Executes a statement sequence.
     *
     */
    public void execSS() {
        //Error check.
        if (this.stmt == null) {
            System.err.println("Statement is missing.");
            return;
        }
        this.stmt.execStmt();
        //Recursively print statement sequence if second alternative.
        if (this.altNo == 2) {
            //Error check.
            if (this.ss == null) {
                System.err.println("Illegal statement.");
                return;
            }
            this.ss.execSS();
        }
    }
}
