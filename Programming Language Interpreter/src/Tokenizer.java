import java.util.ArrayList;

import components.queue.Queue;
import components.queue.Queue1L;
import components.simplereader.SimpleReader;
import components.simplewriter.SimpleWriter;
import components.simplewriter.SimpleWriter1L;
import components.utilities.FormatChecker;

/**
 * Put a short phrase describing the program here.
 *
 * @author Yi Chen
 *
 */
public final class Tokenizer {
    /**
     * The 11 keywords.
     */
    private String[] keywords;
    /**
     * The 19 special symbols.
     */
    private String[] symbols;
    /**
     * The array list to store all the tokens.
     */
    private ArrayList<String> tokens;
    /**
     * End of file.
     */
    private static final int EOF = 33;
    /**
     * Character limit.
     */
    private static final int LIMIT = 8;
    /**
     * Definition of whitespace separators.
     */
    private static final String SEPARATORS = " \t\n\r";
    /**
     * Token to mark the end of the input. This token cannot come from the input
     * stream because it contains whitespace.
     */
    private static final String END_OF_INPUT = "### END OF INPUT ###";
    /**
     * Every how many items.
     */
    private static final int MOD = 10;
    /**
     * The output stream.
     */
    private SimpleWriter out;
    /**
     * Illegal tokens.
     */
    private String[] illegalTokens;
    /**
     * The position of the cursor.
     */
    private int index;

    /**
     * @param in
     *            The input stream
     */
    public Tokenizer(SimpleReader in) {
        //Initialize the keywords and symbols.
        this.keywords = new String[] { "program", "begin", "end", "int", "if",
                "then", "else", "while", "loop", "read", "write" };
        this.symbols = new String[] { ";", ",", "=", "!", "[", "]", "&&", "||",
                "(", ")", "+", "-", "*", "!=", "==", "<", ">", "<=", ">=" };
        this.illegalTokens = new String[] { "=>", "=<", "=!", "/" };
        this.tokens = new ArrayList<>();
        Queue<String> temp = this.tokens(in);
        while (temp.length() > 0) {
            this.tokens.add(temp.dequeue());
        }
        this.index = 0;
        this.out = new SimpleWriter1L();
    }

    /**
     * Returns the first "word" (maximal length string of characters not in
     * {@code separators}) or "separator string" (maximal length string of
     * characters in {@code separators}) in the given {@code text} starting at
     * the given {@code position}.
     *
     * @param text
     *            the {@code String} from which to get the word or separator
     *            string
     * @param position
     *            the starting index
     * @return the first word or separator string found in {@code text} starting
     *         at index {@code position}
     * @requires 0 <= position < |text|
     * @ensures <pre>
     * nextWordOrSeparator =
     *   text[position, position + |nextWordOrSeparator|)  and
     * if entries(text[position, position + 1)) intersection separators = {}
     * then
     *   entries(nextWordOrSeparator) intersection separators = {}  and
     *   (position + |nextWordOrSeparator| = |text|  or
     *    entries(text[position, position + |nextWordOrSeparator| + 1))
     *      intersection separators /= {})
     * else
     *   entries(nextWordOrSeparator) is subset of separators  and
     *   (position + |nextWordOrSeparator| = |text|  or
     *    entries(text[position, position + |nextWordOrSeparator| + 1))
     *      is not subset of separators)
     * </pre>
     */
    private static String nextWordOrSeparator(String text, int position) {
        assert text != null : "Violation of: text is not null";
        assert 0 <= position : "Violation of: 0 <= position";
        assert position < text.length() : "Violation of: position < |text|";

        String result = text.charAt(position) + "";
        int temp = position + 1;
        boolean sameKind = true;
        if (temp < text.length()) {
            sameKind = SEPARATORS.contains("" + text.charAt(temp))
                    && SEPARATORS.contains("" + text.charAt(temp - 1))
                    || !SEPARATORS.contains("" + text.charAt(temp))
                            && !SEPARATORS.contains("" + text.charAt(temp - 1));
            while (sameKind && temp < text.length()) {

                sameKind = SEPARATORS.contains("" + text.charAt(temp))
                        && SEPARATORS.contains("" + text.charAt(temp - 1))
                        || !SEPARATORS.contains("" + text.charAt(temp))
                                && !SEPARATORS
                                        .contains("" + text.charAt(temp - 1));
                if (sameKind) {
                    temp++;
                }

            }
            String str = text.substring(position + 1, temp);
            result += str;
        } else {
            sameKind = false;
        }
        return result;
    }

    /**
     * Tokenizes the entire input getting rid of all whitespace separators and
     * returning the non-separator tokens in a {@code Queue<String>}.
     *
     * @param in
     *            the input stream
     * @return the queue of tokens
     * @requires in.is_open
     * @ensures <pre>
     * tokens =
     *   [the non-whitespace tokens in #in.content] * <END_OF_INPUT>  and
     * in.content = <>
     * </pre>
     */
    private Queue<String> tokens(SimpleReader in) {
        assert in != null : "Violation of: in is not null";
        assert in.isOpen() : "Violation of: in.is_open";
        Queue<String> tokens = new Queue1L<String>();
        while (!in.atEOS()) {
            String current = in.nextLine();
            int pos = 0;
            for (String illegal : this.illegalTokens) {
                if (current.contains(illegal)) {
                    System.err.println("Error: Illegal token.");
                    break;
                }
            }
            while (pos < current.length()) {
                boolean isKey = false;
                boolean isSymbol = false;
                //Check if it's a keyword.
                for (String key : this.keywords) {
                    if (pos + key.length() <= current.length() && current
                            .substring(pos, pos + key.length()).equals(key)) {
                        tokens.enqueue(key);
                        pos += key.length();
                        isKey = true;
                        break;
                    }
                }
                if (!isKey) {
                    //Checks to see if it's a symbol.
                    for (int i = this.symbols.length - 1; i >= 0; i--) {
                        String symbol = this.symbols[i];
                        if (pos + symbol.length() <= current.length()
                                && current.substring(pos, pos + symbol.length())
                                        .equals(symbol)) {
                            tokens.enqueue(symbol);
                            pos += symbol.length();
                            isSymbol = true;
                            break;
                        }
                    }
                }
                if (!isKey && !isSymbol && pos < current.length()) {
                    String word = nextWordOrSeparator(current, pos);
                    if (SEPARATORS.indexOf(word.charAt(0)) < 0) {
                        //Make sure that there are no symbols.
                        if (!this.isValidIdentifier(word)) {
                            this.checkSymbols(tokens, word);
                        } else {
                            tokens.enqueue(word);
                        }
                    }
                    pos += word.length();
                }
            }
        }
        System.out.println(tokens);
        return tokens;
    }

    /**
     * Check to see if there are symbols so that the tokenizer is correct.
     *
     * @param q
     *            the queue of tokens.
     * @param word
     *            the word to be checked.
     */
    private void checkSymbols(Queue<String> q, String word) {
        int index = 0;
        while (index < word.length()) {
            for (String illegal : this.illegalTokens) {
                if (word.contains(illegal)) {
                    System.err.println("Error: Illegal token.");
                    break;
                }
            }
            boolean isSymbol = false;
            boolean isKey = false;
            for (String key : this.keywords) {
                if (index + key.length() <= word.length() && word
                        .substring(index, index + key.length()).equals(key)) {
                    q.enqueue(key);
                    index += key.length();
                    isKey = true;
                    break;
                }
            }
            if (!isKey) {
                for (int i = this.symbols.length - 1; i >= 0; i--) {
                    String symbol = this.symbols[i];
                    if (index + symbol.length() <= word.length()
                            && word.substring(index, index + symbol.length())
                                    .equals(symbol)) {
                        q.enqueue(symbol);
                        index += symbol.length();
                        isSymbol = true;
                        break;
                    }
                }
            }
            if (!isKey && !isSymbol && index < word.length()) {
                int temp = index;
                while (temp < word.length()
                        && (Character.isUpperCase(word.charAt(temp))
                                || Character.isDigit(word.charAt(temp))
                                || Character.isLowerCase(word.charAt(temp)))) {
                    temp++;
                }
                q.enqueue(word.substring(index, temp));
                //Error message printing.
                if (temp == index) {
                    System.err.println("Error: Illegal Token");
                    break;
                }
                index = temp;
            }
        }
    }

    /**
     * Repeated calls should use the same token.
     *
     * @return info about the current token.
     *
     */
    public int getToken() {
        while (this.index < this.tokens.size()
                && this.tokens.get(this.index).length() == 0) {
            this.index++;
        }
        //If empty, return end of file.
        if (this.index < this.tokens.size()
                && this.tokens.get(this.index).equals(END_OF_INPUT)) {
            return EOF;
        }
        //Check if it is a keyword.
        int i = 1;
        boolean found = false;
        for (int j = 0; j < this.keywords.length; j++) {
            if (this.index < this.tokens.size()
                    && this.keywords[j].equals(this.tokens.get(this.index))) {
                found = true;
                break;
            }
            i++;
        }
        //Check if it is a special symbol.
        if (!found) {
            for (int j = 0; j < this.symbols.length; j++) {
                if (this.index < this.tokens.size() && this.symbols[j]
                        .equals(this.tokens.get(this.index))) {
                    found = true;
                    break;
                }
                i++;
            }
        }
        //Returns 1-30 if either keyword or special symbol.
        if (found) {
            return i;
        }
        //Check for integer format.
        if (this.index < this.tokens.size()
                && FormatChecker.canParseInt(this.tokens.get(this.index))) {
            return EOF - 2;
        }
        //Checks for valid identifier. Throws an error if identifier is not valid.
        if (this.index < this.tokens.size()
                && !this.isValidIdentifier(this.tokens.get(this.index))) {
            System.err.println("Invaild identifier");
            return 0;
        }
        return EOF - 1;
    }

    /**
     * Skips current token. Next token becomes current token. Next call to
     * getToken() will return new token.
     */
    public void skipToken() {
        this.index++;
    }

    /**
     * @return the value of the current (integer) token.
     */
    public int intVal() {
        return Integer.parseInt(this.tokens.get(this.index));
    }

    /**
     * @return the name of the current (id) token.
     */
    public String idName() {
        return this.tokens.get(this.index);
    }

    /**
     * @param id
     *            the identifier to check Checks the validity of the identifier.
     *
     * @return true if identifier is valid and false if not.
     */
    private boolean isValidIdentifier(String id) {
        char[] c = id.toCharArray();
        //Check first character and not more than 8 characters.
        if (c.length > LIMIT || !Character.isUpperCase(c[0])) {
            return false;
        }
        for (int i = 1; i < c.length; i++) {
            //No lower case letters.
            if (Character.isLowerCase(c[i])) {
                return false;
            }
            //No digits in the middle.
            if (Character.isDigit(c[i - 1]) && Character.isUpperCase(c[i])) {
                return false;
            }
            //No special symbols.
            if (!Character.isDigit(c[i]) && !Character.isUpperCase(c[i])) {
                return false;
            }
        }
        return true;
    }

    /**
     * Prints the output.
     */
    public void print() {
        int i = 0;
        while (this.index < this.tokens.size()) {
            this.out.print(this.getToken() + " ");
            this.skipToken();
            i++;
            if (i % MOD == 0) {
                this.out.println();
            }
        }
        this.out.close();
    }
}
