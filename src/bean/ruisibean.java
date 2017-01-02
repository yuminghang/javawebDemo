package bean;

/**
 * Created by ymh on 2017/1/2.
 */
public class ruisibean {
    private String title;
    private String url;
    private String auchor;
    private String num;

    public ruisibean(String title, String url, String auchor, String num) {
        this.title = title;
        this.url = url;
        this.auchor = auchor;
        this.num = num;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public String getAuchor() {
        return auchor;
    }

    public void setAuchor(String auchor) {
        this.auchor = auchor;
    }

    public String getNum() {
        return num;
    }

    @Override
    public String toString() {
        return " [标题]  " + title + "  [链接]  " + url + "  [点击量]  " + num + " +[作者]" + auchor;
    }

    public void setNum(String num) {
        this.num = num;
    }
}
