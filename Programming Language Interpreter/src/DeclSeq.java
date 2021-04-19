import components.simplewriter.SimpleWriter;

/**
 * Put a short phrase describing the program here.
 *
 * @author Yi Chen
 *
 */
public class DeclSeq {
    /**
     * The declaration.
     */
    private Decl decl;
    /**
     * The declaration sequence.
     */
    private DeclSeq ds;
    /**
     * The number corresponding to the int keyword.
     */
    private static final int INT = 4;
    /**
     * The alternative number.
     */
    private int altNo;

    /**
     * Constructor.
     */
    public DeclSeq() {
        this.decl = null;
        this.ds = null;
        this.altNo = 0;
    }

    /**
     * Parses a declaration sequence.
     *
     * @param t
     *            the tokenizer.
     */
    public void parseDS(Tokenizer t) {
        this.decl = new Decl();
        this.decl.parseDecl(t);
        //Decide alternative number.
        if (t.getToken() == INT) {
            this.altNo = 2;
            this.ds = new DeclSeq();
            this.ds.parseDS(t);
        } else {
            this.altNo = 1;
        }
    }

    /**
     * Prints a declaration sequence.
     *
     * @param out
     *            the output stream.
     */
    public void printDS(SimpleWriter out) {
        //Error check.
        if (this.decl == null) {
            System.err.println("Missing a declaration.");
            return;
        }
        this.decl.printDecl(out);
        //Recursive descent if second alternative.
        if (this.altNo == 2) {
            //Error check.
            if (this.ds == null) {
                System.err.println("Illegal declaration");
                return;
            }
            this.ds.printDS(out);
        }
    }

    /**
     * Executes a declaration sequence.
     *
     */
    public void execDS() {
        //Error check.
        if (this.decl == null) {
            System.err.println("Missing a declaration.");
            return;
        }
        this.decl.execDecl();
        //Recursive descent if second alternative.
        if (this.altNo == 2) {
            //Error check.
            if (this.ds == null) {
                System.err.println("Illegal declaration");
                return;
            }
            this.ds.execDS();
        }
    }
}
