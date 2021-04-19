import components.simplewriter.SimpleWriter;
import components.simplewriter.SimpleWriter1L;

/**
 * Put a short phrase describing the program here.
 *
 * @author Yi Chen
 *
 */
public class Stmt {
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
     * The assignment statement.
     */
    private Assignment assign;
    /**
     * The if statement.
     */
    private If ifStatement;
    /**
     * The while statement.
     */
    private Loop whileStatement;
    /**
     * The read statement.
     */
    private Read read;
    /**
     * The write statement.
     */
    private Write write;
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
     * Constructor.
     */
    public Stmt() {
        this.assign = null;
        this.ifStatement = null;
        this.whileStatement = null;
        this.read = null;
        this.write = null;
        this.altNo = 0;
    }

    /**
     * Parses a statement.
     *
     * @param t
     *            the tokenizer.
     */
    public void parseStmt(Tokenizer t) {
        //Determine alternative number.
        switch (t.getToken()) {
            case ID:
                this.altNo = 1;
                this.assign = new Assignment();
                this.assign.parseAssign(t);
                break;
            case IF:
                this.altNo = 2;
                this.ifStatement = new If();
                this.ifStatement.parseIf(t);
                break;
            case WHILE:
                this.altNo = THREE;
                this.whileStatement = new Loop();
                this.whileStatement.parseLoop(t);
                break;
            case READ:
                this.altNo = FOUR;
                this.read = new Read();
                this.read.parseRead(t);
                break;
            case WRITE:
                this.altNo = FIVE;
                this.write = new Write();
                this.write.parseWrite(t);
                break;
            default:
                System.err.println("Illegal statement");
                return;

        }
    }

    /**
     * Pretty prints a statement.
     *
     * @param offset
     *            the number of spaces.
     * @param out
     *            the output stream.
     */
    public void printStmt(int offset, SimpleWriter out) {
        //Performs action based on alternative number.
        switch (this.altNo) {
            case 1:
                //Error check.
                if (this.assign == null) {
                    System.err.println("Need an assignment.");
                    return;
                }
                this.assign.printAssign(offset, out);
                break;
            case 2:
                //Error check.
                if (this.ifStatement == null) {
                    System.err.println("Need an if.");
                    return;
                }
                this.ifStatement.printIf(offset, out);
                break;
            case THREE:
                //Error check.
                if (this.whileStatement == null) {
                    System.err.println("Need an if.");
                    return;
                }
                this.whileStatement.printLoop(offset, out);
                break;
            case FOUR:
                //Error check.
                if (this.read == null) {
                    System.err.println("Need an if.");
                    return;
                }
                this.read.printRead(offset, out);
                break;
            case FIVE:
                //Error check.
                if (this.write == null) {
                    System.err.println("Need an if.");
                    return;
                }
                this.write.printWrite(offset, out);
                break;
            default:
                //Error check.
                System.err.println("Illegal statement");
                return;
        }
    }

    /**
     * Executes a statement.
     *
     */
    public void execStmt() {
        //Performs action based on alternative number.
        switch (this.altNo) {
            case 1:
                //Error check.
                if (this.assign == null) {
                    System.err.println("Need an assignment.");
                    return;
                }
                this.assign.execAssign();
                break;
            case 2:
                //Error check.
                if (this.ifStatement == null) {
                    System.err.println("Need an if.");
                    return;
                }
                this.ifStatement.execIf();
                break;
            case THREE:
                //Error check.
                if (this.whileStatement == null) {
                    System.err.println("Need an if.");
                    return;
                }
                this.whileStatement.execLoop();
                break;
            case FOUR:
                //Error check.
                if (this.read == null) {
                    System.err.println("Need an if.");
                    return;
                }
                SimpleWriter out = new SimpleWriter1L();
                this.read.execRead(out);
                out.close();
                break;
            case FIVE:
                //Error check.
                if (this.write == null) {
                    System.err.println("Need an if.");
                    return;
                }
                out = new SimpleWriter1L();
                this.write.execWrite(out);
                out.close();
                break;
            default:
                //Error check.
                System.err.println("Illegal statement");
                return;
        }
    }
}
