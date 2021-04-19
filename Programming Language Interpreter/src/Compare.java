import components.simplewriter.SimpleWriter;

/**
 * Put a short phrase describing the program here.
 *
 * @author Yi Chen
 *
 */
public class Compare {
    /**
     * The first operand.
     */
    private Operation op1;
    /**
     * The second operand.
     */
    private Operation op2;
    /**
     * The number corresponding to the left parentheses symbol.
     */
    private static final int LEFT_PAREN = 20;
    /**
     * The number corresponding to the right parentheses symbol.
     */
    private static final int RIGHT_PAREN = 21;
    /**
     * The number corresponding to the not equals symbol.
     */
    private static final int NOT_EQUALS = 25;
    /**
     * The number corresponding to the double equals symbol.
     */
    private static final int EQUALS = 26;
    /**
     * The number corresponding to the less than symbol.
     */
    private static final int LESS_THAN = 27;
    /**
     * The number corresponding to the greater than symbol.
     */
    private static final int GREATER_THAN = 28;
    /**
     * The number corresponding to the less than or equal to symbol.
     */
    private static final int LESS_THAN_OR_EQUAL_TO = 29;
    /**
     * The number corresponding to the greater than or equal to symbol.
     */
    private static final int GREATER_THAN_OR_EQUAL_TO = 30;
    /**
     * The alternative number.
     */
    private int altNo;
    /**
     * The number 3.
     */
    private static final int THREE = 3;
    /**
     * The number 4.
     */
    private static final int FOUR = 4;
    /**
     * The number 5.
     */
    private static final int FIVE = 5;
    /**
     * The number 6.
     */
    private static final int SIX = 6;

    /**
     * Constructor.
     */
    public Compare() {
        this.op1 = null;
        this.op2 = null;
        this.altNo = 0;
    }

    /**
     * Parses a comparison.
     *
     * @param t
     *            the tokenizer.
     */
    public void parseComp(Tokenizer t) {
        //Error check.
        if (t.getToken() != LEFT_PAREN) {
            System.err.println("Illegal start of comparison.");
            return;
        }
        t.skipToken();
        this.op1 = new Operation();
        this.op1.parseOP(t);
        //Decide which alternative to use.
        switch (t.getToken()) {
            case NOT_EQUALS:
                this.altNo = 1;
                break;
            case EQUALS:
                this.altNo = 2;
                break;
            case LESS_THAN:
                this.altNo = THREE;
                break;
            case GREATER_THAN:
                this.altNo = FOUR;
                break;
            case LESS_THAN_OR_EQUAL_TO:
                this.altNo = FIVE;
                break;
            case GREATER_THAN_OR_EQUAL_TO:
                this.altNo = SIX;
                break;
            default:
                //Error check.
                System.err.println("Illegal operation");
                return;
        }
        t.skipToken();
        this.op2 = new Operation();
        this.op2.parseOP(t);
        //Error check.
        if (t.getToken() != RIGHT_PAREN) {
            System.err.println("Unclosed parentheses.");
            return;
        }
        t.skipToken();
    }

    /**
     * Prints a comparison.
     *
     * @param out
     *            the output stream.
     */
    public void printComp(SimpleWriter out) {
        out.print("(");
        //Error check.
        if (this.op1 == null || this.op2 == null) {
            System.err.println("One of the variables are null.");
            return;
        }
        this.op1.printOP(out);
        //Prints the symbol depending on the alternative number.
        switch (this.altNo) {
            case 1:
                out.print(" != ");
                break;
            case 2:
                out.print(" == ");
                break;
            case THREE:
                out.print(" < ");
                break;
            case FOUR:
                out.print(" > ");
                break;
            case FIVE:
                out.print(" <= ");
                break;
            case SIX:
                out.print(" >= ");
                break;
            default:
                System.err.println("Illegal operation");
                return;
        }
        this.op2.printOP(out);
        out.print(")");
    }

    /**
     * Evaluates a comparison.
     *
     * @return the value of the comparison.
     */
    public boolean evalComp() {
        //Error check.
        if (this.op1 == null || this.op2 == null) {
            System.err.println("One of the variables are null.");
            return false;
        }
        //Get the values of the operands.
        int a = this.op1.evalOP();
        int b = this.op2.evalOP();
        //Evaluate the operation corresponding to alternative number.
        switch (this.altNo) {
            case 1:
                return a != b;
            case 2:
                return a == b;
            case THREE:
                return a < b;
            case FOUR:
                return a > b;
            case FIVE:
                return a <= b;
            case SIX:
                return a >= b;
            default:
                //Error check.
                System.err.println("Illegal operation");
                return false;
        }
    }
}
