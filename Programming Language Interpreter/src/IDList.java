import java.util.ArrayList;

import components.simplewriter.SimpleWriter;

/**
 * Put a short phrase describing the program here.
 *
 * @author Yi Chen
 *
 */
public class IDList {
    /**
     * The identifier.
     */
    private Identifier id;
    /**
     * The ID list.
     */
    private IDList idlist;
    /**
     * The number corresponding to a comma symbol.
     */
    private static final int COMMA = 13;
    /**
     * The alternative number.
     */
    private int altNo;

    /**
     * Constructor.
     */
    public IDList() {
        this.id = null;
        this.idlist = null;
        this.altNo = 0;
    }

    /**
     * Parses an ID list.
     *
     * @param t
     *            the tokenizer.
     */
    public void parseIDList(Tokenizer t) {
        this.id = Identifier.parseID(t);
        //Decide alternative number.
        if (t.getToken() == COMMA) {
            this.altNo = 2;
            t.skipToken();
            this.idlist = new IDList();
            this.idlist.parseIDList(t);
        } else {
            this.altNo = 1;
        }
    }

    /**
     * Prints an ID list.
     *
     * @param out
     *            the output stream.
     */
    public void printIDList(SimpleWriter out) {
        //Error check.
        if (this.id == null) {
            System.err.println("No identifiers.");
            return;
        }
        this.id.printIdName(out);
        //Check alternative number.
        if (this.altNo == 2) {
            //Error check.
            if (this.idlist == null) {
                System.err.println("Error: No ID list.");
                return;
            }
            out.print(", ");
            this.idlist.printIDList(out);
        }
    }

    /**
     * Produce the list of identifier.
     *
     * @param identifiers
     *            the list of identifiers to be returned.
     * @return the list of all identifiers.
     */
    public ArrayList<Identifier> execIDList(ArrayList<Identifier> identifiers) {
        //Error check.
        if (this.id == null) {
            System.err.println("No identifiers.");
            return identifiers;
        }
        identifiers.add(this.id);
        //Check alternative number.
        if (this.altNo == 2) {
            //Error check.
            if (this.idlist == null) {
                System.err.println("Error: No ID list.");
                return new ArrayList<>();
            }
            this.idlist.execIDList(identifiers);
        }
        return identifiers;
    }
}
