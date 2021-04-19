import components.simplewriter.SimpleWriter;

/**
 * Put a short phrase describing the program here.
 *
 * @author Yi Chen
 *
 */
public class Factor {
    /**
     * The operation.
     */
    private Operation op;
    /**
     * The factor.
     */
    private Factor fac;
    /**
     * The number corresponding to the multiply token.
     */
    private static final int TIMES = 24;
    /**
     * The alternative number.
     */
    private int altNo;

    /**
     * Constructor.
     */
    public Factor() {
        this.op = null;
        this.fac = null;
        this.altNo = 0;
    }

    /**
     * Parses a factor.
     *
     * @param t
     *            the tokenizer.
     */
    public void parseFac(Tokenizer t) {
        this.op = new Operation();
        this.op.parseOP(t);
        //Determine alternative number.
        if (t.getToken() == TIMES) {
            this.altNo = 2;
            t.skipToken();
            this.fac = new Factor();
            this.fac.parseFac(t);
        } else {
            this.altNo = 1;
        }
    }

    /**
     * Prints a factor.
     *
     * @param out
     *            the output stream.
     */
    public void printFac(SimpleWriter out) {
        //Error check.
        if (this.op == null) {
            System.err.println("Illegal factor");
            return;
        }
        this.op.printOP(out);
        //Check alternative number to decide.
        if (this.altNo == 2) {
            //Error check.
            if (this.fac == null) {
                System.err.println("Expecting a factor.");
                return;
            }
            this.fac.printFac(out);
        }
    }

    /**
     * Evaluates a factor.
     *
     * @return the value of the factor.
     */
    public int evalFac() {
        //Error check.
        if (this.op == null) {
            System.err.println("Illegal factor");
            return 0;
        }
        int x = this.op.evalOP();
        //Check alternative number to decide.
        if (this.altNo == 2) {
            //Error check.
            if (this.fac == null) {
                System.err.println("Expecting a factor.");
                return 0;
            }
            return x * this.fac.evalFac();
        }
        return x;
    }
}
