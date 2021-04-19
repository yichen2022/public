import components.simplewriter.SimpleWriter;

/**
 * Put a short phrase describing the program here.
 *
 * @author Yi Chen
 *
 */
public class Identifier {
    /**
     * The name of the identifier.
     */
    private String name;
    /**
     * The value of ID token.
     */
    private static final int ID = 32;
    /**
     * The number 20.
     */
    private static final int TWENTY = 20;
    /**
     * The existing identifiers.
     */
    private static Identifier[] eIds = new Identifier[TWENTY];
    /**
     * The number of identifiers.
     */
    private static int idCount = 0;
    /**
     * Declared or not.
     */
    private boolean declared;
    /**
     * Initialized or not.
     */
    private boolean initialized;
    /**
     * The value.
     */
    private int val;

    /**
     * Constructor.
     *
     * @param n
     *            the name to declare.
     */
    public Identifier(String n) {
        this.name = n;
        this.declared = false;
        this.initialized = false;
        this.val = 0;
    }

    /**
     * Parses an id. Adds to existing ids if not exist.
     *
     * @param t
     *            the tokenizer.
     * @return an identifier.
     */
    public static Identifier parseID(Tokenizer t) {
        //Error check.
        if (t.getToken() != ID) {
            System.err.println("Illegal identifier");
            return null;
        }
        String var = t.idName();
        t.skipToken();
        //Loops through the eIds to check if the identifier already exists.
        for (Identifier id : eIds) {
            //If it exists, return it.
            if (id != null && id.getIdName().equals(var)) {
                return id;
            }
        }
        //Adds new identifier.
        eIds[idCount] = new Identifier(var);
        idCount++;
        return eIds[idCount - 1];
    }

    /**
     * Returns the name of id.
     *
     * @return the name of the identifier.
     */
    public String getIdName() {
        return this.name;
    }

    /**
     * Sets the identifier to a value.
     *
     * @param n
     *            the value to set identifier.
     */
    public void setIdVal(int n) {
        this.declared = true;
        this.initialized = true;
        this.val = n;
    }

    /**
     *
     * @return the value of the identifier.
     */
    public int getIdVal() {
        if (!this.declared || !this.initialized) {
            System.err.println("Error: Uninitialized identifier");
            return 0;
        }
        return this.val;
    }

    /**
     * Prints out the name of the id.
     *
     * @param out
     *            the output stream.
     */
    public void printIdName(SimpleWriter out) {
        //Error check.
        if (this.name.equals("")) {
            System.err.println("Illegal identifier");
            return;
        }
        out.print(this.name);
    }
}
