package tag;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.PageContext;
import javax.servlet.jsp.tagext.SimpleTagSupport;
import java.io.IOException;
import java.io.StringWriter;
import java.util.HashSet;

public class Censoring extends SimpleTagSupport {

    StringWriter sw = new StringWriter();

    public void doTag() {
        try {
            getJspBody().invoke(sw);
            String text = sw.toString();
            HashSet<String> set = (HashSet<String>) (getJspContext().getAttribute("words", PageContext.APPLICATION_SCOPE));
            int j = 0;
            for(int i = 0; i < text.length(); ++i) {
                j = i;
                while(i < text.length() && !checkDel(i, text)) {
                    ++i;
                }
                if(j < i - 1 && checkWord(text.substring(j, i), set)) {
                    text = text.substring(0, j) + "*beep*" + text.substring(i);
                }
            }
            JspWriter out = getJspContext().getOut();
            out.print(text);
        } catch (JspException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private boolean checkWord (String w, HashSet<String> set) {
        return set.contains(w.toLowerCase());
    }

    private boolean checkDel(int i, String text) {
        char t = text.charAt(i);
        return t == ' ' || t == '.' || t == ',' || t == ';' || t == ':' || t == '-' || t == '!' || t == '?' || t == '\n';
    }
}
