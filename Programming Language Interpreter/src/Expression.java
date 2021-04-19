import components.simplewriter.SimpleWriter;

/**
 * Put a short phrase describing the program here.
 *
 * @author Yi Chen
 *
 */
public class Expression {
    /**
     * The factor.
     */
    private Factor fac;
    /**
     * The expression.
     */
    private Expression exp;
    /**
     * The number for the plus sign.
     */
    private static final int PLUS = 22;
    /**
     * The number for the minus sign.
     */
    private static final int MINUS = 23;
    /**
     * The alternative number.
     */
    private int altNo;
    /**
     * The number 3.
     */
    private static final int THREE = 3;

    /**
     * Constructor.
     */
    public Expression() {
        this.fac = null;
        this.exp = null;
        this.altNo = 0;
    }

    /**
     * Parses an expression.
     *
     * @param t
     *            the tokenizer.
     */
    public void parseExp(Tokenizer t) {
        this.fac = new Factor();
        this.fac.parseFac(t);
        //Determines alternative number.
        switch (t.getToken()) {
            case PLUS:
                this.altNo = 2;
                t.skipToken();
                this.exp = new Expression();
                this.exp.parseExp(t);
                break;
            case MINUS:
                this.altNo = THREE;
                t.skipToken();
                this.exp = new Expression();
                this.exp.parseExp(t);
                break;
            default:
                this.altNo = 1;
                break;
        }
    }

    /**
     * Prints an expression.
     *
     * @param out
     *            the output stream.
     */
    public void printExp(SimpleWriter out) {
        //Error check.
        if (this.fac == null) {
            System.err.println("Missing a factor.");
            return;
        }
        this.fac.printFac(out);
        //Check alternative number to decide.
        switch (this.altNo) {
            case 2:
                out.print(" + ");
                if (this.exp == null) {
                    System.err.println("Expected an expression.");
                    return;
                }
                this.exp.printExp(out);
                break;
            case THREE:
                out.print(" - ");
                if (this.exp == null) {
                    System.err.println("Expected an expression.");
                    return;
                }
                this.exp.printExp(out);
            default:
                //First alternative
                return;
        }
    }

    /**
     * Evaluates an expression.
     *
     * @return the value of the expression.
     */
    public int evalExp() {
        //Error check.
        if (this.fac == null) {
            System.err.println("Missing a factor.");
            return 0;
        }
        int x = this.fac.evalFac();
        //Check alternative number to decide.
        switch (this.altNo) {
            case 2:
                return x + this.exp.evalExp();
            case THREE:
                return x - this.exp.evalExp();
            default:
                //First alternative.
                return x;
        }
    }
}
