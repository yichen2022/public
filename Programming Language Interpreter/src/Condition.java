import components.simplewriter.SimpleWriter;

/**
 * Put a short phrase describing the program here.
 *
 * @author Yi Chen
 *
 */
public class Condition {
    /**
     * The comparison.
     */
    private Compare comp;
    /**
     * The first condition.
     */
    private Condition c1;
    /**
     * The second condition.
     */
    private Condition c2;
    /**
     * The number corresponding to the not token.
     */
    private static final int NOT = 15;
    /**
     * The number corresponding to the left bracket.
     */
    private static final int LEFT_BRACKET = 16;
    /**
     * The number corresponding to the right bracket.
     */
    private static final int RIGHT_BRACKET = 17;
    /**
     * The number corresponding to the and symbol.
     */
    private static final int AND = 18;
    /**
     * The number corresponding to the or symbol.
     */
    private static final int OR = 19;
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
     * Constructor.
     */
    public Condition() {
        this.comp = null;
        this.c1 = null;
        this.c2 = null;
        this.altNo = 0;
    }

    /**
     * Parses a condition.
     *
     * @param t
     *            the tokenizer.
     */
    public void parseCond(Tokenizer t) {
        //Determine the alternative number.
        if (t.getToken() == NOT) {
            this.altNo = 2;
            t.skipToken();
            this.c1 = new Condition();
            this.c1.parseCond(t);
        } else if (t.getToken() == LEFT_BRACKET) {
            t.skipToken();
            this.c1 = new Condition();
            this.c1.parseCond(t);
            //Determine the alternative number whether if and/or.
            if (t.getToken() == AND) {
                this.altNo = THREE;
                t.skipToken();
                this.c2 = new Condition();
                this.c2.parseCond(t);
            } else if (t.getToken() == OR) {
                this.altNo = FOUR;
                t.skipToken();
                this.c2 = new Condition();
                this.c2.parseCond(t);
            } else {
                //Error check.
                System.err.println("Illegal condition");
                return;
            }
            //Error check.
            if (t.getToken() != RIGHT_BRACKET) {
                System.err.println("Unclosed brackets.");
                return;
            }
            t.skipToken();
        } else {
            this.altNo = 1;
            this.comp = new Compare();
            this.comp.parseComp(t);
        }
    }

    /**
     * Prints a condition.
     *
     * @param out
     *            the output stream.
     */
    public void printCond(SimpleWriter out) {
        //Checks the alternative number.
        switch (this.altNo) {
            case 1:
                //Error check.
                if (this.comp == null) {
                    System.err.println("Error: Comparison is missing.");
                    return;
                }
                this.comp.printComp(out);
                break;
            case 2:
                //Error check.
                if (this.c1 == null) {
                    System.err.println("Missing condition.");
                    return;
                }
                out.print("!");
                this.c1.printCond(out);
                break;
            case THREE:
                //Error check.
                if (this.c1 == null || this.c2 == null) {
                    System.err.println("Need two conditions.");
                    return;
                }
                out.print("[");
                this.c1.printCond(out);
                out.print("&&");
                this.c2.printCond(out);
                out.print("]");
                break;
            case FOUR:
                //Error check.
                if (this.c1 == null || this.c2 == null) {
                    System.err.println("Need two conditions.");
                    return;
                }
                out.print("[");
                this.c1.printCond(out);
                out.print("||");
                this.c2.printCond(out);
                out.print("]");
                break;
            default:
                //Error check.
                System.err.println("Illegal condition");
                return;
        }
    }

    /**
     * Evaluates a condition.
     *
     * @return the boolean value of the condition.
     */
    public boolean evalCond() {
        //Checks the alternative number.
        switch (this.altNo) {
            case 1:
                //Error check.
                if (this.comp == null) {
                    System.err.println("Error: Comparison is missing.");
                    return false;
                }
                return this.comp.evalComp();
            case 2:
                //Error check.
                if (this.c1 == null) {
                    System.err.println("Missing condition.");
                    return false;
                }
                return !this.c1.evalCond();
            case THREE:
                //Error check.
                if (this.c1 == null || this.c2 == null) {
                    System.err.println("Need two conditions.");
                    return false;
                }
                boolean b1 = this.c1.evalCond();
                boolean b2 = this.c2.evalCond();
                return b1 && b2;
            case FOUR:
                //Error check.
                if (this.c1 == null || this.c2 == null) {
                    System.err.println("Need two conditions.");
                    return false;
                }
                boolean b3 = this.c1.evalCond();
                boolean b4 = this.c2.evalCond();
                return b3 || b4;
            default:
                //Error check.
                System.err.println("Illegal condition");
                return false;
        }
    }
}
