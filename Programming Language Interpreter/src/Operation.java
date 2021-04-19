import components.simplewriter.SimpleWriter;

/**
 * Put a short phrase describing the program here.
 *
 * @author Yi Chen
 *
 */
public class Operation {
    /**
     * The integer.
     */
    private Number num;
    /**
     * The identifier.
     */
    private Identifier id;
    /**
     * The expression.
     */
    private Expression exp;
    /**
     * The number corresponding to an integer token.
     */
    private static final int INTEGER = 31;
    /**
     * The number corresponding to an identifier token.
     */
    private static final int ID = 32;
    /**
     * The number corresponding to the left parentheses token.
     */
    private static final int LEFT_PAREN = 20;
    /**
     * The number corresponding to the right parentheses token.
     */
    private static final int RIGHT_PAREN = 21;
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
    public Operation() {
        this.num = null;
        this.id = null;
        this.exp = null;
        this.altNo = 0;
    }

    /**
     * Parses an operation.
     *
     * @param t
     *            the tokenizer.
     */
    public void parseOP(Tokenizer t) {
        //Determine alternative number.
        switch (t.getToken()) {
            case LEFT_PAREN:
                this.altNo = THREE;
                t.skipToken();
                this.exp = new Expression();
                this.exp.parseExp(t);
                //Error check.
                if (t.getToken() != RIGHT_PAREN) {
                    System.err.println("Error: Unclosed parentheses.");
                    return;
                }
                t.skipToken();
                break;
            case INTEGER:
                this.altNo = 1;
                this.num = new Number();
                this.num.parseInt(t);
                break;
            case ID:
                this.altNo = 2;
                this.id = Identifier.parseID(t);
                break;
            default:
                System.err.println("Illegal operand.");
                return;
        }
    }

    /**
     * Prints an operation.
     *
     * @param out
     *            the output stream.
     */
    public void printOP(SimpleWriter out) {
        //Performs action based on alternative number.
        switch (this.altNo) {
            case 1:
                //Error check.
                if (this.num == null) {
                    System.err.println("Expecting an integer.");
                    return;
                }
                this.num.printVal(out);
                break;
            case 2:
                //Error check.
                if (this.id == null) {
                    System.err.println("Expecting an Identifier.");
                    return;
                }
                this.id.printIdName(out);
                break;
            case THREE:
                out.print("(");
                //Error check.
                if (this.exp == null) {
                    System.err.println("Expecting an expression.");
                    return;
                }
                this.exp.printExp(out);
                out.print(")");
                break;
            default:
                //Error check.
                System.err.println("Illegal operand");
                return;
        }
    }

    /**
     * Evaluates an operation.
     *
     * @return the value of the operation.
     */
    public int evalOP() {
        //Performs action based on alternative number.
        switch (this.altNo) {
            case 1:
                //Error check.
                if (this.num == null) {
                    System.err.println("Expecting an integer.");
                    return 0;
                }
                return this.num.getVal();
            case 2:
                //Error check.
                if (this.id == null) {
                    System.err.println("Expecting an Identifier.");
                    return 0;
                }
                return this.id.getIdVal();
            case THREE:
                //Error check.
                if (this.exp == null) {
                    System.err.println("Expecting an expression.");
                    return 0;
                }
                return this.exp.evalExp();
            default:
                //Error check.
                System.err.println("Illegal operand");
                return 0;
        }
    }
}
