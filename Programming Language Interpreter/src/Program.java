import components.simplewriter.SimpleWriter;

/**
 * Put a short phrase describing the program here.
 *
 * @author Yi Chen
 *
 */
public class Program {
    /**
     * The declaration sequence.
     */
    private DeclSeq ds;
    /**
     * The statement sequence.
     */
    private StmtSeq ss;
    /**
     * The number of the program keyword.
     */
    private static final int PROGRAM = 1;
    /**
     * The number of the begin keyword.
     */
    private static final int BEGIN = 2;
    /**
     * The number of the end keyword.
     */
    private static final int END = 3;
    /**
     * The indent size.
     */
    private static final int INDENT_SIZE = 4;

    /**
     * Constructor.
     */
    public Program() {
        this.ds = null;
        this.ss = null;
    }

    /**
     * Parses a program.
     *
     * @param t
     *            the tokenizer.
     */
    public void parseProg(Tokenizer t) {
        //Error check.
        if (t.getToken() != PROGRAM) {
            System.err.println("Illegal program.");
            return;
        }
        t.skipToken();
        this.ds = new DeclSeq();
        this.ds.parseDS(t);
        //Error check.
        if (t.getToken() != BEGIN) {
            System.err.println("Illegal program");
            return;
        }
        t.skipToken();
        this.ss = new StmtSeq();
        this.ss.parseSS(t);
        //Error check.
        if (t.getToken() != END) {
            System.err.println("Illegal program");
            return;
        }
        t.skipToken();
    }

    /**
     * Pretty prints a program.
     *
     * @param out
     *            the output stream.
     */
    public void printProg(SimpleWriter out) {
        out.println("program");
        //Error check.
        if (this.ds == null) {
            System.err.println("Missing declaration sequence.");
            return;
        }
        this.ds.printDS(out);
        out.println("begin");
        //Error check.
        if (this.ss == null) {
            System.err.println("Missing statement sequence");
            return;
        }
        this.ss.printSS(INDENT_SIZE, out);
        out.println("end");
        out.println();
    }

    /**
     * Executes a program.
     *
     */
    public void execProg() {
        //Error check.
        if (this.ds == null) {
            System.err.println("Missing declaration sequence.");
            return;
        }
        this.ds.execDS();
        //Error check.
        if (this.ss == null) {
            System.err.println("Missing statement sequence");
            return;
        }
        this.ss.execSS();
    }
}
